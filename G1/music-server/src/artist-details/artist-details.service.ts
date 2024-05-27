import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ArtistDetails } from './artist-details.entity';
import { ArtistDetailsQueryDto } from './dto/artist-details-query.dto';

@Injectable()
export class ArtistDetailsService {
  constructor(
    @InjectRepository(ArtistDetails)
    private artistDetailsRepository: Repository<ArtistDetails>,
  ) {}
}
