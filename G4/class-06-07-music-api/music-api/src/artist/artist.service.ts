import { Injectable } from '@nestjs/common';
import { InjectEntityManager, InjectRepository } from '@nestjs/typeorm';
import { Artist } from './artist.entity';
import { EntityManager, Repository } from 'typeorm';
import { CreateArtistWithDetailsDto } from './create-artist-with-details.dto.ts';

@Injectable()
export class ArtistService {
  constructor(
    @InjectRepository(Artist) private artistRepo: Repository<Artist>,
    @InjectEntityManager() private entityManager: EntityManager,
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

  getArtistSongCount(artistName: string) {
    console.log(artistName);

    return this.entityManager.query(
      `select get_artist_song_count($1) as song_count`,
      [artistName],
    );
  }

  createArtistWithDetails(body: CreateArtistWithDetailsDto) {
    const {
      name,
      date_of_birth,
      full_name,
      country,
      city,
      is_married,
      spouse_name,
    } = body;

    return this.entityManager.query(
      `CALL add_artist_with_details($1,$2,$3,$4,$5,$6,$7)`,
      [name, date_of_birth, full_name, country, city, is_married, spouse_name],
    );
  }
}
