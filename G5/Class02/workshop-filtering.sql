SELECT * FROM artist;

-- Find all artists named = ‘Adele’
SELECT name FROM artist
WHERE name = 'Adele';

-- Find all artists who’s name starts with ’A’
SELECT name FROM artist
WHERE name LIKE 'A%';

-- Find all artists from ‘Canada’
SELECT * FROM artist_details;

SELECT ad.full_name FROM artist_details ad
WHERE ad.country = 'Canada';

-- Find all married artists from ‘United States'
SELECT * FROM artist_details a_d
WHERE a_d.country = 'United States' AND a_d.is_married = true;

-- Find all artists with date of birth greater than ‘01.01.1980’
SELECT * FROM artist_details a_d
WHERE a_d.date_of_birth > '1980.01.01'

-- Find all explicit songs
SELECT * FROM song;

SELECT * FROM song
WHERE explicit = true;

-- Find all lyrics containing the word “og”
SELECT * FROM song_lyrics;

SELECT * FROM song_lyrics
WHERE lyrics LIKE '%og%';

-- Find all albums having rating more than 3
SELECT * FROM album;

SELECT * FROM album 
WHERE rating > 3;

-- Find all artists married to a person who’s name starts with ‘C’
SELECT * FROM artist_details a_d
WHERE a_d.is_married = true AND a_d.spouse_name LIKE 'C%';

-- Find all single artists from ‘Zagreb’
SELECT * FROM artist_details a_d
WHERE a_d.is_married = false AND a_d.city = 'Skopje'