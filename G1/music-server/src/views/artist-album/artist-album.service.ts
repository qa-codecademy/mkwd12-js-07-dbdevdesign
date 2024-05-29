import { Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { ArtistAlbumView } from './artist-album.view-entity';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class ArtistAlbumViewService {
  constructor(
    @InjectRepository(ArtistAlbumView)
    private readonly artistAlbumViewRepository: Repository<ArtistAlbumView>,
  ) {}

  getAll() {
    return this.artistAlbumViewRepository.createQueryBuilder('view').getMany();
  }

  getByArtistId(artistId: number) {
    return this.artistAlbumViewRepository.findOne({
      where: { artist_id: artistId },
    });
  }

  getByMinRating(minRating: number) {
    return this.artistAlbumViewRepository
      .createQueryBuilder('view')
      .where('view.album_rating >= :minRating', { minRating })
      .getMany();
  }
}
