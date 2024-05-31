import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Artist } from './artist.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ArtistService {
  constructor(
    @InjectRepository(Artist) private artistRepo: Repository<Artist>,
  ) {}

  getAllArtists() {
    const query = this.artistRepo.createQueryBuilder('artist');

    // query
    //   .where('artist.name ILIKE :name', { name: '%emi%' })
    //   .orWhere('artist.name ILIKE :name', { name: '%rih%' });

    query.skip(10); //First result
    query.take(10); //Max results

    return query.getMany();

    // return this.artistRepo.find({ relations: { artistDetails: true } });
  }

  getAllArtistsWithDetails() {
    return (
      this.artistRepo
        .createQueryBuilder('artist')
        .leftJoinAndSelect('artist.artistDetails', 'details')
        // .leftJoinAndSelect('artist.songs', 'song')
        .where(`details.country = :country`, { country: 'USA' })
        .orWhere('details.city = :city', { city: 'Detroit' })
        // .getSql()
        .getRawMany()
    );
  }

  getAristAndAlbumNames() {
    return this.artistRepo
      .createQueryBuilder('artist')
      .leftJoin('artist.songs', 'song')
      .leftJoin('song.album', 'album')
      .select('artist.name', 'artistot')
      .addSelect('album.name', 'albumot')
      .getRawMany();
  }
}
