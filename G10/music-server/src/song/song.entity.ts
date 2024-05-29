import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToOne,
  ManyToMany,
  JoinTable,
  JoinColumn,
} from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';
import { Artist } from '../artist/artist.entity';
import { SongLyrics } from '../song-lyrics/song-lyrics.entity';
import { Playlist } from '../playlist/playlist.entity';
import { Genre } from '../genre/genre.entity';
import { Album } from '../album/album.entity';

@Entity()
export class Song {
  @PrimaryGeneratedColumn()
  @ApiProperty({ example: 1, description: 'The unique identifier of the song' })
  id: number;

  @Column({ length: 100 })
  @ApiProperty({ example: 'Imagine', description: 'The name of the song' })
  name: string;

  @Column('interval')
  @ApiProperty({ example: '00:03:36', description: 'The duration of the song' })
  duration: string;

  @Column()
  @ApiProperty({
    example: false,
    description: 'Whether the song has explicit content',
  })
  explicit: boolean;

  @Column('decimal', { precision: 5, scale: 2, nullable: true })
  @ApiProperty({ example: 4.5, description: 'The rating of the song' })
  rating: number;

  @ManyToOne(() => Artist, (artist) => artist.songs)
  @JoinColumn({ name: 'artist_id' })
  @ApiProperty({ type: () => Artist })
  artist: Artist;

  @Column()
  artist_id: number;

  @OneToOne(() => SongLyrics, (songLyrics) => songLyrics.song)
  @ApiProperty({ type: () => SongLyrics })
  songLyrics: SongLyrics;

  @ManyToOne(() => Album, (album) => album.songs)
  @JoinColumn({ name: 'album_id' })
  @ApiProperty({ type: () => Artist })
  album: Album;

  @Column()
  album_id: number;

  @ManyToMany(() => Playlist, (playlist) => playlist.songs)
  @JoinTable({
    name: 'playlists_songs',
    joinColumn: { name: 'song_id', referencedColumnName: 'id' },
    inverseJoinColumn: { name: 'playlist_id', referencedColumnName: 'id' },
  })
  @ApiProperty({ type: () => Playlist, isArray: true })
  playlists: Playlist[];

  @ManyToMany(() => Genre, (genre) => genre.songs)
  @JoinTable({
    name: 'songs_genres',
    joinColumn: { name: 'song_id', referencedColumnName: 'id' },
    inverseJoinColumn: { name: 'genre_id', referencedColumnName: 'id' },
  })
  @ApiProperty({ type: () => Genre, isArray: true })
  genres: Genre[];
}
