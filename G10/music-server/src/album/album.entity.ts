import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';
import { Song } from '../song/song.entity';

@Entity()
export class Album {
  @PrimaryGeneratedColumn()
  @ApiProperty({
    example: 1,
    description: 'The unique identifier of the album',
  })
  id: number;

  @Column({ length: 100 })
  @ApiProperty({ example: 'Abbey Road', description: 'The name of the album' })
  name: string;

  @Column('decimal', { precision: 5, scale: 2, nullable: true })
  @ApiProperty({ example: 4.5, description: 'The rating of the album' })
  rating: number;

  @OneToMany(() => Song, (song) => song.artist)
  songs: Song[];
}
