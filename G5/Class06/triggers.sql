SELECT * FROM song 
WHERE album_id = 1;
SELECT * FROM album;


SELECT AVG(s.rating)
FROM song s
WHERE s.album_id = 1;
	
	
-- CREATE NEW COLUMN rating FOR song table
ALTER TABLE song
ADD COLUMN rating DECIMAL(2, 1) CHECK (rating >= 1 AND rating <=5);

-- POPULATE RATING COLUMN WITH RANDOM VALUES
UPDATE song
SET rating = FLOOR(RANDOM() * 5 + 1);

-- CREATING THE TRIGGER
CREATE OR REPLACE FUNCTION update_album_rating()
RETURNS TRIGGER
AS $$
DECLARE updated_avg_rating NUMERIC;
BEGIN
	
	-- Recalculating the avg rating of the songs that correspond to the same album (album_id)
	SELECT  ROUND(AVG(s.rating), 1) INTO updated_avg_rating
	FROM song s
	-- NEW INNER BUILT VARIABLE FOR THE SCOPE OF TRIGGER
	-- NEW CONTAINS THE STATE (VALUE) OF THE ROW THAT IS ABOUT TO BE SAVED OR IT IS THE NEW ROW SAVED
	WHERE s.album_id = NEW.album_id;
	
	-- Logging the new value of the recalculated rating
	RAISE NOTICE 'NEW RATING avg_rating: %',
	updated_avg_rating;
	
	-- LOG THE NEW VALUE
	RAISE NOTICE 'NEW SONG ID: %, NEW SONG NAME: %',
	NEW.id, NEW.name;
	
	-- Update the rating of the coresponding album_id
	UPDATE album
	SET rating = updated_avg_rating
	WHERE id = NEW.album_id;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- BINDING THE TRIGGER
CREATE OR REPLACE TRIGGER album_rating_update -- step 1: create the trigger
AFTER INSERT OR UPDATE ON song -- step 2: when should the trigger occure
FOR EACH ROW -- step 3: to be executed on each row (update or insert)
EXECUTE FUNCTION update_album_rating() -- step 4: this trigger will execute this trigger function


-- ADDING NEW SONG
INSERT INTO song(id, name, duration, explicit, artist_id, album_id, rating) VALUES
(391, 'Some dummy song 4', '3 minutes', false, 1, 1, 5.0);

-- EXAMPLE TWO

CREATE TABLE IF NOT EXISTS song_logs (
	id SERIAL PRIMARY KEY,
	action VARCHAR(10) NOT NULL,
	song_id INT, -- not adding reference to keep deleted songs
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
    explicit BOOLEAN NOT NULL
);

SELECT * FROM song_logs;

-- TRIGGER FUNCTION

CREATE OR REPLACE FUNCTION log_songs_changes()
RETURNS TRIGGER
AS $$
BEGIN
	IF TG_OP = 'INSERT' THEN
	 -- insert data
		INSERT INTO song_logs(action, song_id, name, duration, explicit) VALUES
		('INSERT', NEW.id, NEW.name, NEW.duration, NEW.explicit);
	ELSEIF TG_OP = 'UPDATE' THEN
		INSERT INTO song_logs(action, song_id, name, duration, explicit) VALUES
		('UPDATE', NEW.id, NEW.name, NEW.duration, NEW.explicit);
	ELSEIF TG_OP = 'DELETE' THEN
		INSERT INTO song_logs(action, song_id, name, duration, explicit) VALUES
		('DELETE', OLD.id, OLD.name, OLD.duration, OLD.explicit);
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- CREATE TRIGGER
CREATE OR REPLACE TRIGGER song_changes_trigger
AFTER INSERT OR UPDATE OR DELETE ON song
FOR EACH ROW
EXECUTE FUNCTION log_songs_changes();


-- Insert new row
INSERT INTO song(id, name, duration, explicit, artist_id, album_id, rating) VALUES
(393, 'Dummy song', '3 minutes', false, 1, 3, 4.0);


-- UPDATE A SONG
UPDATE song
SET name = 'Dummy song amigo'
WHERE id = 392;

-- DELETE A SONG
DELETE FROM song
WHERE id = 393;