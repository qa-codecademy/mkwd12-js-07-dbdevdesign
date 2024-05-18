-- FIND HOW MANY SONGS EACH ARTIST HAS
SELECT * FROM song;
SELECT * FROM artist;

SELECT artist.name, COUNT(artist.name) AS total_songs
FROM artist
INNER JOIN song ON song.artist_id = artist.id
GROUP BY artist.name;

-- Count the number of songs in each album
SELECT * FROM song;
SELECT * FROM album;

SELECT album.name, COUNT(album.name) as total_number_songs
FROM album
INNER JOIN song ON song.album_id = album.id
GROUP BY album.name;

-- Find the minimum duration of songs in each playlist
SELECT * FROM song;
SELECT * FROM playlist;
SELECT * FROM playlists_songs;

SELECT playlist.title, MIN(song.duration) AS min_duration_song, MAX(song.duration) as max_duration_song
FROM playlist
INNER JOIN playlists_songs ON playlists_songs.playlist_id = playlist.id
INNER JOIN song ON song.id = playlists_songs.song_id
GROUP BY playlist.title;

-- Find the average duration of songs for each artist

SELECT * FROM song;
SELECT * FROM artist;

SELECT ar.name AS artist_name, AVG(s.duration) AS avg_song_duration
FROM artist ar
INNER JOIN song s ON s.artist_id = ar.id
GROUP BY ar.name


-- Find the total number of songs in each album
SELECT a.name, COUNT(s.id) 
FROM album a 
INNER JOIN song s ON a.id = s.album_id 
GROUP BY a.name;

-- Find the total number of songs in each genre with at least 5 songs
SELECT genre.name, COUNT(songs_genres.song_id) AS number_of_songs
FROM genre
INNER JOIN songs_genres ON songs_genres.genre_id = genre.id
GROUP BY genre.name 
HAVING COUNT(songs_genres.song_id) >= 5;

-- Count the number of playlists containing at least 4 songs
SELECT playlist.title, COUNT(playlists_songs.song_id) as "numberOfSongs"
FROM playlist
INNER JOIN playlists_songs ON playlists_songs.playlist_id = playlist.id
GROUP BY playlist.title
HAVING COUNT(playlists_songs.song_id) >= 4

-- Find the total number of songs in each album and display albums with more than 20 songs

SELECT album.name, COUNT(song.id) AS total_songs
FROM album
INNER JOIN song ON song.album_id = album.id
GROUP BY album.name
HAVING COUNT(song.id) > 10;