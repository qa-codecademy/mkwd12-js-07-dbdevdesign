import { Injectable } from '@nestjs/common';
import { InjectEntityManager, InjectRepository } from '@nestjs/typeorm';
import { EntityManager, Repository } from 'typeorm';
import { Album } from './album.entity';
import { AlbumsQueryDto } from './dto/album-query.dto';

@Injectable()
export class AlbumService {
  constructor(
    @InjectRepository(Album)
    private albumRepository: Repository<Album>,
    @InjectEntityManager()
    private readonly entityManager: EntityManager,
  ) {}

  async findAll(getAlbumsDto: AlbumsQueryDto): Promise<Album[]> {
    const { search, skip, take } = getAlbumsDto;
    const query = this.albumRepository.createQueryBuilder('album');

    if (search) {
      query.andWhere('album.name ILIKE :search', { search: `%${search}%` });
    }

    query.skip(skip).take(take);

    return await query.getMany();
  }

  // 1. Get all albums with their songs and artist data
  async getAllAlbumsWithSongsAndArtists(): Promise<Album[]> {
    return this.albumRepository
      .createQueryBuilder('album')
      .leftJoinAndSelect('album.songs', 'song')
      .leftJoinAndSelect('song.artist', 'artist')
      .leftJoinAndSelect('artist.artistDetails', 'details')
      .getMany();
  }

  // 2. Get albums with a rating greater than a specific value
  async getHighRatedAlbums(rating: number): Promise<Album[]> {
    return this.albumRepository
      .createQueryBuilder('album')
      .where('album.rating > :rating', { rating })
      .getMany();
  }

  // 3. Get the total count of albums
  async getTotalAlbumsCount(): Promise<number> {
    return this.albumRepository.createQueryBuilder('album').getCount();
  }

  // 4. Get distinct albums based on name and rating
  async getDistinctAlbums(): Promise<Album[]> {
    return this.albumRepository
      .createQueryBuilder('album')
      .distinct(true)
      .getMany();
  }

  // 5. Get all albums with details
  async getAllAlbumsWithDetails(): Promise<any> {
    const query = `
      SELECT
        a.id AS album_id,
        a.name AS album_name,
        a.rating AS album_rating,
        s.id AS song_id,
        s.name AS song_name,
        s.duration AS song_duration,
        s.explicit AS song_explicit,
        ar.id AS artist_id,
        ar.name AS artist_name,
        ad.date_of_birth AS artist_dob,
        ad.full_name AS artist_full_name,
        ad.country AS artist_country,
        ad.city AS artist_city,
        ad.is_married AS artist_is_married,
        ad.spouse_name AS artist_spouse_name
      FROM album a
      LEFT JOIN song s ON s.album_id = a.id
      LEFT JOIN artist ar ON s.artist_id = ar.id
      LEFT JOIN artist_details ad ON ad.artist_id = ar.id;
    `;

    return await this.entityManager.query(query);
  }

  // 6. Get albums by a specific artist
  async getAlbumsByArtist(artistId: number): Promise<Album[]> {
    return this.albumRepository
      .createQueryBuilder('album')
      .leftJoinAndSelect('album.songs', 'song')
      .where('song.artist_id = :artistId', { artistId })
      .getMany();
  }

  // 7. Get albums that contain a specific song
  async getAlbumsBySong(songId: number): Promise<Album[]> {
    return this.albumRepository
      .createQueryBuilder('album')
      .leftJoin('album.songs', 'song')
      .where('song.id = :songId', { songId })
      .getMany();
  }
}
