-- 1. Stored Procedure to Insert a New Artist and Their Details
-- This stored procedure, add_artist_with_details, will insert a new artist into the artist table and their corresponding details into the artist_details table.

CREATE OR REPLACE PROCEDURE add_artist_with_details(
	p_name VARCHAR,
	p_date_of_birth DATE,
	p_full_name VARCHAR,
	p_country VARCHAR,
	p_city VARCHAR,
	p_is_married BOOLEAN,
	p_spouse_name VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE 
	v_artist_id INT;
BEGIN
	-- Insert into artist table and get the artis_id
	INSERT INTO artist (name) 
	VALUES (p_name) 
	RETURNING id INTO v_artist_id;
	
	-- Insert into artist_details table
	INSERT INTO artist_details (
		date_of_birth,
		full_name,
		country,
		city,
		is_married,
		spouse_name,
		artist_id
	) VALUES (
		p_date_of_birth,
		p_full_name,
		p_country,
		p_city,
		p_is_married,
		p_spouse_name,
		v_artist_id
	);
	
	COMMIT;
END;
$$;

-- Calling the procedure
CALL add_artist_with_details('Alicia Keys', '1985-01-01', 'Alicia Keys', 'USA', 'New York', true, 'Bob Bobsky');

-- Check if the data has been written in the relevant tables successfully
SELECT * FROM artist;
SELECT * FROM artist_details WHERE artist_id = 46;


-- 2. Creating a new playlist and inserting list of songs to that playlist
CREATE OR REPLACE PROCEDURE create_playlist_with_songs(
	p_playlist_title VARCHAR,
	p_song_ids INT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
	v_playlist_id INT;
	song_id INT;
BEGIN
	-- Insert new playlist and get the playlist_id
	INSERT INTO playlist (title) 
	VALUES (p_playlist_title)
	RETURNING id INTO v_playlist_id;
	
	-- Insert songs into the playlist
	FOREACH song_id IN ARRAY p_song_ids
	LOOP
		INSERT INTO playlists_songs (playlist_id, song_id) VALUES (v_playlist_id, song_id);
	END LOOP;
	
	EXCEPTION 
		WHEN OTHERS THEN
		-- Rollback the transaction in case of an error
		ROLLBACK;
		RAISE;
END;
$$;

CALL create_playlist_with_songs('My Fav Songs', ARRAY[10, 11, 24]);


-- Check if the data has been written in the relevant tables successfully
SELECT * FROM playlist;
SELECT * FROM playlists_songs WHERE playlist_id = 12;

-- Sending ivalid arguments to the prcedure to check if it will throw an error
CALL create_playlist_with_songs('Invalid playlist', ARRAY[2588, 8521, 88647]);



	