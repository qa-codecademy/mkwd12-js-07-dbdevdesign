import { Module } from '@nestjs/common';
import { ArtistModule } from './artist/artist.module';
import { ArtistDetailsModule } from './artist-details/artist-details.module';
import { PlaylistModule } from './playlist/playlist.module';
import { SongModule } from './song/song.module';
import { SongLyricsModule } from './song-lyrics/song-lyrics.module';
import { GenreModule } from './genre/genre.module';
import { AlbumModule } from './album/album.module';
import { ConfigModule } from '@nestjs/config';
import { DatabaseModule } from './database/database.module';
import { ArtistAlbumModule } from './views/views.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    DatabaseModule,
    ArtistModule,
    ArtistDetailsModule,
    PlaylistModule,
    SongModule,
    SongLyricsModule,
    GenreModule,
    AlbumModule,
    DatabaseModule,
    ArtistAlbumModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
