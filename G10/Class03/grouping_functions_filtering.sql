-- 1. Filter songs by the number of songs in each genre with at least 5 song
SELECT g.name AS genre, COUNT(sg.song_id) AS song_count
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name
HAVING COUNT(sg.song_id) > 5;

-- 2. Find the total number of songs in each genre with at least 5 songs
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name
HAVING COUNT(sg.song_id) >= 5;

-- 3. Count the number of playlists containing at least 3 songs
SELECT p.title AS playlist_title, COUNT(ps.song_id) AS total_songs
FROM playlist p
LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
GROUP BY p.title
HAVING COUNT(ps.song_id) >= 3;

-- 4. Calculate the total number of songs in each album and display albums with at least 3 songs
SELECT al.name AS album_name, COUNT(s.id) AS total_songs
FROM album al
LEFT JOIN song s ON al.id = s.album_id
GROUP BY al.name
HAVING COUNT(s.id) >= 3;

-- 5. Find the number of songs in each album and calculate the total duration for albums with more than 10 songs
SELECT al.name AS album_name, COUNT(s.id) AS total_songs, SUM(EXTRACT(EPOCH FROM s.duration)) AS total_duration_seconds
FROM album al
LEFT JOIN song s ON al.id = s.album_id
GROUP BY al.name
HAVING COUNT(s.id) > 10;

-- 6. Count the number of songs in each genre and display genres with more than 5 songs, sorted by the number of songs in descending order
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name
HAVING COUNT(sg.song_id) >= 5
ORDER BY total_songs DESC;

-- 7. Find the average duration of songs in each playlist and include only playlists with a duration of at least 5 minutes
SELECT p.title AS playlist_title, AVG(EXTRACT(EPOCH FROM s.duration)) AS avg_duration_seconds
FROM playlist p
LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
LEFT JOIN song s ON ps.song_id = s.id
GROUP BY p.title
HAVING AVG(EXTRACT(EPOCH FROM s.duration)) >= 300;

-- 8. Find the total number of songs in each album and display albums with more than 10 songs
SELECT al.name AS album_name, COUNT(s.id) AS total_songs
FROM album al
LEFT JOIN song s ON al.id = s.album_id
GROUP BY al.name
HAVING COUNT(s.id) > 10;

-- 9. Find the number of songs in each genre and calculate the total duration for genres with more than 6 songs
SELECT g.name AS genre, COUNT(s.id) AS total_songs, SUM(EXTRACT(EPOCH FROM s.duration)) AS total_duration_seconds
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name
HAVING COUNT(s.id) > 6;

-- 10. Find the average duration of songs in each genre and include only genres with an average duration of more than 4 minutes
SELECT g.name AS genre, AVG(EXTRACT(EPOCH FROM s.duration)) AS avg_duration_seconds
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name
HAVING AVG(EXTRACT(EPOCH FROM s.duration)) > 240;

-- 11. Calculate the total number of songs in each album and display albums with more than 10 songs
SELECT al.name AS album_name, COUNT(s.id) AS total_songs
FROM album al
LEFT JOIN song s ON al.id = s.album_id
GROUP BY al.name
HAVING COUNT(s.id) > 10;

-- 12. Find the maximum duration of songs in each playlist and include only playlists where the maximum duration is more than 5 minutes
SELECT p.title AS playlist_title, MAX(EXTRACT(EPOCH FROM s.duration)) AS max_duration_seconds
FROM playlist p
LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
LEFT JOIN song s ON ps.song_id = s.id
GROUP BY p.title
HAVING MAX(EXTRACT(EPOCH FROM s.duration)) > 300;

-- 13. Count the number of songs in each genre and display genres with more than 5 songs, sorted by the number of songs in descending order
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name
HAVING COUNT(sg.song_id) > 5
ORDER BY total_songs DESC;

-- 14. Find the average duration of songs in each genre and include only genres with an average duration of less than 3 minutes
SELECT g.name AS genre, AVG(EXTRACT(EPOCH FROM s.duration)) AS avg_duration_seconds
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name
HAVING AVG(EXTRACT(EPOCH FROM s.duration)) < 180;

-- 15. Find the maximum duration of songs in each playlist and include only playlists where the maximum duration is more than 8 minutes
SELECT p.title AS playlist_title, MAX(EXTRACT(EPOCH FROM s.duration)) AS max_duration_seconds
FROM playlist p
LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
LEFT JOIN song s ON ps.song_id = s.id
GROUP BY p.title
--  calculates the maximum duration (in seconds) of any song in each playlist
HAVING MAX(EXTRACT(EPOCH FROM s.duration)) > 480;

-- 16. Find the average duration of songs in each genre and include only genres with an average duration of more than 5 minutes
SELECT g.name AS genre, AVG(EXTRACT(EPOCH FROM s.duration)) AS avg_duration_seconds
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name
HAVING AVG(EXTRACT(EPOCH FROM s.duration)) > 300;

-- 17. Calculate the total number of songs in each album and display albums with more than 6 songs
SELECT al.name AS album_name, COUNT(s.id) AS total_songs
FROM album al
LEFT JOIN song s ON al.id = s.album_id
GROUP BY al.name
HAVING COUNT(s.id) > 6;

-- 18. Find the average duration of songs in each genre and include only genres with an average duration of less than 4 minutes
SELECT g.name AS genre, AVG(EXTRACT(EPOCH FROM s.duration)) AS avg_duration_seconds
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name
HAVING AVG(EXTRACT(EPOCH FROM s.duration)) < 240;