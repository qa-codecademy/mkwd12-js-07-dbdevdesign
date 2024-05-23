-- Fixing "duplicate ID" due to starting back at id 1
SELECT setval(pg_get_serial_sequence('playlist', 'id'), (SELECT MAX(id) FROM playlist));
SELECT setval(pg_get_serial_sequence('song', 'id'), (SELECT MAX(id) FROM song));
SELECT setval(pg_get_serial_sequence('album', 'id'), (SELECT MAX(id) FROM album));
SELECT setval(pg_get_serial_sequence('artist', 'id'), (SELECT MAX(id) FROM artist));
SELECT setval(pg_get_serial_sequence('song_lyrics', 'id'), (SELECT MAX(id) FROM song_lyrics));
SELECT setval(pg_get_serial_sequence('genre', 'id'), (SELECT MAX(id) FROM genre));
SELECT setval(pg_get_serial_sequence('artist_details', 'id'), (SELECT MAX(id) FROM artist_details));

-- This transaction example begins by inserting a new playlist titled 'Favorites' into the playlists table. 
-- Then, it inserts three songs into the 'Favorites' playlist by adding corresponding records into the playlist_songs table. 
-- Next, it updates the ratings of the songs with IDs 1, 3, and 5 in the song table. 
-- Finally, the transaction is committed, ensuring that all changes made within the transaction are applied automatically.

BEGIN TRANSACTION;

-- Insert new playlist
INSERT INTO playlist(id, title) VALUES (201, 'Favorites');

-- Insert songs into the playlist
INSERT INTO playlists_songs(playlist_id, song_id)
VALUES
	((SELECT id FROM playlist WHERE title = 'Favorites' LIMIT 1), 1),
	((SELECT id FROM playlist WHERE title = 'Favorites' LIMIT 1), 3),
	((SELECT id FROM playlist WHERE title = 'Favorites' LIMIT 1), 5);

-- Commit transaction
COMMIT TRANSACTION;

SELECT * FROM playlists_songs WHERE playlist_id = 201;


-- Explanation:
-- Begin Transaction: Starts the transaction.
-- Insert New Artist: Adds 'Dua Lipa' to the artist table.
-- Insert New Album: Adds 'Future Nostalgia' to the album table with an initial rating of 4.5.
-- Insert Songs: Adds the songs associated with both artist_id and album_id retrieved from their respective tables.
-- Update Album Rating: Updates the rating of 'Future Nostalgia' to 4.8.
-- Delete Explicit Songs: Removes any songs marked as explicit from the song table.
-- Commit Transaction: Commits the transaction to ensure all changes are applied atomically.

-- Begin Transaction
-- Begin Transaction
BEGIN;

-- Insert new artist
INSERT INTO artist (id, name) VALUES (1001, 'Tonyo San');

-- Insert new album
INSERT INTO album (id, name, rating)
VALUES (20001, 'Future Nostalgia', 4.5);

-- Insert songs into the album, linking both artist_id and album_id
INSERT INTO song (id, name, duration, explicit, artist_id, album_id)
VALUES
    (3001, 'Bonus Traka', '00:03:03', false, (SELECT id FROM artist WHERE name = 'Tonyo San' LIMIT 1), (SELECT id FROM album WHERE name = 'Future Nostalgia' LIMIT 1)),
    (3002, 'Odmazda', '00:03:13', false, (SELECT id FROM artist WHERE name = 'Tonyo San' LIMIT 1), (SELECT id FROM album WHERE name = 'Future Nostalgia' LIMIT 1)),
    (3003, 'Frekfrencii', '00:03:23', false, (SELECT id FROM artist WHERE name = 'Tonyo San' LIMIT 1), (SELECT id FROM album WHERE name = 'Future Nostalgia' LIMIT 1)),
    (3004, 'Megju Redovi', '00:03:42', false, (SELECT id FROM artist WHERE name = 'Tonyo San' LIMIT 1), (SELECT id FROM album WHERE name = 'Future Nostalgia' LIMIT 1));

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