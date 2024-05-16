CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_details (
	id SERIAL PRIMARY KEY,
	date_of_birth TIMESTAMPTZ NOT NULL,
	full_name VARCHAR(100) NOT NULL,
	country VARCHAR(100) NOT NULL,
	city VARCHAR(100) NULL,
	is_married BOOL NULL,
	spouse_name VARCHAR(100) NULL,
	artist_id INT UNIQUE REFERENCES artist(id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	rating FLOAT
);

CREATE TABLE IF NOT EXISTS song (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
	explicit BOOL DEFAULT false NOT NULL,
	artist_id INT REFERENCES artist(id)
	album_id INT REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS song_lyrics (
	id SERIAL PRIMARY KEY,
	lyrics TEXT NOT NULL,
	song_id INT UNIQUE REFERENCES song(id)
);

CREATE TABLE IF NOT EXISTS playlist (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS songs_playlists (
	song_id INT REFERENCES song(id),
	playlist_id INT REFERENCES playlist(id),
	PRIMARY KEY (song_id, playlist_id)
);

CREATE TABLE IF NOT EXISTS genre (
 	id SERIAL PRIMARY KEY,
	name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS songs_genres (
	song_id INT REFERENCES song(id),
	genre_id INT REFERENCES genre(id),
	PRIMARY KEY (song_id, genre_id)
);

-- SELECTING DATA

SELECT * FROM album;
SELECT * FROM artist;
SELECT * FROM artist_details;
SELECT * FROM genre;
SELECT * FROM playlist;
SELECT * FROM song;
SELECT * FROM song_lyrics;
SELECT * FROM songs_genres;
SELECT * FROM songs_playlists;

-- INSERTING DATA

INSERT INTO artist (name) VALUES ('50 Cent'), ('Eminem');

INSERT INTO artist_details (date_of_birth, full_name, country, city, is_married, spouse_name, artist_id) VALUES 
('1972-10-17', 'Marshall Mathers', 'USA', 'Detroid', false, NULL, 2),
('1970-01-01', 'Curstis Jacson', 'USA', 'New York', true, 'Jacksona', 1)

-- Inserting will fail because we can place rating from 0 - 5
INSERT INTO album (id, name, rating) VALUES (101, 'ne e bitno', 16)

INSERT INTO song (name, duration, explicit, artist_id) VALUES
('Id The Club', '3 minutes 20 seconds', true, 1, 1),
('Mockingbird', '4 minutes 21 seconds', false, 2, 1)

INSERT INTO song_lyrics (lyrics, song_id) VALUES
('It is your birthday..', 1)

INSERT INTO genre (name) VALUES
('Rap'),
('Rock'),
('Folk'),
('Pop')


INSERT INTO playlist (title) VALUES
('Working out music'),
('Relax music'),
('Working music')


INSERT INTO songs_genres (song_id, genre_id) VALUES
(2, 2)

INSERT INTO songs_playlists (song_id, playlist_id) VALUES
(1, 2),
(1, 3),
(2, 1)

-- Filtering
-- Find all artists named = ‘Eminem’
SELECT * FROM artist
WHERE name = 'Eminem'
-- • Find all artists who’s name starts with ’M’
SELECT * FROM artist 
WHERE name ILIKE 'm%'
-- • Find all artists from ‘Canada’
SELECT * FROM artist_details
WHERE country = 'Canada'
-- • Find all married artists from ‘United States'
SELECT * FROM artist_details
WHERE is_married = true AND country = 'USA'
-- • Find all artists with date of birth greater than ‘01.01.1980’
SELECT * from artist_details
WHERE date_of_birth > '01.01.1980'
-- • Find all explicit songs
SELECT * FROM song
WHERE explicit = true
-- • Find all lyrics containing the word “can”
SELECT * FROM song_lyrics
WHERE lyrics ILIKE '%can%'
-- • Find all albums having rating more than 3
SELECT * FROM album
WHERE rating > 3
-- • Find all artists married to a person who’s name starts with ‘K’
SELECT * FROM artist_details
WHERE is_married = true AND spouse_name ILIKE 'A%'
-- • Find all single artists from ‘Zagreb’
SELECT * FROM artist_details
WHERE is_married = false AND city = 'London'

-- Order By
SELECT * from artist_details
ORDER BY date_of_birth DESC

SELECT * from artist_details
WHERE is_married = true
ORDER BY date_of_birth ASC

SELECT * FROM album
ORDER BY name ASC

-- • Find all genres sorted by name A-Z
SELECT * FROM genre
ORDER BY name ASC
-- • Find all albums who’s name starts with “A” sorted by rating
SELECT * FROM album
WHERE name ILIKE 'A%'
ORDER BY rating DESC
-- • Find all songs ending on “O” sorted by duration
SELECT * FROM song
WHERE name ILIKE '%o'
ORDER BY duration desc
-- • Find all married artists sorted by spouse name
SELECT * FROM artist_details
WHERE is_married = true
ORDER BY spouse_name ASC
-- • Find all artists from ‘Macedonia’ sorted by city name
SELECT * FROM artist_details
WHERE country = 'Macedonia'
ORDER BY city ASC

-- Combining sets
-- Union, Union ALL, Intersect

-- Getting all names from songs and albums - WITHOUT duplicates
SELECT name FROM song
UNION
SELECT name from album

-- Getting all names from songs and albums - WITH duplicates
SELECT name from song
UNION ALL
SELECT name from album

-- Getting all repeating names from songs and albums
SELECT name from song
INTERSECT
SELECT name from album

-- CONSTRAINTS
-- UNIQUE

-- Inserting will fail because we already have Soul name in genres
INSERT INTO genre (id, name) VALUES (46, 'Soul')


-- Check

-- Adding song without artist
INSERT INTO song (id, name, duration, explicit) VALUES
(100, 'Nekoja', '00:03:00', false);

-- Adding artist without song
INSERT INTO artist (id, name) VALUES
(1000, 'NEKOJ');

-- Relations

-- INNER JOIN
-- all artists with their song names
SELECT artist.name as artist_name, song.name as song_name
FROM artist
INNER JOIN song ON artist.id = song.artist_id
ORDER BY artist.name ASC

-- OUTER JOIN

-- Case 1: Using left join and starting from artist => Will provide null values for song game
SELECT artist.name as artist_name, song.name as song_name
FROM artist
LEFT OUTER JOIN song ON artist.id = song.artist_id
ORDER BY artist.name ASC

-- Case 2: Using right join and starting from artist => Will provide null values for artist game
SELECT artist.name as artist_name, song.name as song_name
FROM artist
RIGHT OUTER JOIN song ON artist.id = song.artist_id
ORDER BY artist.name ASC

-- Case 3: Using left join and starting from song => Will provide null values for artist game
SELECT artist.name as artist_name, song.name as song_name
FROM song
LEFT OUTER JOIN artist ON artist.id = song.artist_id
ORDER BY artist.name ASC

-- Case 4: Using right join and starting from song => Will provide null values for song game
SELECT artist.name as artist_name, song.name as song_name
FROM song
RIGHT OUTER JOIN artist ON artist.id = song.artist_id
ORDER BY artist.name ASC

-- CASE 5: Using outer join => Will provide null values both for artist and song
SELECT artist.name as artist_name, song.name as song_name
FROM song
FULL OUTER JOIN artist ON artist.id = song.artist_id
ORDER BY artist.name ASC