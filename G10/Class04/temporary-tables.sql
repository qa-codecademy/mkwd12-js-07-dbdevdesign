-- 1. Create a temporary table to store the details of songs in a specific genre
CREATE TEMP TABLE temp_genre_song AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit, g.name AS genre_name
FROM song s
JOIN songs_genres sg ON s.id = sg.song_id
JOIN genre g ON sg.genre_id = g.id
WHERE g.name = 'Pop';

SELECT * FROM temp_genre_song;


-- 2. Create a temporary table to store the details of songs from a specific artist
CREATE TEMP TABLE temp_short_artist_songs_test AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s 
JOIN artist a ON s.artist_id = a.id
WHERE a.name = 'Ed Sheeran' 

SELECT * FROM temp_short_artist_songs_test;

-- 2.1 Create a temporary table to store the details of songs from a specific artist with duration less than 4 minutes
-- EXTRACT Function
-- The EXTRACT function in SQL is used to retrieve a specific part of a date or time value. It can extract components such as year, month, day, hour, minute, second, and more from a date, time, or interval data type.

-- EPOCH Keyword
-- The EPOCH keyword in the context of the EXTRACT function is used to get the number of seconds since the Unix epoch (January 1, 1970, at 00:00:00 UTC). When EPOCH is used with an interval or timestamp, it converts the value into the total number of seconds.

-- Combining EXTRACT and EPOCH
-- In this specific query, EXTRACT(EPOCH FROM s.duration) converts the duration of the song, which is stored as an interval data type, into the total number of seconds. This is useful for comparing durations in a simple numeric form.

-- Logic Explanation
-- The full clause WHERE a.name = 'Ed Sheeran' AND EXTRACT(EPOCH FROM s.duration) < 240; does the following:

-- Filters for the artist 'Ed Sheeran': Only rows where the artist's name is 'Ed Sheeran' are considered.
-- Filters for song duration: Among the rows that pass the first filter, it further filters those rows where the song's duration, converted to seconds, is less than 240 seconds (i.e., less than 4 minutes).

CREATE TEMP TABLE temp_short_artist_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s 
JOIN artist a ON s.artist_id = a.id
WHERE a.name = 'Ed Sheeran' AND EXTRACT(EPOCH FROM s.duration) < 240;

SELECT * FROM temp_short_artist_songs;

-- 3. Create a temporary table to store the details of songs from a specific artist
-- Join artist on song table
CREATE TEMP TABLE temp_artist_songs AS
SELECT s.id, s.name, s.duration, s.explicit, a.name AS artist_name
FROM song s
JOIN artist a ON s.artist_id = a.id
WHERE a.name = 'Eminem';

SELECT * FROM temp_artist_songs;

-- 3.1 Create a temporary table to store the details of songs from a specific artist
-- Join song on artist table
CREATE TEMP TABLE temp_artist_songs_test AS
SELECT s.id, s.name, s.duration, s.explicit, a.name AS artist_name
FROM artist a
JOIN song s ON a.id = s.artist_id
WHERE a.name = 'Eminem';

SELECT * FROM temp_artist_songs_test;

-- 4. Create a temporary table to store the details of songs with explicit lyrics
CREATE TEMP TABLE temp_explicit_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
WHERE s.explicit = true;

SELECT * FROM temp_explicit_songs;

-- 5. Create a temporary table to store the details of songs with explicit lyrics and duration less than 3 minutes
CREATE TEMP TABLE temp_explicit_short_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
WHERE s.explicit = true AND EXTRACT(EPOCH FROM s.duration) < 180
ORDER BY duration DESC;

SELECT * FROM temp_explicit_short_songs;

-- 5.1 Create a temporary table to store the details of songs with explicit lyrics and duration less than 3 minutes sorted into descending order
CREATE TEMP TABLE temp_explicit_short_songs_sorted AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
WHERE s.explicit = true AND EXTRACT(EPOCH FROM s.duration) < 180
ORDER BY duration DESC;

SELECT * FROM temp_explicit_short_songs_sorted;

-- 6. Create a temporary table to store the details of songs from a specific genre with duration greater than 4 minutes
CREATE TEMP TABLE temp_long_genre_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
JOIN songs_genres sg ON s.id = sg.song_id
JOIN genre g ON sg.genre_id = g.id
WHERE g.name = 'Rock' AND EXTRACT(EPOCH FROM s.duration) > 240;

SELECT * FROM temp_long_genre_songs

-- 7. Create a temporary table to store the details of songs from a specific playlist with duration less than 6 minutes
CREATE TEMP TABLE temp_short_playlist_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
JOIN playlists_songs ps ON s.id = ps.song_id
JOIN playlist p ON ps.playlist_id = p.id
WHERE p.title = 'Soft Pop Hits' AND EXTRACT(EPOCH FROM s.duration) < 360;

SELECT * FROM temp_short_playlist_songs

-- 8. Create a temporary table to store the details of songs in a specific album
CREATE TEMP TABLE temp_album_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit, al.name AS album_name, a.name AS artist_name
FROM song s
JOIN album al ON s.album_id = al.id
LEFT JOIN artist a ON s.artist_id = a.id
WHERE al.name = 'Nothing but the Beat';

SELECT * FROM temp_album_songs

-- 9. Create a temporary table to store the details of songs in a specific playlist
CREATE TEMP TABLE temp_playlist_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit, p.title AS playlist_title
FROM song s
JOIN playlists_songs ps ON s.id = ps.song_id
JOIN playlist p ON ps.playlist_id = p.id
WHERE p.title = 'Workout Hits';

SELECT * FROM temp_playlist_songs

-- 10. Create a temporary table to store the details of songs with duration greater than 5 minutes
CREATE TEMP TABLE temp_long_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
WHERE EXTRACT(EPOCH FROM s.duration) > 300;

SELECT * FROM temp_long_songs