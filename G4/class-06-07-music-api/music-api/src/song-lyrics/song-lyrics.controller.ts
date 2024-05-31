import { Controller } from '@nestjs/common';
import { SongLyricsService } from './song-lyrics.service';

@Controller('song-lyrics')
export class SongLyricsController {
  constructor(private readonly songLyricsService: SongLyricsService) {}
}
