import { Controller, Get, Param } from '@nestjs/common';
import { ArtistAlbumViewService } from './artist-album.service';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('Artist-Album View')
@Controller('artist-album-view')
export class ArtistAlbumViewController {
  // constructor(
  //   private readonly artistAlbumViewService: ArtistAlbumViewService,
  // ) {}
  // @Get()
  // async getAll() {
  //   return this.artistAlbumViewService.getAll();
  // }
  // @Get(':id')
  // async getByArtistId(@Param('id') id: number) {
  //   return this.artistAlbumViewService.getByArtistId(id);
  // }
  // @Get('rating/:minRating')
  // async getByMinRating(@Param('minRating') minRating: number) {
  //   return this.artistAlbumViewService.getByMinRating(minRating);
  // }
  // @Get('distinct')
  // async getDistinct() {
  //   return this.artistAlbumViewService.getDistinctArtistsWithAlbums();
  // }
}
