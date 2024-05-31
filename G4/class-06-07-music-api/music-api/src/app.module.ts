import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { ConfigModule } from '@nestjs/config';
import { ArtistModule } from './artist/artist.module';
import { PlaylistModule } from './playlist/playlist.module';
import { AlbumModule } from './album/album.module';
import { GenreModule } from './genre/genre.module';
import { ArtistDetailsModule } from './artist-details/artist-details.module';
import { SongModule } from './song/song.module';
import { SongLyricsModule } from './song-lyrics/song-lyrics.module';

@Module({
  imports: [
    ConfigModule.forRoot({ envFilePath: '.env', isGlobal: true }),
    DatabaseModule,
    ArtistModule,
    PlaylistModule,
    AlbumModule,
    GenreModule,
    ArtistDetailsModule,
    SongModule,
    SongLyricsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
