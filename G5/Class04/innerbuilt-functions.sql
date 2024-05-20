SELECT * FROM song;
SELECT * FROM album;
SELECT * FROM artist;
SELECT * FROM genre;
SELECT * FROM songs_genres;
SELECT * FROM playlist;
SELECT * FROM playlists_songs;
SELECT * FROM artist_details


-- Make concatanation between the arist name and the country + city from where he's/she's from;
SELECT a.name, CONCAT(ad.city, ', ' ,ad.country) AS artist_from
FROM artist a
INNER JOIN artist_details ad ON ad.artist_id = a.id;


-- Return all genres in upper case version 1
SELECT UPPER(name) AS genres
FROM genre;

-- Return all genres in upper case version 2
SELECT LEFT(UPPER(name), 2) AS genres
FROM genre;


-- Return all genres in lower case
SELECT lower(name) AS genres
FROM genre;

-- Return first 4 characters of a song name (from left)
SELECT LEFT(name, 4) AS first_four_left_character
FROM song;

-- Return all song names, replace o with O
SELECT REPLACE(name, 'o', 'O')
FROM song;

-- Return song name + it's length
SELECT name, LENGTH(name) AS song_character_length
FROM song;
