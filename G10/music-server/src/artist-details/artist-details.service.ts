import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ArtistDetails } from './artist-details.entity';
import { ArtistDetailsQueryDto } from './dto/artist-details-query.dto';

@Injectable()
export class ArtistDetailsService {
  constructor(
    @InjectRepository(ArtistDetails)
    private artistDetailsRepository: Repository<ArtistDetails>,
  ) {}

  async findAll(
    getArtistDetailsDto: ArtistDetailsQueryDto,
  ): Promise<ArtistDetails[]> {
    const { search, skip, take, country, is_married } = getArtistDetailsDto;
    const query =
      this.artistDetailsRepository.createQueryBuilder('artistDetails');

    if (search) {
      query.andWhere('artistDetails.full_name ILIKE :search', {
        search: `%${search}%`,
      });
    }

    if (country) {
      query.andWhere('artistDetails.country = :country', { country });
    }

    if (is_married !== undefined) {
      query.andWhere('artistDetails.is_married = :is_married', {
        is_married: is_married === 'true',
      });
    }

    query.skip(skip).take(take);

    return await query.getMany();
  }
}
