-- Create a temporary table to store the details of songs in a specific genre

CREATE TEMP TABLE temp_songs_by_genre AS
SELECT s.id, s.name AS song_name, s.duration, g.name AS genre
FROM song s
INNER JOIN songs_genres sg ON sg.song_id = s.id
INNER JOIN genre g ON sg.genre_id = g.id
WHERE g.name = 'Pop';

-- SELECT TEMP TABLE
SELECT * FROM temp_songs_by_genre;

-- USING TEMP TABLE FURTHER MORE FOR OTHER RESULTS
SELECT temp_songs_by_genre.song_name, temp_songs_by_genre.duration, temp_songs_by_genre.genre, artist.name
FROM temp_songs_by_genre
INNER JOIN song ON song.id = temp_songs_by_genre.id 
INNER JOIN artist ON artist.id = song.artist_id;


-- Create a temporary table to store the details of songs with explicit lyrics
CREATE TEMP TABLE temp_explicit_song AS
SELECT s.name, s.explicit, sl.lyrics
FROM song s
INNER JOIN song_lyrics sl ON sl.song_id = s.id
WHERE s.explicit = true;

-- SELECT TEMP TABLE
SELECT * FROM temp_explicit_song;