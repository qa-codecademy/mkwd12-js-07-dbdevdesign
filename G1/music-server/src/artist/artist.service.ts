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

  // findAll({ skip, take, search, country }: ArtistsQueryDto) {
  //   const query = this.artistRepository
  //     .createQueryBuilder('artist')
  //     .leftJoinAndSelect('artist.artistDetails', 'artist_details');

  //   if (search) {
  //     query.andWhere('artist.name ILIKE :name', { name: `%${search}%` });
  //   }

  //   if (country) {
  //     query.andWhere('artist_details.country = :country', { country });
  //   }

  //   return query.getMany();
  // }

  // TODO: Fix this

  findAll(_?: any) {
    return this.artistRepository
      .createQueryBuilder('artist')
      .leftJoin('artist.songs', 'song')
      .groupBy('artist.id')
      .addGroupBy('song.id')
      .orderBy('COUNT(song.id)', 'DESC')
      .select('artist.id')
      .addSelect('artist.name')
      .addSelect('COUNT(song.id) AS song_count')
      .getMany();
  }
}
