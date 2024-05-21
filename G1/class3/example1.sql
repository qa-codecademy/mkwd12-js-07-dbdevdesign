-- ***** Examples for each join *****

-- *** Inner Join ***

-- Example 1: List all artists with their corresponding artist details.

SELECT artist.name, artist_details.full_name
FROM artist
INNER JOIN artist_details ON artist.id = artist_details.artist_id

-- Example 2: List all songs with their corresponding albums.

SELECT song.name as song_name, song.duration, album.name as album_name, album.rating
FROM song
INNER JOIN album ON song.album_id = album.id
ORDER BY album.id

-- Example 3: List all playlists with their songs.

SELECT song.name, playlist.title
FROM song
INNER JOIN playlists_songs ON playlists_songs.song_id = song.id
INNER JOIN playlist ON playlist.id = playlists_songs.playlist_id

-- *** Left (Outer) Join ***

-- Example 1: List all artists with their corresponding artist details, including artists without details.

SELECT *
FROM artist
LEFT JOIN artist_details ON artist.id = artist_details.artist_id

-- Example 2: List all songs with their corresponding albums, including songs without albums.

SELECT song.name as song_name, album.name as album_name
FROM song
LEFT JOIN album ON song.album_id = album.id

-- Example 3: List all playlists with their songs, including playlists without songs.

SELECT playlist.title, song.name
from playlist
LEFT JOIN playlists_songs ON playlist.id = playlists_songs.playlist_id
LEFT JOIN song ON playlists_songs.song_id = song.id

-- *** Right (Outer) Join ***

-- Example 1: List all artists with their corresponding artist details, including details without corresponding artists.

SELECT artist.name, artist_details.full_name
FROM artist
RIGHT JOIN artist_details ON artist.id = artist_details.artist_id

-- Example 2: List all songs with their corresponding albums, including albums without corresponding songs.
SELECT song.name as song_name, album.name as album_name
FROM song
RIGHT JOIN album ON song.album_id = album.id

-- Example 3: List all playlists with their songs, including songs without corresponding playlists.

SELECT playlist.title, song.name
FROM playlist
RIGHT JOIN playlists_songs ON playlists_songs.playlist_id = playlist.id
RIGHT JOIN song ON playlists_songs.song_id = song.id

-- *** Full Outer Join ***

-- Example 1: List all artists with their corresponding artist details, including artists without details and details without artists.

SELECT artist.name, artist_details.full_name
FROM artist
FULL JOIN artist_details ON artist.id = artist_details.artist_id

-- Example 2: List all songs with their corresponding albums, including songs without albums and albums without songs.

SELECT song.name as song_name, album.name as album_name
FROM song
FULL JOIN album ON song.album_id = album.id

-- Example 3: List all playlists with their songs, including playlists without songs and songs without playlists.

SELECT song.name, playlist.title
FROM playlist
FULL JOIN playlists_songs ON playlists_songs.playlist_id = playlist.id
FULL JOIN song ON playlists_songs.song_id = song.id

-- *** Cross Join ***

-- Example 1: List all combinations of artists and albums.
SELECT album.name as album_name, artist.name as artist_name
FROM artist
CROSS JOIN album

-- Example 2: List all combinations of songs and genres.
SELECT song.name as song_name, genre.name as genre_name
FROM song
CROSS JOIN genre

-- Example 3: List all combinations of playlists and songs.
SELECT playlist.title, song.name
FROM playlist
CROSS JOIN song

-- *** Self Join ***

-- Example 1: List pairs of artists from the same country.

SELECT ar1.name as first_artist, ad1.country, ar2.name as second_artist
FROM artist ar1
INNER JOIN artist_details ad1 ON ar1.id = ad1.artist_id
INNER JOIN artist ar2 ON ad1.country = (SELECT ad2.country FROM artist_details ad2 WHERE ad2.artist_id = ar2.id)
WHERE ar1.id <> ar2.id

-- Example 2: List songs that have the same duration.

SELECT s1.name as first_song_name, s2.name as second_song_name, s1.duration, s2.duration
FROM song s1
INNER JOIN song s2 ON s1.duration = s2.duration
WHERE s1.id != s2.id

-- Example 3: List albums with the same rating.
SELECT a1.name as first_album_name, a2.name as second_album_name, a1.rating, a2.rating
FROM album a1
INNER JOIN album a2 ON a1.rating = a2.rating
WHERE a1.id <> a2.id
