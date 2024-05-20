-- Concat
SELECT CONCAT(a.name, ' - ', s.name) as artist_song_name
FROM artist a
JOIN song s ON s.artist_id = a.id

-- Upper
SELECT UPPER(name) as upper_name_of_album
FROM album

-- Lower
SELECT LOWER(name) as lower_name_of_album
FROM album

-- Left
SELECT LEFT(s.name, 5) as five_chars_song_name
FROM song s

-- Right
SELECT RIGHT(s.name, 4) as four_chars_song_name
FROM song s

-- Length
SELECT ad.full_name, LENGTH(ad.full_name) as name_length
FROM artist_details ad

-- Substring
SELECT SUBSTRING(s.name FROM 2 FOR 5) as cutted_name
FROM song s

-- Trim
SELECT TRIM(name) as trimmed_name
FROM song

-- Coalesce
SELECT full_name, COALESCE(spouse_name, 'Unknown') as spouse_name
FROM artist_details

-- Replace
SELECT full_name, REPLACE(country, 'USA', 'United States of America')
FROM artist_details