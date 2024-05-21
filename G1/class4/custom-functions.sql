-- Get average song duration from all songs

CREATE OR REPLACE FUNCTION get_avg_song_duration()
RETURNS INTERVAL
LANGUAGE plpgsql
AS
$$
DECLARE
	avg_duration INTERVAL;
BEGIN
SELECT AVG(duration)
INTO avg_duration
FROM song;

RETURN avg_duration;
END;
$$;

SELECT get_avg_song_duration()

-- Get song count by artist

CREATE OR REPLACE FUNCTION get_artist_song_count(artist_name VARCHAR)
RETURNS INTEGER
AS
$$
DECLARE
	v_artist_id INTEGER;
	song_count INTEGER;
BEGIN
	SELECT id
	INTO v_artist_id
	FROM artist
	WHERE name = artist_name;

	SELECT COUNT(*) 
	INTO song_count
	FROM song
	WHERE artist_id = v_artist_id;
	
	RETURN song_count;
END;
$$ LANGUAGE PLPGSQL;


SELECT get_artist_song_count('Eminem');
SELECT get_artist_song_count('Dua Lipa');
SELECT get_artist_song_count('Ld Pistolero');

-- Table valued functions
-- Provide all songs by artist

CREATE OR REPLACE FUNCTION get_artist_songs(artist_name VARCHAR)
RETURNS TABLE (
	song_name VARCHAR,
	duration INTERVAL,
	explicit BOOLEAN
) AS $$
BEGIN
	RETURN QUERY
	SELECT s.name as song_name, s.duration as duration, s.explicit as explicit
	FROM song s
	JOIN artist a ON s.artist_id = a.id
	WHERE a.name = artist_name;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM get_artist_songs('Kaliopi')
SELECT * FROM get_artist_songs('Ceca')