SELECT * FROM movies;

-- UPDATE TABLE BY ADDING A COLUMN
ALTER TABLE movies
ADD column genre varchar(50);

ALTER TABLE movies
ADD column director varchar(50);

-- UPDATE TABLE BY REMOVING A COLUMN
ALTER TABLE movies
DROP column director;