-- Transaction 1 - Insert songs into a new playlist called Favorites

BEGIN;

INSERT INTO playlist (title) VALUES ('Favorites');

INSERT INTO playlists_songs (playlist_id, song_id)
VALUES
	((SELECT id FROM playlist WHERE title = 'Favorites'), 1),
	((SELECT id FROM playlist WHERE title = 'Favorites'), 4),
	((SELECT id FROM playlist WHERE title = 'Favorites'), 10);

COMMIT;

SELECT * FROM playlist p 
JOIN playlists_songs ps ON ps.playlist_id = p.id
JOIN song s ON s.id = ps.song_id
WHERE title = 'Favorites'

-- Transaction 2

BEGIN;

-- Insert new artist
INSERT INTO artist (name) VALUES ('Tonyo San');

-- Insert new album
INSERT INTO album (name, rating)
VALUES ('Future Nostalgia', 4.5);

-- Insert songs into the album, linking both artist_id and album_id
INSERT INTO song (name, duration, explicit, artist_id, album_id)
VALUES
    ('Bonus Traka', '00:03:03', false, (SELECT id FROM artist WHERE name = 'Tonyo San' LIMIT 1), (SELECT id FROM album WHERE name = 'Future Nostalgia' LIMIT 1)),
    ('Odmazda', '00:03:13', false, (SELECT id FROM artist WHERE name = 'Tonyo San' LIMIT 1), (SELECT id FROM album WHERE name = 'Future Nostalgia' LIMIT 1)),
    ('Frekfrencii', '00:03:23', false, (SELECT id FROM artist WHERE name = 'Tonyo San' LIMIT 1), (SELECT id FROM album WHERE name = 'Future Nostalgia' LIMIT 1)),
    ('Megju Redovi', '00:03:42', false, (SELECT id FROM artist WHERE name = 'Tonyo San' LIMIT 1), (SELECT id FROM album WHERE name = 'Future Nostalgia' LIMIT 1));

-- Update album rating
UPDATE album SET rating = 4.8 WHERE name = 'Future Nostalgia';

-- Delete related entries in song_lyrics, songs_genres and playlists_songs tables
DELETE FROM song_lyrics WHERE song_id IN (SELECT id FROM song WHERE explicit = true);
DELETE FROM playlists_songs WHERE song_id IN (SELECT id FROM song WHERE explicit = true);
DELETE FROM songs_genres WHERE song_id IN (SELECT id FROM song WHERE explicit = true);

-- Delete songs with explicit content
DELETE FROM song WHERE explicit = true;

-- Commit Transaction
COMMIT;

SELECT * from artist where name = 'Tonyo San'
SELECT * from album where name = 'Future Nostalgia'

SELECT * from song where explicit = true