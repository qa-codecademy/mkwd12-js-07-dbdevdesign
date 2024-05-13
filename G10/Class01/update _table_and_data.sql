-- Add a new column 'release_date' to the 'album' table
ALTER TABLE album 
ADD COLUMN release_date DATE;

SELECT * FROM song;

-- Rename the column 'explicit' to 'is_explicit' in the 'song' table
ALTER TABLE song
RENAME COLUMN explicit TO is_explicit;

SELECT * FROM song_lyrics;

-- Truncate table - remove content only
TRUNCATE TABLE song_lyrics;

-- Drop table - completely delete the table
DROP TABLE IF EXISTS song_lyrics;

-- Update rows in table
SELECT * FROM album;
UPDATE album
SET release_date = '2024-05-13'
WHERE id = 1;

SELECT * FROM song;
UPDATE song
SET duration = '4 minutes'
WHERE id = 1;