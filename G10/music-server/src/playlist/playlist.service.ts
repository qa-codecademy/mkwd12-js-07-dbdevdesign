import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Playlist } from './playlist.entity';
import { PlaylistsQueryDto } from './dto/playlist-query.dto';

@Injectable()
export class PlaylistService {
  constructor(
    @InjectRepository(Playlist)
    private playlistRepository: Repository<Playlist>,
  ) {}

  async findAll(getPlaylistsDto: PlaylistsQueryDto): Promise<Playlist[]> {
    const { search, skip, take } = getPlaylistsDto;
    const query = this.playlistRepository.createQueryBuilder('playlist');

    if (search) {
      query.andWhere('playlist.title ILIKE :search', { search: `%${search}%` });
    }

    query.skip(skip).take(take);

    return await query.getMany();
  }

  // 1. Get all playlists with their songs
  async getAllPlaylistsWithSongs(): Promise<Playlist[]> {
    return this.playlistRepository
      .createQueryBuilder('playlist')
      .leftJoinAndSelect('playlist.songs', 'song')
      .getMany();
  }

  // 2. Get the total count of playlists
  async getTotalPlaylistsCount(): Promise<number> {
    return this.playlistRepository.createQueryBuilder('playlist').getCount();
  }

  // 3. Get playlists containing a specific song
  async getPlaylistsBySong(songId: number): Promise<Playlist[]> {
    return this.playlistRepository
      .createQueryBuilder('playlist')
      .leftJoin('playlist.songs', 'song')
      .where('song.id = :songId', { songId })
      .getMany();
  }
}
