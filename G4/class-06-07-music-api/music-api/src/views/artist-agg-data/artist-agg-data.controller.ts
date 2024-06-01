import { Controller, Get } from '@nestjs/common';
import { ArtistAggDataService } from './artist-agg-data.service';

@Controller('artist-agg-data')
export class ArtistAggDataController {
  constructor(private artistAggDataService: ArtistAggDataService) {}

  @Get()
  findMany() {
    return this.artistAggDataService.find();
  }
}
