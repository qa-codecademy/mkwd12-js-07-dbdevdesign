-- 1. Find all artists named 'Eminem'
SELECT * FROM artist
WHERE name = 'Eminem';

-- 2. Find all artists whose name starts with 'M'
SELECT * FROM artist
WHERE name LIKE 'M%'

-- 2.1 Find all artists whose name ends with 's' it is case sensitive!!
SELECT * FROM artist
WHERE name LIKE '%s'

-- 3. Find all artist details from 'Canada'
SELECT * FROM artist_details
WHERE country = 'Canada'

-- 3.1. Find all artist full names and countries from 'Canada'
SELECT full_name, country FROM artist_details
WHERE country = 'Canada'

-- 4. Find all married artists from 'Serbia'
SELECT * FROM artist_details
WHERE is_married = true AND country = 'Serbia'

-- 5. Find all artists with date of birth greater than '01.01.1980'
SELECT * FROM artist_details
WHERE date_of_birth > '01.01.1980'

-- 5.1 Find all artists with date of birth greater than '01.01.1980' from USA
SELECT * FROM artist_details
WHERE date_of_birth > '01.01.1980' AND country = 'USA'

-- 6. Find all explicit songs
SELECT * FROM song
WHERE explicit = true

-- 7. Find all lyrics containing the word "can"
SELECT * FROM song_lyrics
WHERE LOWER(lyrics) LIKE '%can%'
-- ILIKE makes the querying case insensitive
SELECT * FROM song_lyrics
WHERE lyrics ILIKE '%CAN%'

-- 8. Find all albums having rating more than 4.5
SELECT * FROM album
WHERE rating > 4.5

-- 9. Find all artists married to a person whose name starts with 'K'
SELECT * FROM artist_details
WHERE spouse_name LIKE 'A%'

-- 10. Find all single artists from 'London'
SELECT full_name, city, is_married FROM artist_details
WHERE is_married = false AND city = 'London'

-- 11 Find all artist details from USA or England
SELECT * FROM artist_details
WHERE country IN('USA', 'England')

-- 12 Select full_name and country from artist_details from Serbia, Macedonia and Bosnia and Herzegovina
SELECT full_name, country FROM artist_details
WHERE country IN('Macedonia', 'Serbia', 'Bosnia and Herzegovina')
