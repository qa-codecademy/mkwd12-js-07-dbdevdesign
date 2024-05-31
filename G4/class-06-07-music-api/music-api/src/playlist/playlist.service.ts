import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Playlist } from './playlist.entity';
import { Repository } from 'typeorm';

@Injectable()
export class PlaylistService {
  constructor(
    @InjectRepository(Playlist) private playlistRepo: Repository<Playlist>,
  ) {}

  getPlaylistAggData(playlistId: number) {
    return this.playlistRepo
      .createQueryBuilder('playlist')
      .leftJoinAndSelect('playlist.songs', 'song')
      .where('playlist.id = :playlistId', { playlistId })
      .groupBy('playlist.title')
      .select('playlist.title')
      .addSelect('COUNT(song.id)', 'song_count')
      .addSelect('SUM(song.duration)', 'song_duration')
      .getRawOne();
  }
}
