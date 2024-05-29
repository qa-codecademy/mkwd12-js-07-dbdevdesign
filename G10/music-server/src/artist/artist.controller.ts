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

  // 1. Get all artists with their details
  // @Get()
  // @ApiOperation({ summary: 'Get a list of artists' })
  // @ApiOkResponse({ description: 'List of artists', type: [Artist] })
  // async getArtists(
  //   @Query(ValidationPipe) getArtistsDto: ArtistsQueryDto,
  // ): Promise<Artist[]> {
  //   return this.artistService.getAllArtistsWithDetails();
  // }

  // 2. Get artists who are married
  // @Get()
  // @ApiOperation({ summary: 'Get a list of artists' })
  // @ApiOkResponse({ description: 'List of artists', type: [Artist] })
  // async getArtists(
  //   @Query(ValidationPipe) getArtistsDto: ArtistsQueryDto,
  // ): Promise<Artist[]> {
  //   return this.artistService.getMarriedArtists();
  // }

  // 3. Get the total number of artists
  // @Get()
  // @ApiOperation({ summary: 'Get a list of artists' })
  // @ApiOkResponse({ description: 'List of artists', type: [Artist] })
  // async getArtists(
  //   @Query(ValidationPipe) getArtistsDto: ArtistsQueryDto,
  // ): Promise<number> {
  //   return this.artistService.getTotalArtistsCount();
  // }

  // 4. Get artists ordered by the number of songs they have
  //  @Get()
  //  @ApiOperation({ summary: 'Get a list of artists' })
  //  @ApiOkResponse({ description: 'List of artists', type: [Artist] })
  //  async getArtists(
  //    @Query(ValidationPipe) getArtistsDto: ArtistsQueryDto,
  //  ): Promise<Artist[]> {
  //    return this.artistService.getArtistsOrderedBySongCount();
  //  }

  // 5. Get artists by country
  //  @Get()
  //  @ApiOperation({ summary: 'Get a list of artists' })
  //  @ApiOkResponse({ description: 'List of artists', type: [Artist] })
  //  async getArtists(
  //    @Query(ValidationPipe) getArtistsDto: ArtistsQueryDto,
  //  ): Promise<Artist[]> {
  //   const { country } = getArtistsDto;
  //    return this.artistService.getArtistsByCountry(country);
  //  }

  // 6. Get artists by country using ILIKE for case-insensitive matching
  //  @Get()
  //  @ApiOperation({ summary: 'Get a list of artists' })
  //  @ApiOkResponse({ description: 'List of artists', type: [Artist] })
  //  async getArtists(
  //    @Query(ValidationPipe) getArtistsDto: ArtistsQueryDto,
  //  ): Promise<Artist[]> {
  //   const { country } = getArtistsDto;
  //    return this.artistService.getArtistsByCountryILike(country);
  //  }

    // 7. Get all artists with their details using distinct
  //  @Get()
  //  @ApiOperation({ summary: 'Get a list of artists' })
  //  @ApiOkResponse({ description: 'List of artists', type: [Artist] })
  //  async getArtists(
  //    @Query(ValidationPipe) getArtistsDto: ArtistsQueryDto,
  //  ): Promise<Artist[]> {
  //    return this.artistService.getAllArtistsWithDetailsDistinct();
  //  }
}
