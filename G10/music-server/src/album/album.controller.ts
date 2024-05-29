import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { AlbumService } from './album.service';
import { Album } from './album.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { AlbumsQueryDto } from './dto/album-query.dto';

@ApiTags('albums')
@Controller('albums')
export class AlbumController {
  constructor(private readonly albumService: AlbumService) {}

  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<Album[]> {
  //   return this.albumService.findAll(getAlbumsDto);
  // }

  // 1. Get all albums with their songs and artist data
  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<Album[]> {
  //   return this.albumService.getAllAlbumsWithSongsAndArtists();
  // }

  // 2. Get albums with a rating greater than a specific value 
  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<Album[]> {
  //   const { rating } = getAlbumsDto;
  //   return this.albumService.getHighRatedAlbums(rating);
  // }

  // 3. Get the total count of albums
  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<number> {
  //   return this.albumService.getTotalAlbumsCount();
  // }

  // 4. Get distinct albums based on name and rating
  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<Album[]> {
  //   const { rating } = getAlbumsDto;
  //   return this.albumService.getDistinctAlbums();
  // }

  // 5. Get all albums with details
  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<Album[]> {
  //   const { rating } = getAlbumsDto;
  //   return this.albumService.getAllAlbumsWithDetails();
  // }

  // 6. Get albums by a specific artist
  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<Album[]> {
  //   const { artistId } = getAlbumsDto;
  //   return this.albumService.getAlbumsByArtist(+artistId);
  // }

  // 7. Get albums that contain a specific song
  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<Album[]> {
  //   const { songId } = getAlbumsDto;
  //   return this.albumService.getAlbumsBySong(+songId);
  // }
}
