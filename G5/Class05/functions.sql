-- Create a function that will return the count of songs for each artist

SELECT * FROM artist;
SELECT * FROM song;




SELECT ar.name AS artist_name, COUNT(ar.name) AS total_songs
FROM artist ar
JOIN song s ON s.artist_id = ar.id
GROUP BY ar.name;


 
CREATE OR REPLACE FUNCTION get_song_count_by_artist()
RETURNS TABLE (
	artist_name VARCHAR,
	total_songs BIGINT
) AS $$
	BEGIN
		RETURN QUERY
		SELECT ar.name AS artist_name, COUNT(ar.name) AS total_songs
		FROM artist ar
		JOIN song s ON s.artist_id = ar.id
		GROUP BY ar.name;
	END
	
$$ LANGUAGE plpgsql;


SELECT * FROM get_song_count_by_artist();

-- Create a function that return the number of songs by provided artist_name

CREATE OR REPLACE FUNCTION get_artist_song_count(artist_name VARCHAR) -- declaration of function
RETURNS INTEGER -- return type of funcition
AS $$ -- Body of function
	DECLARE
	v_artist_id INTEGER;
	song_count INTEGER;

	BEGIN
		-- Retrieve arist_id from the artist_name parameter
		SELECT artist.id INTO v_artist_id -- (with INTO we ASSIGN value to the variable)
		FROM artist
		WHERE artist.name = artist_name;
		
		-- Retrieve the number of songs count using the helper variable v_artist_id
		SELECT COUNT(*) INTO song_count -- (with INTO we ASSIGN value to the variable)
		FROM song
		WHERE song.artist_id = v_artist_id;
		
		return song_count; -- return the variable that has the value count of songs 
	END;

$$ LANGUAGE plpgsql;

SELECT * FROM get_artist_song_count('Eminem');
SELECT * FROM get_artist_song_count('Dua Lipa');
SELECT * FROM get_artist_song_count('Drake');
SELECT * FROM get_artist_song_count('Ceca');
