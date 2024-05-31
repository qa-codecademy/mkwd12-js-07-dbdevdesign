import { Controller, Get, Param } from '@nestjs/common';
import { SongService } from './song.service';

@Controller('song')
export class SongController {
  constructor(private readonly songService: SongService) {}

  @Get(':id')
  getSongById(@Param('id') id: string) {
    return this.songService.getSongById(Number(id));
  }
}
