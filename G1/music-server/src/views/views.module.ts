import { Module } from '@nestjs/common';
import { ArtistAlbumViewService } from './artist-album/artist-album.service';
import { ArtistAlbumViewController } from './artist-album/artist-album.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ArtistAlbumView } from './artist-album/artist-album.view-entity';

@Module({
  imports: [TypeOrmModule.forFeature([ArtistAlbumView])],
  providers: [ArtistAlbumViewService],
  controllers: [ArtistAlbumViewController],
})
export class ArtistAlbumModule {}
