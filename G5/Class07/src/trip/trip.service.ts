import { Injectable, HttpException, NotFoundException } from '@nestjs/common';
import {
  Budget,
  Trip,
  TripCreationProps,
  TripToUpdate,
  UpdateTripProps,
} from './entity/trip/trip.interface';
import { InjectRepository } from '@nestjs/typeorm';
import { TripORMEntity } from './entity/trip/trip.entity';
import { Repository } from 'typeorm';
import { BudgetORMEntity } from 'src/budget/entity/budget.entity';
import { UsersService } from 'src/users/users.service';
import { tripQueries } from './queries';

@Injectable()
export class TripService {
  constructor(
    @InjectRepository(TripORMEntity)
    private tripRepository: Repository<TripORMEntity>,

    @InjectRepository(BudgetORMEntity)
    private budgetRepository: Repository<BudgetORMEntity>,

    private userService: UsersService,
  ) {}

  async getTrips(userID: number) {
    // #EXAMPLE 1
    // const queryBuilder = this.tripRepository.createQueryBuilder('trip');
    // const trips = await queryBuilder
    //   .innerJoinAndSelect('trip.budget', 'budget')
    //   .where('trip.user_id = :id', { id: userID })
    //   .getMany();
    // console.log('Trips', trips);
    // return trips;
    // #EXAMPLE 2

    // userID = 'DROP TABLE trip';
    /**
     *  SELECT trip.*, budget.*
      FROM trip
      INNER JOIN budget ON trip.id = budget.trip_id
      WHERE trip.user_id = 'DROP TABLE trip'
     */
    // NOT RECOMMENDED APPROACH
    const queryOne = `
      SELECT trip.*, budget.*
      FROM trip
      INNER JOIN budget ON trip.id = budget.trip_id
      WHERE trip.user_id = ${userID}
    `;

    // BETTER WAY
    const queryTwo = `
      SELECT trip.*, budget.*
      FROM trip
      INNER JOIN budget ON trip.id = budget.trip_id
      WHERE trip.user_id = $1
    `;

    const rawTrip = await this.tripRepository.query(queryTwo, [userID]);
    // TODO: Create a mapper that will transform the RAW trip into our trip data structure
    return rawTrip;
  }

  async createTrip(tripCreationProps: TripCreationProps, userID: number) {
    // const tripInsertionQuery = tripQueries.CREATE_TRIP;
    const tripInsertionQuery = `
    INSERT INTO trip (destination, notes, status, user_id, start_date, end_date, created_at, updated_at)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id`;

    const response = await this.tripRepository.query(tripInsertionQuery, [
      tripCreationProps.destination,
      tripCreationProps.notes,
      tripCreationProps.status,
      userID,
      tripCreationProps.startDate,
      tripCreationProps.endDate,
      Date.now(),
      null,
    ]);

    console.log('Response trip', response);

    const [tripResponse] = response;
    const tripID = tripResponse.id;

    const budgetInsertionQuery = `
    INSERT INTO budget (amount, currency, trip_id)
    VALUES ($1, $2, $3)
    `;

    await this.budgetRepository.query(budgetInsertionQuery, [
      tripCreationProps.budget.amount,
      tripCreationProps.budget.currency,
      tripID,
    ]);

    return tripID;
  }

  async getTrip(id: string) {
    const trip = await this.tripRepository.findOne({
      where: { id: id }, // trip.id === id
      relations: ['budget'],
    });

    if (!trip) {
      throw new HttpException(`Trip with id: ${id} is not found`, 404);
    }

    return trip;
  }

  async removeTrip(id: string) {
    const trip = await this.getTrip(id);
    const budgetID = trip.budget.id;

    // 1. DELETE THE CORESPONDING BUDGET OF THE TRIP
    await this.budgetRepository.delete({ id: budgetID });
    // 2. REMOVE THE ACTUAL TRIP
    const response = await this.tripRepository.delete({ id: id }); // trip.id === id
    console.log(response);

    if (!response.affected) {
      throw new NotFoundException(`Trip with id: ${id} was not found.`);
    }
  }

  async updateTrip(id: string, updateTripProps: UpdateTripProps) {
    // GET THE TRIP
    const trip = await this.tripRepository.findOne({
      where: { id: id },
      relations: ['budget'],
    });
    // GET BUDGET ID FROM THE TRIP
    const budgetId = trip.budget.id;
    // UPDATE BUDGET

    const { budget, ...rest } = updateTripProps;
    await this.budgetRepository.update({ id: budgetId }, budget);

    // TODO: SET updatedAt
    const response = await this.tripRepository.update({ id: id }, rest);

    if (!response.affected) {
      throw new NotFoundException(`Trip with id: ${id} was not found.`);
    }
  }

  async getUserTripCount(userID: number) {
    console.log('USER ID: ', userID);
    // SAME GOES WITH VIEW, just write the name of the view itself.
    const query = `
      SELECT * FROM get_trip_count_per_user($1)
    `;

    const response = await this.tripRepository.query(query, [userID]);
    console.log('RESPONSE FROM TRIP COUNT', response);

    const [userCount] = response;

    return userCount.get_trip_count_per_user;

    // WITH QUERY BUILDER
    // WIP: Improve it since it is not calling the function

    // const response = await this.tripRepository
    //   .createQueryBuilder('get_trip_count_per_user($1)')
    //   .setParameter('p_user_id', userID)
    //   .getMany();

    // console.log(response);
  }
}
