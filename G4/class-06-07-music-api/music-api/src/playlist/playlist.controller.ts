import { Controller, Get, Param } from '@nestjs/common';
import { PlaylistService } from './playlist.service';

@Controller('playlist')
export class PlaylistController {
  constructor(private readonly playlistService: PlaylistService) {}

  @Get('/agg-data/:id')
  getPlaylistAggData(@Param('id') id: string) {
    return this.playlistService.getPlaylistAggData(Number(id));
  }
}
