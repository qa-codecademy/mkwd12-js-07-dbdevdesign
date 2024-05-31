import { Controller, Get } from '@nestjs/common';
import { ArtistService } from './artist.service';

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
}
