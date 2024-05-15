-- Default order is ASCENDING
SELECT * FROM artist
ORDER BY name DESC

-- 1. Find all genres sorted by name A-Z
SELECT * FROM genre
-- ASC is optional
ORDER BY name ASC

-- 2. Find all albums whose name starts with "A" sorted by rating
SELECT * FROM album
WHERE name LIKE 'A%'
ORDER BY rating DESC

-- 3. Find all songs ending on "O" sorted by duration
SELECT * FROM song
WHERE name ILIKE '%o'
ORDER by duration

-- 4. Find all married artists sorted by spouse name
SELECT * FROM artist_details
WHERE is_married = true
ORDER BY spouse_name

-- 5. Find all artists from 'USA' sorted by city name
SELECT * FROM artist_details
WHERE country = 'USA'
ORDER BY city
