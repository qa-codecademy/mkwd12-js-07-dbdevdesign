-- SONG TABLE
CREATE TABLE song (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
	explicit BOOLEAN DEFAULT false NULL
);

INSERT INTO song (name, duration)
VALUES 
('You look good in the dance floor', '3:05'),
('Some song name', '0:3:05');


SELECT * FROM song;

-- SONG LYRICS

CREATE TABLE song_lyrics (
	id SERIAL PRIMARY KEY,
	lyrics TEXT NOT NULL
);

-- ARTIST

CREATE TABLE artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
)

-- ARTIST_DETAILS

CREATE TABLE artist_details(
	id SERIAL PRIMARY KEY,
	date_of_birth DATE NOT NULL,
	full_name VARCHAR(100) NOT NULL,
	country VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
	is_married BOOLEAN default false NOT NULL,
	spouse_name VARCHAR(100) NOT NULL
);

SELECT * FROM artist_details;

-- ALBUM

CREATE TABLE album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	rating DECIMAL
)

-- GENRE

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL);

-- PLAY LIST
	CREATE TABLE playlist (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100));