import { Module } from '@nestjs/common';
import { SongLyricsService } from './song-lyrics.service';
import { SongLyricsController } from './song-lyrics.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SongLyrics } from './song-lyrics.entity';

@Module({
  imports: [TypeOrmModule.forFeature([SongLyrics])],
  controllers: [SongLyricsController],
  providers: [SongLyricsService],
})
export class SongLyricsModule {}
