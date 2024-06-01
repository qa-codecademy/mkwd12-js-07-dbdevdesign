import { Injectable } from '@nestjs/common';
import { InjectEntityManager, InjectRepository } from '@nestjs/typeorm';
import { Playlist } from './playlist.entity';
import { EntityManager, Repository } from 'typeorm';
import { CreatePlaylistWithSongsDto } from './create-playlist-with-songs.dto';

@Injectable()
export class PlaylistService {
  constructor(
    @InjectRepository(Playlist) private playlistRepo: Repository<Playlist>,
    @InjectEntityManager() private entityManager: EntityManager,
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

  createPlaylistWithSongs({ title, song_ids }: CreatePlaylistWithSongsDto) {
    return this.entityManager.query(
      'call create_playlist_with_songs($1, $2);',
      [title, song_ids],
    );
  }
}
