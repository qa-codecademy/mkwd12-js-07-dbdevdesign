-- INSERT (CREATE) DATA

INSERT INTO movies (id, movie_name)
VALUES (1, 'Pirates of the Carabean');

INSERT INTO movies (id, movie_name)
VALUES (2, 'John Wick');

-- INSERTING MORE DATA 
INSERT INTO movies (id, movie_name)
VALUES 
(3, 'The Ring'), 
(4, 'Gladiator'), 
(5, 'Harry Potter');

-- READING DATA (* will select all columns)
SELECT * FROM movies;

SELECT movie_name FROM movies;

SELECT id FROM movies;

SELECT movie_name FROM movies
WHERE id BETWEEN 3 AND 5;

SELECT * FROM movies
WHERE id = 3;

-- MOTO_GP_RIDERS
SELECT * FROM moto_gp_riders;

-- When column name is camelCase add it in between "" (double quotes)
INSERT INTO moto_gp_riders ("riderName", team)
VALUES
('Valentino Rossi', 'Yamaha');

INSERT INTO moto_gp_riders ("riderName", team)
VALUES
('Pedro Acosta', 'Gas Gas'),
('Pecco Bagniana', 'Ducati'),
('Jorge Martin', 'Pramac Ducati');

-- When column name is camelCase add it in between "" (double quotes)
SELECT "riderName" FROM moto_gp_riders;

SELECT team, "riderName" FROM moto_gp_riders;

DELETE FROM moto_gp_riders; -- will delete all rows

-- DELETE BY column name (riderName)
DELETE FROM moto_gp_riders
WHERE "riderName" = 'Valentino Rossi';

-- DELETE BY ID
DELETE FROM moto_gp_riders
WHERE id = 6;

INSERT INTO moto_gp_riders ("riderName", team)
VALUES
('Rider 1', 'Gas Gas'),
('Rider 2', 'Ducati'),
('Rider 3', 'Ducati');

DELETE FROM moto_gp_riders
WHERE team = 'Ducati';

-- UPDATE

UPDATE moto_gp_riders
SET "riderName" = 'Pedro Acosta'
WHERE id = 9;