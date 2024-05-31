import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ArtistDetails } from './artist-details.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ArtistDetailsService {
  constructor(
    @InjectRepository(ArtistDetails)
    private artistDetRepo: Repository<ArtistDetails>,
  ) {}

  getAllArtistDetails() {
    return this.artistDetRepo.find({ relations: { artist: true } });
  }
}
