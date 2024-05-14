--Creating a music database

--1. Song
CREATE TABLE song (
	id SERIAL PRIMARY KEY,
	name varchar(100) NOT NULL,
	duration INTERVAL NOT NULL,
	explicit BOOLEAN DEFAULT FALSE NOT NULL
);

INSERT INTO song (name, duration, explicit)
VALUES ('My Humps', '4m 20s', true);

SELECT * FROM song;
--2 Song lyrics
CREATE TABLE song_lyrics (
	id SERIAL PRIMARY KEY,
	lyrics TEXT NOT NULL 
);

INSERT  INTO song_lyrics (lyrics)
VALUES ('Hey Jude, don''t be a fool')

SELECT * FROM song_lyrics sl; 
--3 Artist
CREATE TABLE artist (
	id SERIAL PRIMARY KEY,
	name varchar(100) NOT NULL
);

SELECT * FROM artist a ;

INSERT INTO artist (name)
VALUES ('The Beatles');
--4 Artist details
CREATE TABLE artist_details (
	id SERIAL PRIMARY KEY,
	date_of_birth DATE NOT NULL, 
	full_name varchar(100),
	country varchar(100),
	city varchar(100),
	is_married boolean DEFAULT FALSE NOT NULL,
	spouse_name varchar(100)
);

SELECT * FROM artist_details ad 

INSERT INTO artist_details (date_of_birth, full_name, country, city, is_married, spouse_name)
VALUES ('1960-10-10', 'John Lenon', 'England', 'Liverpool', TRUE, 'Joko Ono');

UPDATE artist_details 
SET spouse_name = 'Yoko Ono', full_name = 'John Lennon'
WHERE full_name = 'John Lenon';
--5 Album
CREATE TABLE album (
	id SERIAL PRIMARY KEY, 
	name varchar(100) NOT NULL,
	tracks_count INTEGER NOT NULL,
	rating DECIMAL 
);

SELECT * FROM album a 

INSERT INTO album (name, tracks_count,rating)
VALUES ('Yellow Submarine', 8, 9.8);
--6 Genre
CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
	name varchar(100) NOT NULL
);
--7 Playlist
CREATE TABLE playlist (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100)
);

