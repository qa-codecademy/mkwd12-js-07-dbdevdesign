import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { PlaylistService } from './playlist.service';
import { Playlist } from './playlist.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { PlaylistsQueryDto } from './dto/playlist-query.dto';

@ApiTags('playlists')
@Controller('playlists')
export class PlaylistController {
  constructor(private readonly playlistService: PlaylistService) {}

  // http://localhost:3000/api/playlists?search=Balkan%20Beats  // The %20 is the URL encoding for a space character
  // @Get()
  // @ApiOperation({ summary: 'Get a list of playlists' })
  // @ApiOkResponse({ description: 'List of playlists', type: [Playlist] })
  // async getPlaylists(
  //   @Query(ValidationPipe) getPlaylistsDto: PlaylistsQueryDto,
  // ): Promise<Playlist[]> {
  //   return this.playlistService.findAll(getPlaylistsDto);
  // }

  // 1. Get all playlists with their songs
  // @Get()
  // @ApiOperation({ summary: 'Get a list of playlists' })
  // @ApiOkResponse({ description: 'List of playlists', type: [Playlist] })
  // async getPlaylists(
  //   @Query(ValidationPipe) getPlaylistsDto: PlaylistsQueryDto,
  // ): Promise<Playlist[]> {
  //   return this.playlistService.getAllPlaylistsWithSongs();
  // }

  // 2. Get the total count of playlists
  // @Get()
  // @ApiOperation({ summary: 'Get a list of playlists' })
  // @ApiOkResponse({ description: 'List of playlists', type: [Playlist] })
  // async getPlaylists(
  //   @Query(ValidationPipe) getPlaylistsDto: PlaylistsQueryDto,
  // ): Promise<number> {
  //   return this.playlistService.getTotalPlaylistsCount();
  // }

  // 3. Get playlists containing a specific song
  // @Get()
  // @ApiOperation({ summary: 'Get a list of playlists' })
  // @ApiOkResponse({ description: 'List of playlists', type: [Playlist] })
  // async getPlaylists(
  //   @Query(ValidationPipe) getPlaylistsDto: PlaylistsQueryDto,
  // ): Promise<Playlist[]> {
  //   const { songId } = getPlaylistsDto;
  //   return this.playlistService.getPlaylistsBySong(+songId);
  // }

}
