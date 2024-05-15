-- Table constraints (Default, Check, Unique)

-- 1. Default constraint (Set default value for explicit column in song table)
ALTER TABLE song
ALTER COLUMN explicit SET DEFAULT false;

-- 2. Check constraint (Ensure duration is not negative in song table)
ALTER TABLE song
ADD CONSTRAINT check_duration_positive CHECK (duration >= INTERVAL '0 seconds')

-- 3. Check constraint (All albums must be saved with positive rating)
ALTER TABLE album
ADD CONSTRAINT check_rating_positive CHECK(rating > 0);

-- 4. Unique constraint (Ensure uniqueness of title in playlist)
ALTER TABLE playlist
ADD CONSTRAINT unique_playlist_title UNIQUE(title)

-- 5. Unique constraint (Ensure uniqueness of name in genre)
ALTER TABLE genre
ADD CONSTRAINT unique_genre_name UNIQUE(name)

-- Referential integrity (Foreign Keys)

-- Add foreign key constraint to album table referencing artist table
-- Once artist is deleted, all the albums related to that artist are deleted 
ALTER TABLE album
ADD CONSTRAINT fk_album_artist
FOREIGN KEY (artist_id)
REFERENCES artist(id)

-- Ensures that if artist is deleted from the artist table, then all the albums that belong to that artist_id ar also deleted from the album table
ON DELETE CASCADE;



