import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { GenreService } from './genre.service';
import { Genre } from './genre.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { GenresQueryDto } from './dto/genre-query.dto';

@ApiTags('genres')
@Controller('genres')
export class GenreController {
  constructor(private readonly genreService: GenreService) {}

  // @Get()
  // @ApiOperation({ summary: 'Get a list of genres' })
  // @ApiOkResponse({ description: 'List of genres', type: [Genre] })
  // async getGenres(
  //   @Query(ValidationPipe) getGenresDto: GenresQueryDto,
  // ): Promise<Genre[]> {
  //   return this.genreService.findAll(getGenresDto);
  // }
}
