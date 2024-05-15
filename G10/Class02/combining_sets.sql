-- 1. UNION The UNION operator combines the results of two or more SELECT queries, removing duplicates.
-- 1. Combine Song Names and Album Names into a Single List
-- Select song name
-- Will return 77 results
SELECT name FROM song
UNION
-- Select album name
SELECT name FROM album

-- 2. UNION ALL The UNION ALL operator combines the results of two or more SELECT queries, including duplicates
-- List All Song Names and Album Names, Including Duplicates
-- will return 80 results
SELECT name FROM song
UNION ALL
-- Select album name
SELECT name FROM album

-- 3. INTERSECT The INTERSECT operator returns the common rows between two SELECT queries.
-- Find Common Names Between Song and Album
SELECT name FROM song
INTERSECT
SELECT name FROM album

-- UNION
-- List all unique countries from artist_details and a list of unique cities from the same table
SELECT country AS location
FROM artist_details
UNION
SELECT city AS location
FROM artist_details

-- UNION ALL
-- List all countries and cities from artist_details, including duplicates.
SELECT country AS location
FROM artist_details
UNION ALL
SELECT city AS location
FROM artist_details

-- INTERSECT
-- List all countries that are also listed as cities in artist_details.
SELECT country AS location
FROM artist_details
INTERSECT
SELECT city AS location
FROM artist_details