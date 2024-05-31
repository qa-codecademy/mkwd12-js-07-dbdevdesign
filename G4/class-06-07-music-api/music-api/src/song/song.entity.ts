import { Album } from 'src/album/album.entity';
import { Artist } from 'src/artist/artist.entity';
import { Genre } from 'src/genre/genre.entity';
import { Playlist } from 'src/playlist/playlist.entity';
import { SongLyrics } from 'src/song-lyrics/song-lyrics.entity';
import {
  Column,
  Entity,
  JoinColumn,
  JoinTable,
  ManyToMany,
  ManyToOne,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Song {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  duration: string;

  @Column()
  explicit: boolean;

  @Column('decimal')
  rating: number;

  @ManyToOne(() => Artist, (artist) => artist.songs)
  @JoinColumn({ name: 'artist_id' })
  artist: Artist;

  @ManyToOne(() => Album, (album) => album.songs)
  @JoinColumn({ name: 'album_id' })
  album: Album;

  @OneToOne(() => SongLyrics, (songLyrics) => songLyrics.song)
  songLyrics: SongLyrics;

  @ManyToMany(() => Genre)
  @JoinTable({
    name: 'songs_genres',
    joinColumn: { name: 'song_id', referencedColumnName: 'id' },
    inverseJoinColumn: { name: 'genre_id', referencedColumnName: 'id' },
  })
  genres: Genre[];

  @ManyToMany(() => Playlist, (playlist) => playlist.songs)
  @JoinTable({
    name: 'playlists_songs',
    joinColumn: { name: 'song_id', referencedColumnName: 'id' },
    inverseJoinColumn: { name: 'playlist_id', referencedColumnName: 'id' },
  })
  playlists: Playlist[];
}
