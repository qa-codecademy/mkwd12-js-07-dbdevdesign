-- Built-in functions
-- 1. Using CONCAT function to concatenate artist name and song name
SELECT CONCAT(a.name, ' - ', s.name) AS artist_song_name
FROM artist a
JOIN song s ON a.id = s.artist_id;

-- 2. Using UPPER function to convert genre names to uppercase
SELECT UPPER(name) AS uppercase_genre_name
FROM genre;


-- 3. Using LOWER function to convert album names to lowercase
SELECT LOWER(name) AS lowecase_album_name
FROM album;

-- 4. Using LEFT function to extract the first 10 characters of song names
SELECT LEFT(name, 10) 
FROM song;

-- 5. Using RIGHT function to extract the last 5 characters of artist names
SELECT RIGHT(name, 5)
FROM artist;

-- 6. Using LENGTH function to get the length of song names
SELECT name, LENGTH(name) AS name_length
FROM song;

-- 7. Using SUBSTRING function to extract a substring from song names
SELECT SUBSTRING(name FROM 1 FOR 5) AS substring_song_name
FROM song;

-- 8. Using TRIM function to remove leading and trailing spaces from artist names
SELECT TRIM(name) AS trimmed_names
FROM artist;

-- 9. Using COALESCE function to replace null values with 'Unknown' for artist spouse names
-- Does not work for NULL values
SELECT COALESCE(spouse_name, 'Unknown')AS spouse_name, full_name  
FROM artist_details;

-- 10. Using REPLACE function to replace 'e' with 'E' in song names
SELECT REPLACE (name, 'e', 'E')
FROM song;


