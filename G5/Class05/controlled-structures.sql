-- Controlled structures

CREATE OR REPLACE FUNCTION artist_count_message()
RETURNS TEXT
AS 
$$	
	-- declare
DECLARE
artist_count INT;
	
	BEGIN
		-- logic of function
		SELECT COUNT(*) INTO artist_count FROM artist;
		
		-- If arist_count > 10 return message "lots of aritst"
		IF artist_count > 10 
			THEN RETURN 'There are lots of artists';
		-- else if artist_count > 100 return message "some message"
		ELSIF artist_count < 10
			THEN RETURN 'There are few artists';
		-- else no artists found
		ELSE
			RETURN 'No artist found';
		
		END IF;
		
	END;
	
$$ LANGUAGE plpgsql;



SELECT * FROM artist_count_message()


-- Example 2 (insert into album and check if rating is provided, if not save with default rating value as const )

SELECT * FROM album;

CREATE OR REPLACE FUNCTION insert_album(album_id INT, album_name VARCHAR, album_rating NUMERIC DEFAULT NULL)
RETURNS VARCHAR
AS 
$$
DECLARE 
default_rating CONSTANT NUMERIC := 3.5;
	BEGIN 
		IF album_rating IS NULL THEN 
			INSERT INTO album(id, name, rating) VALUES(album_id, album_name, default_rating);
		ELSE 
			INSERT INTO album(id, name, rating) VALUES(album_id, album_name, album_rating);
		END IF;
		
		RETURN 'Album added';
	END;
$$ LANGUAGE plpgsql;


SELECT insert_album(53, 'Album test one');
SELECT * FROM insert_album(54, 'Album test two', 5);