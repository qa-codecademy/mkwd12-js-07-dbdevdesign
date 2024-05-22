-- Create a function that searches for song name by given id

CREATE OR REPLACE FUNCTION get_song_name(song_id INT)
RETURNS VARCHAR -- return type of the function
AS 
$$ -- scope of the function
	DECLARE song_name VARCHAR(50); -- declaring a variable that lives in the scope of the function
	
	BEGIN 
		
		SELECT song.name
		INTO song_name -- INIT. OF THE VARIABLE (We assign. a value to the VARIABLE)
		FROM song 
		WHERE song.id = song_id;
		
		RETURN song_name;
	END
	
$$ LANGUAGE plpgsql;


SELECT * FROM get_song_name(1);
SELECT * FROM get_song_name(2);
SELECT * FROM get_song_name(10);

--  IN JS :D
-- function get_song_name(songID: number) {
--   let song_name: string;

--   const song = songs.find(song => song.id === songID);
--   song_name = song.name;

--   return song_name;
-- }