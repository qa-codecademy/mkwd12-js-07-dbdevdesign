-- Adding relations 
-- 1. Add foreign key constraint for one-to-one relationship between song and song_lyrics
ALTER TABLE song_lyrics
ADD CONSTRAINT fk_song_lyrics_song
FOREIGN KEY(song_id) REFERENCES song(id)

-- 2. Add foreign key constraint for one-to-one relationship between artist and artist_details
ALTER TABLE artist_details
ADD CONSTRAINT fk_artist_details_artist 
FOREIGN KEY(artist_id) REFERENCES artist(id)

-- 3. Add foreign key constraint for many-to-one relationship between song and artist
ALTER TABLE song
ADD CONSTRAINT fk_song_artist
FOREIGN KEY(artist_id) REFERENCES artist(id)

-- 4. Add foreign key constraint for many-to-one relationship between album and artist
ALTER TABLE album
ADD CONSTRAINT fk_album_artist
FOREIGN KEY(artist_id) REFERENCES artist(id)

-- 5. Add foreign key constraints for many-to-many relationship between song and playlist
ALTER TABLE playlists_songs
ADD CONSTRAINT fk_song_playlist_song 
FOREIGN KEY(song_id) REFERENCES song(id)

ALTER TABLE playlists_songs
ADD CONSTRAINT fk_song_playlist_playlist 
FOREIGN KEY(playlist_id) REFERENCES playlist(id)

-- 6. Add foreign key constraints for many-to-many relationship between song and genre
ALTER TABLE songs_genres
ADD CONSTRAINT fk_song_genre_song
FOREIGN KEY (song_id) REFERENCES song(id);

ALTER TABLE songs_genres
ADD CONSTRAINT fk_song_genre_genre
FOREIGN KEY(genre_id) REFERENCES genre(id);

