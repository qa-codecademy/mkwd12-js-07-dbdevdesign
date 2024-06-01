import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { PlaylistService } from './playlist.service';
import { CreatePlaylistWithSongsDto } from './create-playlist-with-songs.dto';

@Controller('playlist')
export class PlaylistController {
  constructor(private readonly playlistService: PlaylistService) {}

  @Get('/agg-data/:id')
  getPlaylistAggData(@Param('id') id: string) {
    return this.playlistService.getPlaylistAggData(Number(id));
  }

  @Post()
  createPlaylistWithSongs(@Body() body: CreatePlaylistWithSongsDto) {
    return this.playlistService.createPlaylistWithSongs(body);
  }
}
