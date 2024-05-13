-- Workshop

-- * artist
-- name
CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- * artist_details
-- date_of_birth
-- full_name
-- country
-- city nullable
-- is_married nullable
-- spouse_name nullable

CREATE TABLE IF NOT EXISTS artist_details (
	id SERIAL PRIMARY KEY,
	date_of_birth TIMESTAMPTZ NOT NULL,
	full_name VARCHAR(100) NOT NULL,
	country VARCHAR(100) NOT NULL,
	city VARCHAR(100) NULL,
	is_married BOOL NULL,
	spouse_name VARCHAR(100) NULL
);

-- * song
-- name
-- duration '3 minuts 20 seconds'
-- explicit default false

CREATE TABLE IF NOT EXISTS song (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
	explicit BOOL DEFAULT false NOT NULL
);

-- * playlist
-- title

CREATE TABLE IF NOT EXISTS playlist (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL
);

-- * genre
-- name

CREATE TABLE IF NOT EXISTS genre (
 	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL
);

-- * album
-- name
-- rating

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	rating FLOAT
);

SELECT * FROM album;
SELECT * FROM artist;
SELECT * FROM artist_details;
SELECT * FROM genre;
SELECT * FROM playlist;
SELECT * FROM song;

INSERT INTO album (name, rating) values
('Get Rich Or Die Trying', 3.4)

INSERT INTO artist_details (date_of_birth, full_name, country, city, is_married, spouse_name) VALUES
('2024-02-23', 'Marshal Matters', 'USA', 'Detroit', true, 'Kim')

INSERT INTO song (name, duration) VALUES
('The Real Slim Shady', '00:03:23')