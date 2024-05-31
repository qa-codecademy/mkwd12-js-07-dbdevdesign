import { Controller, Get } from '@nestjs/common';
import { ArtistDetailsService } from './artist-details.service';

@Controller('artist-details')
export class ArtistDetailsController {
  constructor(private readonly artistDetailsService: ArtistDetailsService) {}

  @Get()
  getAllArtistDetails() {
    return this.artistDetailsService.getAllArtistDetails();
  }
}
