import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ArtistDetailsService } from './artist-details.service';
import { ArtistDetailsController } from './artist-details.controller';
import { ArtistDetails } from './artist-details.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ArtistDetails])],
  providers: [ArtistDetailsService],
  controllers: [ArtistDetailsController],
})
export class ArtistDetailsModule {}
