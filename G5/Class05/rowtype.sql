CREATE OR REPLACE FUNCTION get_artist_by_id(artist_id INT)
RETURNS artist
AS $$
DECLARE 
	-- (artist_row IS THE NAME OF THE VARIABLE)
	-- artist%ROWTYPE is the type of the variable (meaning the variable will be as same as the columns in artist table)
	artist_row artist%ROWTYPE;
	
	BEGIN
		SELECT id, name INTO artist_row
		FROM artist
		WHERE artist.id = artist_id;
		
		RETURN artist_row;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_artist_by_id(12);


-- CREATE a function that returns the album by given album name. the return must be rowtype

CREATE OR REPLACE FUNCTION get_album_by_name(album_name VARCHAR)
RETURNS album 
AS $$
DECLARE
	album_row album%ROWTYPE;
	let album_row;
	BEGIN
		SELECT * INTO album_row -- (ASSIGN VALUE TO THE PREVIOUSLY DECLARED VARIABLE)
		FROM album
		WHERE name = album_name;
	
		RETURN album_row; -- (RETURN THE VARIABLE THAT WE DECLARED AND ASSIGNED VALUE TO IT)
	END;

$$ LANGUAGE plpgsql

SELECT * FROM get_album_by_name('Good Girl Gone Bad');
SELECT * FROM get_album_by_name('The Eminem Show');