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

  // 1. Get all genres
  // @Get()
  // @ApiOperation({ summary: 'Get a list of genres' })
  // @ApiOkResponse({ description: 'List of genres', type: [Genre] })
  // async getGenres(
  //   @Query(ValidationPipe) getGenresDto: GenresQueryDto,
  // ): Promise<Genre[]> {
  //   return this.genreService.getAllGenres();
  // }

  // 2. Get the total count of genres
  // @Get()
  // @ApiOperation({ summary: 'Get a list of genres' })
  // @ApiOkResponse({ description: 'List of genres', type: [Genre] })
  // async getGenres(
  //   @Query(ValidationPipe) getGenresDto: GenresQueryDto,
  // ): Promise<number> {
  //   return this.genreService.getTotalGenresCount();
  // }

  // 3. Get genres with their songs sorted by the song name
  // @Get()
  // @ApiOperation({ summary: 'Get a list of genres' })
  // @ApiOkResponse({ description: 'List of genres', type: [Genre] })
  // async getGenres(
  //   @Query(ValidationPipe) getGenresDto: GenresQueryDto,
  // ): Promise<Genre[]> {
  //   return this.genreService.getGenresWithSongsSortedByName();
  // }

  // 4. Get genres for a specific song
  // @Get()
  // @ApiOperation({ summary: 'Get a list of genres' })
  // @ApiOkResponse({ description: 'List of genres', type: [Genre] })
  // async getGenres(
  //   @Query(ValidationPipe) getGenresDto: GenresQueryDto,
  // ): Promise<Genre[]> {
  //   const { songId } = getGenresDto
  //   return this.genreService.getGenresForSong(+songId);
  // }

  // 5. Get genres for a specific song
  // @Get()
  // @ApiOperation({ summary: 'Get a list of genres' })
  // @ApiOkResponse({ description: 'List of genres', type: [Genre] })
  // async getGenres(
  //   @Query(ValidationPipe) getGenresDto: GenresQueryDto,
  // ): Promise<Genre[]> {
  //   const { pattern } = getGenresDto
  //   return this.genreService.getGenresByNamePatternILike(pattern);
  // }
}
