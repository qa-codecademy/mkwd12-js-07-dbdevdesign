SELECT * FROM director;
SELECT * FROM movies;
SELECT * FROM genre;
SELECT * FROM movie_genre;


-- SELECT all movies with their genres

SELECT mo.title, g.name
FROM movies mo
INNER JOIN movie_genre mg ON mg.movie_id = mo.movie_id
INNER JOIN genre g ON g.genre_id = mg.genre_id;

-- CROSS JOIN EXAMPLE
SELECT mo.title, d.first_name, d.last_name
FROM movies mo
CROSS JOIN director d;

