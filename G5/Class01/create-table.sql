-- CREATE MOVIES TABLE
CREATE TABLE movies (
	id INTEGER NOT NULL,
	movie_name VARCHAR(100) NOT NULL
);

-- Safer CREATE (Will create table if it is not existing)
-- It won't thow error =)
CREATE TABLE IF NOT EXISTS movies (
	id INTEGER NOT NULL,
	movie_name VARCHAR(100) NOT NULL
);

-- REMOVE MOVIES TABLE
DROP TABLE  movies;
-- Safer DROP (Delete if table exists)
DROP TABLE IF EXISTS movies;

-- CREATE MOTOGP TABLE
-- MOTO GP TABLE
CREATE TABLE moto_gp_riders
(
    id serial PRIMARY KEY NOT NULL,
    "riderName" character varying(100) NOT NULL,
    team character varying(100) NOT NULL
);


-- REMOVE MOTO GP TABLE
DROP TABLE moto_gp_riders;
