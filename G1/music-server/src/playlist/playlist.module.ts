import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PlaylistService } from './playlist.service';
import { PlaylistController } from './playlist.controller';
import { Playlist } from './playlist.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Playlist])],
  providers: [PlaylistService],
  controllers: [PlaylistController],
})
export class PlaylistModule {}
