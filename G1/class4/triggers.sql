-- Example 1 

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

-- Example usage: Add random ratings to all songs
SELECT add_random_rating_to_songs();

-- Trigger Function Definition
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

-- Create Trigger
CREATE TRIGGER album_rating_update
AFTER INSERT OR UPDATE ON song
FOR EACH ROW
EXECUTE FUNCTION update_album_rating();

INSERT INTO song (name, duration, artist_id, album_id, explicit)
VALUES ('Pesna 1', '3 minute', 1, 2, true)

INSERT INTO song (name, duration, artist_id, album_id, explicit)
VALUES ('Pesna 2', '4 minute', 2, 3, true)

-- Example 2: Song Audit

CREATE TABLE IF NOT EXISTS song_audit (
	id SERIAL PRIMARY KEY,
	action VARCHAR(10) NOT NULL, -- UPDATE, DELETE, INSERT
	song_id INT,
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
	explicit BOOL NOT NULL
);

CREATE OR REPLACE FUNCTION log_song_changes()
RETURNS TRIGGER AS $$
BEGIN	
	IF TG_OP = 'INSERT' THEN
		INSERT INTO song_audit (action, song_id, name, duration, explicit)
		VALUES ('INSERT', NEW.id, NEW.name, NEW.duration, NEW.explicit);
	ELSEIF TG_OP = 'UPDATE' THEN
		INSERT INTO song_audit (action, song_id, name, duration, explicit)
		VALUES ('UPDATE', NEW.id, NEW.name, NEW.duration, NEW.explicit);
	ELSEIF TG_OP = 'DELETE' THEN
		INSERT INTO song_audit (action, song_id, name, duration, explicit)
		VALUES ('DELETE', OLD.id, OLD.name, OLD.duration, OLD.explicit);
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER song_changes_trigger
AFTER INSERT OR UPDATE OR DELETE ON song
FOR EACH ROW
EXECUTE FUNCTION log_song_changes();

SELECT * FROM song_audit 
WHERE song_id = 389

INSERT INTO song (name, duration, artist_id, album_id, explicit)
VALUES ('Nova pesna', '1 minute', 1, 1, true)

INSERT INTO song (name, duration, artist_id, album_id, explicit)
VALUES ('EPten nova pesna', '2 minute', 2, 2, true)

UPDATE song
SET name = 'Epten nova pesna'
WHERE id = 389

DELETE FROM song
WHERE id = 388
