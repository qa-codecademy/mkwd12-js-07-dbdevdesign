import { Song } from 'src/song/song.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Album {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column({ type: 'decimal' })
  rating: number;

  @OneToMany(() => Song, (song) => song.album)
  songs: Song[];
}
