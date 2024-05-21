-- • Create a view to display the total duration of songs in each playlist

CREATE VIEW playlists_duration
AS
SELECT p.title, SUM(s.duration) as total_duration
FROM playlist p
JOIN playlists_songs ON playlists_songs.playlist_id = p.id
JOIN song s ON s.id = playlists_songs.song_id
GROUP BY p.title

SELECT * FROM playlists_duration pd
WHERE pd.total_duration > '12 minutes'

-- • Create a view to display the number of songs in each genre
CREATE VIEW genre_song_count AS
SELECT g.name, COUNT(s.id) as songs_count
FROM song s
JOIN songs_genres sg ON sg.song_id = s.id
JOIN genre g ON g.id = sg.genre_id
GROUP BY g.name

SELECT * FROM genre_song_count