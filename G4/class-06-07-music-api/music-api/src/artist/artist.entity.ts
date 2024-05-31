import { ArtistDetails } from 'src/artist-details/artist-details.entity';
import { Song } from 'src/song/song.entity';
import {
  Column,
  Entity,
  OneToMany,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Artist {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @OneToOne(() => ArtistDetails, (artistDetails) => artistDetails.artist)
  artistDetails: ArtistDetails;

  @OneToMany(() => Song, (song) => song.artist)
  songs: Song[];
}
