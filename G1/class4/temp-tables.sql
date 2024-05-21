-- Create a temporary table to store the details of songs in a specific genre

CREATE TEMP TABLE temp_pop_genre_song_details AS
SELECT s.id as song_id, s.name as song_name, s.duration, s.explicit, g.name as genre_name
FROM song s
JOIN songs_genres sg ON sg.song_id = s.id
JOIN genre g ON g.id = sg.genre_id
WHERE g.name = 'Pop'

SELECT * FROM temp_pop_genre_song_details