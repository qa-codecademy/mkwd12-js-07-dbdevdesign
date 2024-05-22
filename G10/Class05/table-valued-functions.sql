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
	
SELECT * FROM get_artist_songs('Eminem');	
SELECT * FROM get_artist_songs('Tose Proeski');	


	