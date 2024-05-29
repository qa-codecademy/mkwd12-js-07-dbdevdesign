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
}
