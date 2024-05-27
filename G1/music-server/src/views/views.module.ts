import { Module } from '@nestjs/common';
import { ArtistAlbumViewService } from './artist-album/artist-album.service';
import { ArtistAlbumViewController } from './artist-album/artist-album.controller';

@Module({
  imports: [],
  providers: [ArtistAlbumViewService],
  controllers: [ArtistAlbumViewController],
})
export class ArtistAlbumModule {}
