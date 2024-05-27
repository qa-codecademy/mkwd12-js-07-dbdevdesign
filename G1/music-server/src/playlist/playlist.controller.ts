import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { PlaylistService } from './playlist.service';
import { Playlist } from './playlist.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { PlaylistsQueryDto } from './dto/playlist-query.dto';

@ApiTags('playlists')
@Controller('playlists')
export class PlaylistController {
  constructor(private readonly playlistService: PlaylistService) {}

  // @Get()
  // @ApiOperation({ summary: 'Get a list of playlists' })
  // @ApiOkResponse({ description: 'List of playlists', type: [Playlist] })
  // async getPlaylists(
  //   @Query(ValidationPipe) getPlaylistsDto: PlaylistsQueryDto,
  // ): Promise<Playlist[]> {
  //   return this.playlistService.findAll(getPlaylistsDto);
  // }
}
