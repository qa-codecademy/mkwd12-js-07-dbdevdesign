import { Entity, PrimaryGeneratedColumn, Column, ManyToMany } from 'typeorm';
import { Song } from '../song/song.entity';

@Entity()
export class Genre {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 100 })
  name: string;

  @ManyToMany(() => Song, (song) => song.genres)
  songs: Song[];
}
