import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common';
import { ArtistService } from './artist.service';
import { CreateArtistWithDetailsDto } from './create-artist-with-details.dto.ts';

@Controller('artist')
export class ArtistController {
  constructor(private readonly artistService: ArtistService) {}

  @Get()
  getAllArtists() {
    return this.artistService.getAllArtists();
  }

  @Get('/details')
  getAllArtistsWithDetails() {
    return this.artistService.getAllArtistsWithDetails();
  }

  @Get('/albums')
  getAllArtistsAndAlbumNames() {
    return this.artistService.getAristAndAlbumNames();
  }

  @Get('/song-count')
  getArtistSongCount(@Query('name') artistName: string) {
    return this.artistService.getArtistSongCount(artistName);
  }

  @Post()
  createArtistWithDetails(@Body() body: CreateArtistWithDetailsDto) {
    return this.artistService.createArtistWithDetails(body);
  }
}
