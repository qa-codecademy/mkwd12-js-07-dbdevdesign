import { Controller, Get, Query, ValidationPipe } from '@nestjs/common';
import { AlbumService } from './album.service';
import { Album } from './album.entity';
import { ApiTags, ApiOkResponse, ApiOperation } from '@nestjs/swagger';
import { AlbumsQueryDto } from './dto/album-query.dto';

@ApiTags('albums')
@Controller('albums')
export class AlbumController {
  constructor(private readonly albumService: AlbumService) {}

  // @Get()
  // @ApiOperation({ summary: 'Get a list of albums' })
  // @ApiOkResponse({ description: 'List of albums', type: [Album] })
  // async getAlbums(
  //   @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  // ): Promise<Album[]> {
  //   return this.albumService.findAll(getAlbumsDto);
  // }
}
