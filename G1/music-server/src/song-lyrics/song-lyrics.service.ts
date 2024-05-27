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
}
