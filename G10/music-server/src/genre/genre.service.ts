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

  async findAll(getGenresDto: GenresQueryDto): Promise<Genre[]> {
    const { search, skip, take } = getGenresDto;
    const query = this.genreRepository.createQueryBuilder('genre');

    if (search) {
      query.andWhere('genre.name ILIKE :search', { search: `%${search}%` });
    }

    query.skip(skip).take(take);

    return await query.getMany();
  }

  // 1. Get all genres
  async getAllGenres(): Promise<Genre[]> {
    return this.genreRepository.createQueryBuilder('genre').getMany();
  }

  // 2. Get the total count of genres
  async getTotalGenresCount(): Promise<number> {
    return this.genreRepository.createQueryBuilder('genre').getCount();
  }

  // 2. Get genres by name pattern
  async getGenresByNamePattern(pattern: string): Promise<Genre[]> {
    return this.genreRepository
      .createQueryBuilder('genre')
      .where('genre.name LIKE :pattern', { pattern: `%${pattern}%` })
      .getMany();
  }

  // 3. Get genres with their songs sorted by the song name
  async getGenresWithSongsSortedByName(): Promise<Genre[]> {
    return this.genreRepository
      .createQueryBuilder('genre')
      .leftJoinAndSelect('genre.songs', 'song')
      .orderBy('song.name', 'ASC')
      .getMany();
  }

  // 4. Get genres for a specific song
  async getGenresForSong(songId: number): Promise<Genre[]> {
    return this.genreRepository
      .createQueryBuilder('genre')
      .leftJoin('genre.songs', 'song')
      .where('song.id = :songId', { songId })
      .getMany();
  }

  // 5. Get genres by name pattern using ILIKE
  async getGenresByNamePatternILike(pattern: string): Promise<Genre[]> {
    return this.genreRepository
      .createQueryBuilder('genre')
      .where('genre.name ILIKE :pattern', { pattern: `%${pattern}%` })
      .getMany();
  }

}
