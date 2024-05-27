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
}
