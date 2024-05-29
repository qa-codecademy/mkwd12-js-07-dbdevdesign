import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { SongService } from './song.service';
import { Song } from './song.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { SongsQueryDto } from './dto/song-query.dto';

@ApiTags('songs')
@Controller('songs')
export class SongController {
  constructor(private readonly songService: SongService) {}

  // @Get()
  // @ApiOperation({ summary: 'Get a list of songs' })
  // @ApiOkResponse({ description: 'List of songs', type: [Song] })
  // async getSongs(
  //   @Query(ValidationPipe) getSongsDto: SongsQueryDto,
  // ): Promise<Song[]> {
  //   return this.songService.findAll(getSongsDto);
  // }

  // 1. Get all songs with their lyrics
  // @Get()
  // @ApiOperation({ summary: 'Get a list of songs' })
  // @ApiOkResponse({ description: 'List of songs', type: [Song] })
  // async getSongs(
  //   @Query(ValidationPipe) getSongsDto: SongsQueryDto,
  // ): Promise<Song[]> {
  //   return this.songService.getAllSongsWithLyrics();
  // }

  // 2. Get the total count of songs
  // @Get()
  // @ApiOperation({ summary: 'Get a list of songs' })
  // @ApiOkResponse({ description: 'List of songs', type: [Song] })
  // async getSongs(
  //   @Query(ValidationPipe) getSongsDto: SongsQueryDto,
  // ): Promise<number> {
  //   return this.songService.getTotalSongsCount();
  // }

  // 3. Get songs that are not explicit using isNotNull
  // @Get()
  // @ApiOperation({ summary: 'Get a list of songs' })
  // @ApiOkResponse({ description: 'List of songs', type: [Song] })
  // async getSongs(
  //   @Query(ValidationPipe) getSongsDto: SongsQueryDto,
  // ): Promise<Song[]> {
  //   return this.songService.getNonExplicitSongs();
  // }

  // 4. Get all songs along with the genre details
  // @Get()
  // @ApiOperation({ summary: 'Get a list of songs' })
  // @ApiOkResponse({ description: 'List of songs', type: [Song] })
  // async getSongs(
  //   @Query(ValidationPipe) getSongsDto: SongsQueryDto,
  // ): Promise<Song[]> {
  //   return this.songService.getSongsWithGenres();
  // }

  // 5. Get songs with their artist and album data using distinct
  // @Get()
  // @ApiOperation({ summary: 'Get a list of songs' })
  // @ApiOkResponse({ description: 'List of songs', type: [Song] })
  // async getSongs(
  //   @Query(ValidationPipe) getSongsDto: SongsQueryDto,
  // ): Promise<Song[]> {
  //   return this.songService.getDistinctSongsWithArtistAndAlbum();
  // }

  // 6. Get songs by a specific artist
  // @Get()
  // @ApiOperation({ summary: 'Get a list of songs' })
  // @ApiOkResponse({ description: 'List of songs', type: [Song] })
  // async getSongs(
  //   @Query(ValidationPipe) getSongsDto: SongsQueryDto,
  // ): Promise<Song[]> {
  //   const { artistId } = getSongsDto;
  //   return this.songService.getSongsByArtist(artistId);
  // }

  // 7. Get songs by a specific artist and album using andWhere
  // @Get()
  // @ApiOperation({ summary: 'Get a list of songs' })
  // @ApiOkResponse({ description: 'List of songs', type: [Song] })
  // async getSongs(
  //   @Query(ValidationPipe) getSongsDto: SongsQueryDto,
  // ): Promise<Song[]> {
  //   const { artistId, albumId } = getSongsDto;
  //   return this.songService.getSongsByArtistAndAlbum(artistId, albumId);
  // }
}
