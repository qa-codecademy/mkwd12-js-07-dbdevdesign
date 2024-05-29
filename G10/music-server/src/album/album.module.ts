import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AlbumService } from './album.service';
import { AlbumController } from './album.controller';
import { Album } from './album.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Album])],
  providers: [AlbumService],
  controllers: [AlbumController],
})
export class AlbumModule {}
