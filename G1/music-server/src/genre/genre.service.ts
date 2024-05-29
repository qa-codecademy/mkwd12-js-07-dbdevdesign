import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Genre } from './genre.entity';
import { GenresQueryDto } from './dto/genre-query.dto';

@Injectable()
export class GenreService {
  constructor(
    @InjectRepository(Genre)
    private genreRepository: Repository<Genre>,
  ) {}

  // Get genres by name term
  // findAll({ search }: GenresQueryDto) {
  //   return this.genreRepository
  //     .createQueryBuilder('genre')
  //     .where('genre.name ILIKE :term', { term: `%${search}%` })
  //     .getMany();
  // }

  // Get genres with more than a certain number of songs
  // findAll(_?: any) {
  //   return this.genreRepository
  //     .createQueryBuilder('genre')
  //     .leftJoinAndSelect('genre.songs', 'song')
  //     .where((qb) => {
  //       const subQuery = qb
  //         .subQuery()
  //         .select('g.id')
  //         .from('genre', 'g')
  //         .leftJoin('g.songs', 'song')
  //         .groupBy('g.id')
  //         .having('COUNT(song.id) > :minSongs', { minSongs: 3 })
  //         .getQuery();

  //       return 'genre.id IN ' + subQuery;
  //     })
  //     .getMany();
  // }

  // Get genres for a specific song
  // findAll(_?: any) {
  //   return this.genreRepository
  //     .createQueryBuilder('genre')
  //     .leftJoin('genre.songs', 'song')
  //     .where('song.id = :songId', { songId: 1 })
  //     .getMany();
  // }

  // findAll(_?: any) {
  //   return this.genreRepository
  //     .createQueryBuilder('genre')
  //     .offset(5)
  //     .limit(2)
  //     .getMany();
  // }

  // Get genres with their songs sorted by the song name
  // findAll(_?: any) {
  //   return this.genreRepository
  //     .createQueryBuilder('genre')
  //     .leftJoinAndSelect('genre.songs', 'song')
  //     .orderBy('song.name', 'ASC')
  //     .addOrderBy('genre.name', 'ASC')
  //     .getMany();
  // }

  findAll(_?: any) {
    return this.genreRepository
      .createQueryBuilder('genre')
      .leftJoinAndSelect('genre.songs', 'song')
      .groupBy('genre.id')
      .having('COUNT(song.id) > :minSongs', { minSongs: 4 })
      .select('genre.id', 'id')
      .addSelect('genre.name', 'name')
      .addSelect('COUNT(song.id)', 'songCount')
      .getRawMany();
  }
}
