-- List all artists and the song names

SELECT * FROM artist;
SELECT * FROM song;

SELECT s.name AS song_name, a.name AS arting_name FROM song s
INNER JOIN artist a ON a.id = s.artist_id;


SELECT song.name AS "songName", artist.name AS "artistName" FROM song
INNER JOIN artist
ON song.artist_id = artist.id;

-- List all artists that are married with their spouse name
SELECT * FROM artist;
SELECT * FROM artist_details;

SELECT artist.name, artist_details.spouse_name, artist_details.country, artist_details.city
FROM artist
INNER JOIN artist_details ON artist.id = artist_details.artist_id
WHERE artist_details.is_married = true;

-- List song name and duration, album name and rating, artist name
SELECT * FROM artist;
SELECT * FROM song;
SELECT * FROM album;


SELECT song.name AS "songName", 
song.duration, 
artist.name AS "artistName", 
album.name AS "albumName", 
album.rating
FROM song
INNER JOIN artist ON artist.id = song.artist_id
INNER JOIN album ON artist.id = album.artist_id;








