-- 1. Find the minimum duration of songs in each playlist
SELECT p.title AS playlist, MIN(s.duration) AS min_duration
FROM playlist p
JOIN playlists_songs ps ON p.id = ps.playlist_id
JOIN song s ON ps.song_id = s.id
GROUP BY p.title;

-- 2. Calculate the total duration of songs in each playlist
SELECT p.title AS playlist, SUM(s.duration) AS total_duration
FROM playlist p
JOIN playlists_songs ps ON p.id = ps.playlist_id
JOIN song s ON ps.song_id = s.id
GROUP BY p.title;

-- 3. Count the number of songs in each album
SELECT al.name AS album, COUNT(s.id) AS song_count
FROM album al
JOIN song s ON al.id = s.album_id
GROUP BY al.name;

-- 4. Find the average duration of songs for each artist
SELECT a.id AS artist_id, AVG(s.duration) AS avg_duration
FROM artist a
LEFT JOIN song s ON a.id = s.artist_id
GROUP BY a.id;

-- 5. Find the total number of songs in each album
SELECT album_id, COUNT(*) AS total_songs
FROM song
GROUP BY album_id;

-- 6. Count the number of explicit songs for each artist
SELECT artist_id, COUNT(*) AS total_explicit_songs
FROM song
WHERE explicit = TRUE
GROUP BY artist_id;

-- 7. Find the number of songs in each genre
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name;

-- 8. Find the maximum number of songs in a playlist
SELECT MAX(total_songs) AS max_songs_in_playlist
FROM (
    SELECT p.id, COUNT(ps.song_id) AS total_songs
    FROM playlist p
    LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
    GROUP BY p.id
) AS playlist_song_counts;

-- 9. Find the total number of songs in each playlist and sort them by the total number of songs
SELECT p.title AS playlist_title, COUNT(ps.song_id) AS total_songs
FROM playlist p
LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
GROUP BY p.title
ORDER BY total_songs DESC;

-- 10. Find the sum of all song durations for each artist
SELECT a.name AS artist, SUM(s.duration) AS total_duration
FROM artist a
LEFT JOIN song s ON a.id = s.artist_id
GROUP BY a.name;

-- 11. Count the number of artists in each country
SELECT ad.country, COUNT(a.id) AS total_artists
FROM artist a
LEFT JOIN artist_details ad ON a.id = ad.artist_id
GROUP BY ad.country;

-- 12. Find the minimum duration of songs for each artist
SELECT a.name AS artist, MIN(s.duration) AS min_duration
FROM artist a
LEFT JOIN song s ON a.id = s.artist_id
GROUP BY a.name;

-- 13. Find the average duration of songs in each genre
SELECT g.name AS genre, AVG(s.duration) AS avg_duration
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name;

-- 14. Find the total number of songs in each genre, including genres with no songs
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name;

-- 15. Find the minimum and maximum duration of songs in each genre
SELECT g.name AS genre, MIN(s.duration) AS min_duration, MAX(s.duration) AS max_duration
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name;

-- 16. List all songs along with their genres concatenated into a single string
SELECT s.name AS song_name, STRING_AGG(g.name, ', ') AS genres
FROM song s
JOIN songs_genres sg on s.id = sg.song_id
JOIN genre g ON sg.genre_id = g.id
GROUP BY s.name

-- 17. Find the maximum rating of albums
SELECT MAX(al.rating) AS max_rating
FROM album al;

-- 18. Find the total duration of all songs
SELECT SUM(duration) AS total_duration
FROM song;
