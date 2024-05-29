import {
  Controller,
  Get,
  Query,
  UsePipes,
  ValidationPipe,
} from '@nestjs/common';
import { SongService } from './song.service';
import { Song } from './song.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { SongsQueryDto } from './dto/song-query.dto';

@UsePipes(
  new ValidationPipe({
    transform: true,
  }),
)
@ApiTags('songs')
@Controller('songs')
export class SongController {
  constructor(private readonly songService: SongService) {}

  @Get()
  @ApiOperation({ summary: 'Get a list of songs' })
  @ApiOkResponse({ description: 'List of songs', type: [Song] })
  async getSongs(@Query() getSongsDto: SongsQueryDto) {
    return this.songService.findAll(getSongsDto);
  }
}
