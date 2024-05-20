-- Create a view to display the number of songs in each genre

CREATE VIEW song_count_by_genre AS
SELECT genre.name AS genre, COUNT(songs_genres.song_id) AS total_songs
FROM genre
INNER JOIN songs_genres ON songs_genres.genre_id = genre.id
GROUP BY genre.name;

SELECT * FROM song_count_by_genre;

-- Create a view to display the total duration of songs in each playlist

CREATE VIEW playlists_duration AS
SELECT p.title AS playlist, SUM(s.duration) AS total_duration
FROM playlist p
INNER JOIN playlists_songs pls ON pls.playlist_id = p.id
INNER JOIN song s ON pls.song_id = s.id
GROUP BY p.title
ORDER BY SUM(s.duration) ASC;

SELECT * FROM playlists_duration;