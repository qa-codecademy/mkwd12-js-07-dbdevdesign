import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { SongLyricsService } from './song-lyrics.service';
import { SongLyrics } from './song-lyrics.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { SongLyricsQueryDto } from './dto/song-lyrics.query.dto';

@ApiTags('song-lyrics')
@Controller('song-lyrics')
export class SongLyricsController {
  constructor(private readonly songLyricsService: SongLyricsService) {}

  // @Get()
  // @ApiOperation({ summary: 'Get a list of song lyrics' })
  // @ApiOkResponse({ description: 'List of song lyrics', type: [SongLyrics] })
  // async getSongLyrics(
  //   @Query(ValidationPipe) getSongLyricsDto: SongLyricsQueryDto,
  // ): Promise<SongLyrics[]> {
  //   return this.songLyricsService.findAll(getSongLyricsDto);
  // }
}
