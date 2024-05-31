import { Song } from 'src/song/song.entity';
import {
  Column,
  Entity,
  JoinColumn,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class SongLyrics {
  @PrimaryGeneratedColumn()
  id: number;

  @Column('text')
  lyrics: string;

  @OneToOne(() => Song, (song) => song.songLyrics)
  @JoinColumn({ name: 'song_id' })
  song: Song;
}
