import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Song } from './song.entity';

@Injectable()
export class SongService {
  constructor(@InjectRepository(Song) private songRepo: Repository<Song>) {}

  getSongById(id: number) {
    return this.songRepo.findOne({
      where: { id },
      relations: {
        album: true,
        artist: true,
        songLyrics: true,
        genres: true,
        playlists: true,
      },
    });
  }
}
