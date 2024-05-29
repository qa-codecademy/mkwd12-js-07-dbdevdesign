import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SongLyricsService } from './song-lyrics.service';
import { SongLyricsController } from './song-lyrics.controller';
import { SongLyrics } from './song-lyrics.entity';

@Module({
  imports: [TypeOrmModule.forFeature([SongLyrics])],
  providers: [SongLyricsService],
  controllers: [SongLyricsController],
})
export class SongLyricsModule {}
