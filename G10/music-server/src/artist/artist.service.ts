import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Artist } from './artist.entity';
import { ArtistsQueryDto } from './dto/artist-query.dto';

@Injectable()
export class ArtistService {
  constructor(
    @InjectRepository(Artist)
    private artistRepository: Repository<Artist>,
  ) {}

  async findAll(getArtistsDto: ArtistsQueryDto): Promise<Artist[]> {
    const { search, skip, take, country } = getArtistsDto;
    const query = this.artistRepository.createQueryBuilder('artist');

    if (search) {
      query.andWhere('artist.name ILIKE :search', { search: `%${search}%` });
    }

    if (country) {
      query.andWhere('artist.country = :country', { country });
    }

    query.skip(skip);
    query.take(take);

    return await query.getMany();
  }

  // 1. Get all artists with their details
  async getAllArtistsWithDetails(): Promise<Artist[]> {
    return this.artistRepository
      .createQueryBuilder('artist')
      .leftJoinAndSelect('artist.artistDetails', 'details')
      .getMany();
  }

  // 2. Get artists who are married
  async getMarriedArtists(): Promise<Artist[]> {
    return this.artistRepository
      .createQueryBuilder('artist')
      .leftJoinAndSelect('artist.artistDetails', 'details')
      .where('details.is_married = true')
      .getMany();
  }
  
  // 3. Get the total number of artists
  async getTotalArtistsCount(): Promise<number> {
    return this.artistRepository.createQueryBuilder('artist').getCount();
  }

  // 4. Get artists ordered by the number of songs they have
  async getArtistsOrderedBySongCount(): Promise<Artist[]> {
    return this.artistRepository
      .createQueryBuilder('artist')
      .leftJoin('artist.songs', 'song')
      .groupBy('artist.id')
      .orderBy('COUNT(song.id)', 'DESC')
      .getMany();
  }

  // 5. Get artists by country
  async getArtistsByCountry(country: string): Promise<Artist[]> {
    return this.artistRepository
      .createQueryBuilder('artist')
      .leftJoinAndSelect('artist.artistDetails', 'details')
      .where('details.country = :country', { country })
      .getMany();
  }

  // 6. Get artists by country using ILIKE for case-insensitive matching
  async getArtistsByCountryILike(country: string): Promise<Artist[]> {
    return this.artistRepository
      .createQueryBuilder('artist')
      .leftJoinAndSelect('artist.artistDetails', 'details')
      .where('details.country ILIKE :country', { country: `%${country}%` })
      .getMany();
  }

  // 7. Get all artists with their details using distinct
  async getAllArtistsWithDetailsDistinct(): Promise<Artist[]> {
    return this.artistRepository
      .createQueryBuilder('artist')
      .leftJoinAndSelect('artist.artistDetails', 'details')
      .distinct(true)
      .getMany();
  }
  
}
