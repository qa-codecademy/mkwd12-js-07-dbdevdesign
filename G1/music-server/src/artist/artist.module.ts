import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ArtistService } from './artist.service';
import { ArtistController } from './artist.controller';
import { Artist } from './artist.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Artist])],
  providers: [ArtistService],
  controllers: [ArtistController],
})
export class ArtistModule {}
