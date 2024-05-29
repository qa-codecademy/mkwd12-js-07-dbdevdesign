import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { SongLyrics } from './song-lyrics.entity';
import { SongLyricsQueryDto } from './dto/song-lyrics.query.dto';

@Injectable()
export class SongLyricsService {
  constructor(
    @InjectRepository(SongLyrics)
    private songLyricsRepository: Repository<SongLyrics>,
  ) {}

  async findAll(getSongLyricsDto: SongLyricsQueryDto): Promise<SongLyrics[]> {
    const { search, skip, take } = getSongLyricsDto;
    const query = this.songLyricsRepository.createQueryBuilder('songLyrics');

    if (search) {
      query.andWhere('songLyrics.lyrics ILIKE :search', {
        search: `%${search}%`,
      });
    }

    query.skip(skip).take(take);

    return await query.getMany();
  }
}
