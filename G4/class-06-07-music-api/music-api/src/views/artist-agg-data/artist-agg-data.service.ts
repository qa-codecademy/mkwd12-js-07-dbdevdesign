import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ArtistAggDataView } from './artist-agg-data.view.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ArtistAggDataService {
  constructor(
    @InjectRepository(ArtistAggDataView)
    private artistAggView: Repository<ArtistAggDataView>,
  ) {}

  find() {
    return this.artistAggView.find({});
  }
}
