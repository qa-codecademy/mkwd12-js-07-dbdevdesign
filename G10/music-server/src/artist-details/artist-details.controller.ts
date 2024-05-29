import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { ArtistDetailsService } from './artist-details.service';
import { ArtistDetails } from './artist-details.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { ArtistDetailsQueryDto } from './dto/artist-details-query.dto';

@ApiTags('artist-details')
@Controller('artist-details')
export class ArtistDetailsController {
  constructor(private readonly artistDetailsService: ArtistDetailsService) {}

  // @Get()
  // @ApiOperation({ summary: 'Get a list of artist details' })
  // @ApiOkResponse({
  //   description: 'List of artist details',
  //   type: [ArtistDetails],
  // })
  // async getArtistDetails(
  //   @Query(ValidationPipe) getArtistDetailsDto: ArtistDetailsQueryDto,
  // ): Promise<ArtistDetails[]> {
  //   return this.artistDetailsService.findAll(getArtistDetailsDto);
  // }
}
