import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { AlbumModule } from './album/album.module';
import { ArtistModule } from './artist/artist.module';
import { ArtistDetailsModule } from './artist-details/artist-details.module';
import { GenreModule } from './genre/genre.module';
import { PlaylistModule } from './playlist/playlist.module';
import { SongModule } from './song/song.module';
import { SongLyricsModule } from './song-lyrics/song-lyrics.module';
import { DatabaseModule } from './database/database.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, // makes the config module accessible through the whole app
    }),
    AlbumModule,
    ArtistModule,
    ArtistDetailsModule,
    GenreModule,
    PlaylistModule,
    SongModule,
    SongLyricsModule,
    DatabaseModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
