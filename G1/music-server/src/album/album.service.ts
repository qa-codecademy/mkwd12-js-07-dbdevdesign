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

  // async findAll(albumsQueryDto: AlbumsQueryDto) {
  //   const query = this.albumRepository.createQueryBuilder('album');

  //   if (albumsQueryDto.search) {
  //     query.where('album.name ILIKE :searchTerm', {
  //       searchTerm: `%${albumsQueryDto.search}%`,
  //     });
  //   }

  //   query.skip(albumsQueryDto.skip).take(albumsQueryDto.take);

  //   const [albums, count] = await query.getManyAndCount();

  //   return {
  //     payload: albums,
  //     total: count,
  //   };
  // }

  // findAll(query?: any) {
  //   return this.albumRepository
  //     .createQueryBuilder('album')
  //     .leftJoinAndSelect('album.songs', 'song')
  //     .leftJoinAndSelect('song.artist', 'artist')
  //     .leftJoinAndSelect('artist.artistDetails', 'artist_details')
  //     .getMany();
  // }

  // findAll(query?: any) {
  //   return this.albumRepository.createQueryBuilder('album').getCount();
  // }

  // findAll(query?: any) {
  //   return this.albumRepository
  //     .createQueryBuilder('album')
  //     .where('album.id = :id', { id: 5312 })
  //     .getOneOrFail();
  // }

  // findAll(query?: any) {
  //   const albumsWithSongs = this.albumRepository
  //     .createQueryBuilder('album')
  //     .leftJoinAndSelect('album.songs', 'song')
  //     .select('album.id')
  //     .getQuery();

  //   const albumsWithPlaylists = this.albumRepository
  //     .createQueryBuilder('album')
  //     .leftJoin('album.songs', 'song')
  //     .leftJoin('song.playlists', 'playlist')
  //     .select('album.id')
  //     .getQuery();

  //   return this.albumRepository
  //     .createQueryBuilder('album')
  //     .where(`album.id IN (${albumsWithSongs})`)
  //     .orWhere(`album.id IN (${albumsWithPlaylists})`)
  //     .getMany();
  // }

  // TODO check this query
  // findAll(query?: any) {
  //   return this.albumRepository
  //     .createQueryBuilder('album')
  //     .leftJoinAndSelect('album.songs', 'song')
  //     .groupBy('album.id, song.id')
  //     .having('COUNT(song.id) > :minSongs', { minSongs: 1 })
  //     .select('album.id, COUNT(song.id)')
  //     .getMany();
  // }

  // findAll(query?: any) {
  //   return this.albumRepository
  //     .createQueryBuilder('album')
  //     .orderBy('album.rating', 'DESC')
  //     .limit(5)
  //     .getMany();
  // }

  // findAll(query?: any) {
  //   return this.albumRepository
  //     .createQueryBuilder('album')
  //     .select('album.name')
  //     .distinct(true)
  //     .getMany();
  // }

  findAll(_?: any) {
    const query = `
        SELECT 
          a.name AS album_name,
          ar.name AS artist_name,
          s.name AS song_name
        FROM album a
        LEFT JOIN song s ON s.album_id = a.id
        LEFT JOIN artist ar ON ar.id = s.artist_id
        LEFT JOIN artist_details ad ON ad.artist_id = ar.id
    `;

    return this.entityManager.query(query);
  }
}
