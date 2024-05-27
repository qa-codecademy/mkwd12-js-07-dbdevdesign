import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { ArtistService } from './artist.service';
import { Artist } from './artist.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { ArtistsQueryDto } from './dto/artist-query.dto';

@ApiTags('artists')
@Controller('artists')
export class ArtistController {
  constructor(private readonly artistService: ArtistService) {}

  // @Get()
  // @ApiOperation({ summary: 'Get a list of artists' })
  // @ApiOkResponse({ description: 'List of artists', type: [Artist] })
  // async getArtists(
  //   @Query(ValidationPipe) getArtistsDto: ArtistsQueryDto,
  // ): Promise<Artist[]> {
  //   return this.artistService.findAll(getArtistsDto);
  // }
}
