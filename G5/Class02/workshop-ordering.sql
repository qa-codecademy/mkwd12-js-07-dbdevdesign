-- Find all genres sorted by name A-Z

-- Solution 1
SELECT name AS "genreName" FROM genre
ORDER BY name ASC;

-- Solution 2
SELECT name FROM genre
ORDER BY name ASC;


-- Find all albums who’s name starts with “A” sorted by rating
SELECT * FROM album;

-- Solution 1
SELECT * FROM album
WHERE name LIKE 'S%'
ORDER BY rating ASC;

-- Solution 2
SELECT * FROM album
WHERE name LIKE 'S%' AND rating IS NOT NULL
ORDER BY rating ASC;

-- Find all songs ending on “O” sorted by duration
SELECT * FROM song;

SELECT * FROM song
WHERE name LIKE '%o'
ORDER BY duration DESC;

-- Find all married artists sorted by spouse name
SELECT * FROM artist_details;

SELECT * FROM artist_details ad
WHERE ad.is_married = true
ORDER BY ad.spouse_name ASC;

-- Find all artists from ‘Macedonia’ sorted by city name
SELECT * FROM artist_details ad
WHERE ad.country = 'Macedonia'
ORDER BY ad.city ASC;
