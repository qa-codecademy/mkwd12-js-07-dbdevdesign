import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Song } from './song.entity';
import { SongsQueryDto } from './dto/song-query.dto';

@Injectable()
export class SongService {
  constructor(
    @InjectRepository(Song)
    private songRepository: Repository<Song>,
  ) {}

  async findAll(songsQueryDto: SongsQueryDto): Promise<Song[]> {
    const { search, skip, take, explicit } = songsQueryDto;
    const query = this.songRepository.createQueryBuilder('song');

    if (search) {
      query.andWhere('song.name ILIKE :search', { search: `%${search}%` });
    }

    if (explicit) {
      query.andWhere('song.explicit = :explicit', {
        explicit,
      });
    }

    query.skip(skip);
    query.take(take);

    return await query.getMany();
  }

  // 1. Get all songs with their lyrics
  async getAllSongsWithLyrics(): Promise<Song[]> {
    return this.songRepository
      .createQueryBuilder('song')
      .leftJoinAndSelect('song.songLyrics', 'lyrics')
      .getMany();
  }

  // 2. Get the total count of songs
  async getTotalSongsCount(): Promise<number> {
    return this.songRepository.createQueryBuilder('song').getCount();
  }

  // 3. Get songs that are not explicit using isNotNull
  async getNonExplicitSongs(): Promise<Song[]> {
    return this.songRepository
      .createQueryBuilder('song')
      .where('song.explicit IS NOT NULL')
      .andWhere('song.explicit = false')
      .getMany();
  }

  // 4. Get all songs along with the genre details
  async getSongsWithGenres(): Promise<any> {
    const query = `
      SELECT
        s.id AS song_id,
        s.name AS song_name,
        s.duration AS song_duration,
        s.explicit AS song_explicit,
        g.id AS genre_id,
        g.name AS genre_name
      FROM song s
      LEFT JOIN songs_genres sg ON sg.song_id = s.id
      LEFT JOIN genre g ON sg.genre_id = g.id;
    `;

    return await this.songRepository.query(query);
  }

  // 5. Get songs with their artist and album data using distinct
  async getDistinctSongsWithArtistAndAlbum(): Promise<Song[]> {
    return this.songRepository
      .createQueryBuilder('song')
      .leftJoinAndSelect('song.artist', 'artist')
      .leftJoinAndSelect('song.album', 'album')
      .distinct(true)
      .getMany();
  }

  // 6. Get songs by a specific artist
  async getSongsByArtist(artistId: number): Promise<Song[]> {
    return this.songRepository
      .createQueryBuilder('song')
      .where('song.artist_id = :artistId', { artistId })
      .getMany();
  }

  // 7. Get songs by a specific artist and album using andWhere
  async getSongsByArtistAndAlbum(
    artistId: number,
    albumId: number,
  ): Promise<Song[]> {
    return this.songRepository
      .createQueryBuilder('song')
      .where('song.artist_id = :artistId', { artistId })
      .andWhere('song.album_id = :albumId', { albumId })
      .getMany();
  }
}
