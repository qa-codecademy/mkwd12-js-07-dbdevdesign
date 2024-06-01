import { Module } from '@nestjs/common';
import { ArtistAggDataController } from './artist-agg-data/artist-agg-data.controller';
import { ArtistAggDataService } from './artist-agg-data/artist-agg-data.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ArtistAggDataView } from './artist-agg-data/artist-agg-data.view.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ArtistAggDataView])],
  providers: [ArtistAggDataService],
  controllers: [ArtistAggDataController],
})
export class ViewsModule {}
