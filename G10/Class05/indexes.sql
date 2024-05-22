-- 1. Adding Indexes
-- Adding Indexes to Improve Query Performance
-- Index on artist table to improve searches by name:
CREATE INDEX idx_artist_name ON artist(name);

-- Index on artist_details table to improve searches by country and city:
CREATE INDEX idx_artist_details_country_city ON artist_details(country, city);

-- Index on album table to improve searches by rating:
CREATE INDEX idx_album_rating ON album(rating);

-- Index on song table to improve searches by artist_id and album_id:
CREATE INDEX idx_song_artist_album ON song(artist_id, album_id);

-- Index on playlist_songs table to improve searches by playlist_id and song_id:
CREATE INDEX idx_playlist_songs_playlist_song ON playlists_songs(playlist_id, song_id);

-- Index on songs_genres table to improve searches by song_id and genre_id:
CREATE INDEX idx_songs_genres_song_genre ON songs_genres(song_id, genre_id);

-- 2. Using Indexes in Queries
-- Queries Utilizing Indexes

-- Query to find all artists by name (utilizes idx_artist_name):
SELECT * FROM artist
WHERE name = 'Eminem';

-- Query to find all artists from a specific country and city (utilizes idx_artist_details_country_city):
SELECT * FROM artist_details
WHERE country = 'Canada' AND city = 'Toronto';

-- Query to find all albums with a rating higher than 4.5 (utilizes idx_album_rating):
SELECT * FROM album
WHERE rating > 4.5;

-- Query to find all songs by a specific artist and album (utilizes idx_song_artist_album):
SELECT * FROM song
WHERE artist_id = 1 AND album_id = 1;

-- Query to find all songs in a specific playlist (utilizes idx_playlist_songs_playlist_song):
SELECT s.*
FROM song s
JOIN playlists_songs ps ON s.id = ps.song_id
WHERE ps.playlist_id = 1;

-- Query to find all genres for a specific song (utilizes idx_songs_genres_song_genre):
SELECT g.*
FROM genre g
JOIN songs_genres sg ON g.id = sg.genre_id
WHERE sg.song_id = 1;
