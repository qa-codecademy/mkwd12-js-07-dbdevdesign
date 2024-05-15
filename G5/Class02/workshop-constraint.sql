-- All songs must be saved with positive duration
ALTER TABLE song
ADD CONSTRAINT check_durating_positive CHECK (duration >= interval '1 seconds');

-- Will return error from the table validation
INSERT INTO song (name, duration, explicit, artist_id) VALUES
('Shape of You 2', '00:00:00', false, 1);