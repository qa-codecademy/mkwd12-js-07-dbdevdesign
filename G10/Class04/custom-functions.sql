-- 1. Declare function (get_average_song_duration) for retrieving the average duration of all existing songs

-- In this example, we create a new PostgreSQL function called get_average_song_duration, which calculates the average duration of songs in the song table. The function returns the average duration as an INTERVAL data type. We then execute the function to retrieve the average duration of songs.
-- Function definition
-- Everything between $$ is declared as a function body
-- The DECLARE keyword introduces the declaration section where variables used in the function are defined
-- BEGIN ... END; block contains the executable statements of the function.

CREATE OR REPLACE FUNCTION get_average_song_duration()
RETURNS INTERVAL AS $$
DECLARE 
-- variable named avg_duration which is of type INTERVAL
	avg_duration INTERVAL;
BEGIN
-- Calculate average duration of songs
-- calculates the average value of the duration column from the song table and stores the result in the avg_duration variable. The AVG function computes the average, and the INTO clause assigns the result to the variable
	SELECT AVG(duration) INTO avg_duration
	FROM song;
-- This statement returns the value stored in the avg_duration variable, which is the average duration of the songs.
    RETURN avg_duration; -- Return the average duration
END;
$$ LANGUAGE plpgsql;

-- Example of executing the function
SELECT get_average_song_duration() AS average_duration;

-- 2. Declare a function get_artist_song_count that is going to retrieve the number of songs that the artists has
-- In this example, we create a new PostgreSQL function called get_artist_song_count, which takes the name of an artist as input and returns the count of songs associated with that artist. We then execute the function to retrieve the number of songs for the artist 'Ed Sheeran'.
CREATE OR REPLACE FUNCTION get_artist_song_count(artist_name VARCHAR)
RETURNS INTEGER AS $$
DECLARE
	v_artist_id INTEGER;
	song_count INTEGER;
BEGIN
	SELECT id INTO v_artist_id
	FROM artist
	WHERE name = artist_name;

	SELECT COUNT(*) INTO song_count
	FROM song
	WHERE artist_id = v_artist_id;

	RETURN song_count;
END;
$$ LANGUAGE plpgsql;

SELECT get_artist_song_count('Eminem');
SELECT get_artist_song_count('Ed Sheeran');

-- 3. Declare a function “get_artist_songs” that is going to provide a table as a return value, with information about song name, song duration and about being explicit or not, based on provided artist name
-- In this example, we create a table-valued function called get_artist_songs. This function takes the name of an artist as input and returns a table of songs associated with that artist, including the song name, duration, and whether it's explicit. We then execute the function to retrieve the songs for the artist 'Ed Sheeran'.
-- Table-Valued Function Definition
CREATE OR REPLACE FUNCTION get_artist_songs(artist_name VARCHAR)
RETURNS TABLE (
    song_name VARCHAR,
    duration INTERVAL,
    explicit BOOLEAN
) AS $$
BEGIN
    RETURN QUERY
    SELECT s.name, s.duration, s.explicit
    FROM song s
    INNER JOIN artist a ON s.artist_id = a.id
    WHERE a.name = artist_name;
END;
$$ LANGUAGE plpgsql;

-- Example of executing the function
SELECT * FROM get_artist_songs('Ed Sheeran');
