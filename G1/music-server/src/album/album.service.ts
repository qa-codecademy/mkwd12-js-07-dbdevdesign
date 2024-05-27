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
}
