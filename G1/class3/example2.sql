-- Join = Inner Join
-- Left Join = Left Outer Join
-- Right Join = Right Outer Join
-- Full Join = Full Outer Join

-- Aggregate functions
-- • Find the minimum duration of songs in each playlist
SELECT p.title, MIN(s.duration) as min_duration
FROM playlist p
JOIN playlists_songs ps ON ps.playlist_id = p.id
JOIN song s ON ps.song_id = s.id
GROUP BY p.title

-- • Calculate the total duration of songs in each playlist

SELECT p.title, SUM(s.duration) as total_duration
FROM playlist p
JOIN playlists_songs ps ON ps.playlist_id = p.id
JOIN song s ON s.id = ps.song_id
GROUP BY p.title

-- • Count the number of songs in each album

SELECT al.name, COUNT(s.id) as total
FROM album al
JOIN song s ON al.id = s.album_id
GROUP BY al.name

-- • Find the average duration of songs for each artist

SELECT a.name, AVG(s.duration) as avg_duration
FROM artist a
JOIN song s ON a.id = s.artist_id
GROUP BY a.name

-- • Find the total number of songs in each album

SELECT s.album_id, COUNT(*) as total_songs
FROM song s
GROUP BY s.album_id

-- • Count the number of explicit songs for each artist

SELECT s.artist_id, COUNT(*) as total_explicit_songs
FROM song s
WHERE s.explicit = true
GROUP BY s.artist_id

-- • Find the number of songs in each genre
SELECT g.name, COUNT(sg.song_id) as total_songs
FROM song s
RIGHT JOIN songs_genres sg ON s.id = sg.song_id
RIGHT JOIN genre g ON g.id = sg.genre_id
GROUP BY g.name

-- Grouping functions - Workshop

-- • Find the total number of songs in each playlist
SELECT p.title, COUNT(ps.song_id) as total
FROM playlist p
LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
GROUP BY p.title

-- • Find the sum of all song durations for each artist

SELECT s.artist_id, SUM(s.duration) as sum_of_duration
FROM song s
GROUP BY s.artist_id

-- • Count the number of artists in each country

SELECT ad.country, COUNT(ad.artist_id) as total_artists
FROM artist_details ad
GROUP BY ad.country

-- • Find the average duration of songs in each genre

-- genre name, average duration of songs
SELECT g.name, AVG(s.duration) as avg_duration
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name

-- Show artist full name and titles of all playlist he has songs in
SELECT ad.full_name, p.title
FROM artist_details ad
JOIN artist ar ON ar.id = ad.artist_id
JOIN song s ON s.artist_id = ar.id
JOIN playlists_songs ps ON ps.song_id = s.id
JOIN playlist p ON p.id = ps.playlist_id

-- Show artist name with all his lyrics combined
SELECT a.name, STRING_AGG(sl.lyrics, ' / ')
FROM artist a
JOIN song s ON s.artist_id = a.id
JOIN song_lyrics sl ON s.id = sl.song_id
GROUP BY a.name

-- Show number of songs in playlist by genre
-- Playlist Title | Genre Name | Songs Total

SELECT p.title, g.name, COUNT(s.id) as total_songs
FROM playlist p
JOIN playlists_songs ps ON p.id = ps.playlist_id
JOIN song s ON s.id = ps.song_id
JOIN songs_genres sg ON sg.song_id = s.id
JOIN genre g ON g.id = sg.genre_id
GROUP BY p.title, g.name
ORDER BY p.title, g.name

-- Show the artist's full name and album names without duplicates
-- using distinct
SELECT DISTINCT ad.full_name, al.name
FROM artist_details ad
JOIN artist ar ON ar.id = ad.artist_id
JOIN song s ON s.artist_id = ar.id
JOIN album al ON al.id = s.album_id
ORDER BY al.name

-- using group by
SELECT ad.full_name, al.name
FROM artist_details ad
JOIN artist ar ON ar.id = ad.artist_id
JOIN song s ON s.artist_id = ar.id
JOIN album al ON al.id = s.album_id
GROUP BY ad.full_name, al.name

-- *** HAVING ***

-- Find the total number of songs in each genre with at least 5 songs
SELECT g.name, COUNT(s.id) as total_songs
FROM song s
RIGHT JOIN songs_genres sg ON sg.song_id = s.id
RIGHT JOIN genre g ON sg.genre_id = g.id
GROUP BY g.name
HAVING COUNT(s.id) >= 5

-- Find the total number of songs in each genre with at least 3 songs for explicit songs
SELECT g.name, COUNT(s.id) as total_songs
FROM song s
RIGHT JOIN songs_genres sg ON sg.song_id = s.id
RIGHT JOIN genre g ON sg.genre_id = g.id
WHERE s.explicit = true
GROUP BY g.name
HAVING COUNT(s.id) >= 3

--  Count the number of playlists containing at least 2 songs
SELECT p.title, COUNT(ps.song_id) as total_count
FROM playlist p
LEFT JOIN playlists_songs ps ON ps.playlist_id = p.id
GROUP BY p.title
HAVING COUNT(ps.song_id) >= 2
