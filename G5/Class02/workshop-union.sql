-- Combine Song Names and Album Names into a Single List
SELECT * FROM song;
SELECT * FROM album;


SELECT name FROM song
UNION 
SELECT name FROM album;

-- List All Song Names and Album Names, Including Duplicates

SELECT name FROM song
UNION ALL
SELECT name FROM album;

-- Find Common Names Between Songs and Albums
SELECT name FROM song
INTERSECT
SELECT name from album;