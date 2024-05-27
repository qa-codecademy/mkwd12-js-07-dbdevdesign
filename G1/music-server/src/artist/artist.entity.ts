import { ApiProperty } from '@nestjs/swagger';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToOne,
  OneToMany,
} from 'typeorm';
import { ArtistDetails } from '../artist-details/artist-details.entity';
import { Song } from '../song/song.entity';

@Entity()
export class Artist {
  @PrimaryGeneratedColumn()
  @ApiProperty({
    example: 1,
    description: 'The unique identifier of the artist',
  })
  id: number;

  @Column({ length: 100 })
  @ApiProperty({
    example: 'The Beatles',
    description: 'The name of the artist',
  })
  name: string;

  @OneToOne(() => ArtistDetails, (artistDetails) => artistDetails.artist)
  artistDetails: ArtistDetails;

  @OneToMany(() => Song, (song) => song.artist)
  songs: Song[];
}
