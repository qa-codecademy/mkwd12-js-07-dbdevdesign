import { Artist } from 'src/artist/artist.entity';
import {
  Column,
  Entity,
  JoinColumn,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class ArtistDetails {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  date_of_birth: Date;

  @Column()
  full_name: string;

  @Column({ nullable: true })
  country: string;

  @Column({ nullable: true })
  city: string;

  @Column()
  is_married: boolean;

  @Column({ nullable: true })
  spouse_name: string;

  @OneToOne(() => Artist, (artist) => artist.artistDetails)
  @JoinColumn({ name: 'artist_id' })
  artist: Artist;
}
