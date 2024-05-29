import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToOne,
  PrimaryGeneratedColumn,
  Timestamp,
} from 'typeorm';
import { Status } from './trip.interface';
import { BudgetORMEntity } from 'src/budget/entity/budget.entity';
import { UserORMEntity } from 'src/users/entity/users.entity';

@Entity({ name: 'trip' }) //the name of the table
export class TripORMEntity {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @OneToOne(() => BudgetORMEntity, (budget) => budget.trip)
  budget: BudgetORMEntity;

  @Column()
  destination: string;

  @Column()
  notes: string;

  @Column()
  status: Status;

  @Column({
    type: 'bigint',
    name: 'start_date',
    // length: 10
  })
  startDate: Timestamp; // Timestamp

  @Column({
    type: 'bigint',
    name: 'end_date',
  })
  endDate: Timestamp; // Timestamp

  @Column({
    type: 'bigint',
    name: 'created_at',
  })
  createdAt: Timestamp; // Timestamp

  @Column({
    type: 'bigint',
    nullable: true,
    name: 'updated_at',
  })
  updatedAt: Timestamp | null; // Timestamp

  @ManyToOne(() => UserORMEntity, (user) => user.trips)
  @JoinColumn({ name: 'user_id' })
  user: UserORMEntity;
}
