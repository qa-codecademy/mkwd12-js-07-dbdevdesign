SELECT * FROM artist;
SELECT * FROM artist_details;
SELECT * FROM song;
SELECT * FROM genre;
SELECT * FROM album;
SELECT * FROM playlis;
SELECT * FROM song_lyrics;
SELECT * FROM songs_genres;
SELECT * FROM playlists_songs;
SELECT * FROM music_genre;


-- 1. List all artists and the song names
SELECT artist.name AS artist_name, song.name AS song_name
FROM artist 
JOIN song ON artist.id = song.artist_id

-- 2. List all artists that are married with their spouse name
SELECT artist.name AS artist_name, artist_details.spouse_name
FROM artist 
JOIN artist_details ON artist.id = artist_details.artist_id
WHERE artist_details.is_married = true;

-- 3. List all combinations of song names and genre names
SELECT song.name, genre.name
FROM song
CROSS JOIN genre;

-- 4. List all songs with corresponding artist name
SELECT s.name AS song_name, a.name AS artist_name
FROM song s
LEFT JOIN artist a ON s.artist_id =  a.id;

-- Join Types

-- Left Join (Retrieve all songs with corresponding artist name) - will return null in artist name if no match is found
SELECT s.name AS song_name, a.name AS artist_name
FROM song s
LEFT JOIN artist a ON s.artist_id = a.id;

-- Right Join (Retrieve all artists with corresponding songs) - will return null in song name if no match is found
SELECT a.name AS artist_name, s.name AS song_name
FROM artist a
RIGHT JOIN song s ON a.id = s.artist_id;

-- Inner Join (Retrieve all songs with corresponding artist name) - will fillter missing results from both tables
SELECT s.name AS song_name, a.name AS artist_name
FROM song s
INNER JOIN artist a ON s.artist_id = a.id;

-- Full outer Join (Retrieve all songs with corresponding artist name) - will return null in both song name and artist name if no matches are found
SELECT s.name AS song_name, a.name AS artist_name
FROM song s
FULL OUTER JOIN artist a ON s.artist_id = a.id;

-- Cross Join (Retrieve all possible combinations of artists and songs) - will match each row in artist with each row in song
SELECT a.name AS artist_name, s.name AS song_name
FROM artist a
CROSS JOIN song s;
