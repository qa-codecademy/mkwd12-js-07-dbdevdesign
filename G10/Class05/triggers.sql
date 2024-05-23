SELECT * FROM album;
SELECT * FROM song;
-- In this example, we define a trigger function named update_album_rating. This function calculates the average rating of songs in an album whenever a new song is inserted or updated. 
-- Then, we create a trigger named album_rating_update that executes the update_album_rating function after each insert or update on the song table.

-- Has to be done before the trigger creation to enable songs to have rating
-- Step 1: Add the rating field to the song table
ALTER TABLE song
ADD COLUMN rating DECIMAL(2, 1) CHECK (rating >= 1 AND rating <= 5);

-- Step 2: Create the function to add random ratings
CREATE OR REPLACE FUNCTION add_random_rating_to_songs()
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE song
	SET rating = FLOOR(RANDOM() * 5 + 1);
END;
$$;

-- Add random ratings to all songs
SELECT add_random_rating_to_songs();

-- Check if rating column has been populated properly
SELECT * FROM song;

-- Define trigger function
CREATE OR REPLACE FUNCTION update_album_rating()
RETURNS TRIGGER AS $$
BEGIN
	UPDATE album
	SET rating = (
		SELECT AVG(s.rating)
		FROM song s
		WHERE s.album_id = NEW.id
	)
	WHERE id = NEW.id;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- CREATE TRIGGER
CREATE TRIGGER album_rating_update
AFTER INSERT OR UPDATE ON song
FOR EACH ROW
EXECUTE FUNCTION update_album_rating();

-- This trigger function, log_song_changes, logs any changes made to the song table into the song_audit table. 
-- It captures the action (insert, update, or delete) along with the relevant details of the song. The trigger song_changes_trigger is set to execute the log_song_changes function after each insert, update, or delete operation on the song table.

-- Creating a new table to save audit data
CREATE TABLE IF NOT EXISTS song_audit (
	id SERIAL PRIMARY KEY,
	action VARCHAR(10) NOT NULL,
	song_id INT, -- not adding reference to keep deleted songs
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
    explicit BOOLEAN NOT NULL
);

-- Creating the function that will log data into the song_audit table
CREATE OR REPLACE FUNCTION log_song_changes()
RETURNS TRIGGER AS $$
BEGIN
	IF TG_OP = 'INSERT' THEN 
	INSERT INTO song_audit(action, song_id, name, duration, explicit)
	VALUES ('INSERT', NEW.id, NEW.name, NEW.duration, NEW.explicit);
	
	ELSIF TG_OP = 'UPDATE' THEN
	INSERT INTO song_audit(action, song_id, name, duration, explicit)
	VALUES('UPDATE', NEW.id, NEW.name, NEW.duration, NEW.explicit);
	
	ELSIF TG_OP = 'DELETE' THEN
	INSERT INTO song_audit(action, song_id, name, duration, explicit)
	VALUES('UPDATE', OLD.id, OLD.name, OLD.duration, OLD.explicit);
	
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql

-- Create TRIGGER
CREATE TRIGGER song_changes_trigger
AFTER INSERT OR UPDATE OR DELETE ON song
FOR EACH ROW
EXECUTE FUNCTION log_song_changes();

-- Example
INSERT INTO song (name, duration, explicit, artist_id, album_id) VALUES
('Song 2', '3 minutes 31 seconds', false, 2, 2)

INSERT INTO song (name, duration, explicit, artist_id, album_id, rating) VALUES
('Song 2', '3 minutes 31 seconds', false, 2, 2, 1)

UPDATE song
SET name = 'Updated song name'
WHERE id = 388;

SELECT * FROM song_audit;
SELECT * FROM album;

