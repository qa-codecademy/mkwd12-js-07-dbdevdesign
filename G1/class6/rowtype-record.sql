-- Example using %ROWTYPE:
-- This example demonstrates how to use %ROWTYPE to fetch and display details of an album.

-- ROW TYPE

-- %ROWTYPE is used to declare a variable that can hold a row of data from a specified table or view. The variable will have the same structure as the row from the table or view, including all columns.
-- %ROWTYPE is particularly useful when you want to work with entire rows of a table without needing to declare each column individually.
-- It's commonly used in PL/pgSQL functions and anonymous code blocks to fetch and manipulate rows of data.

DO $$
DECLARE
    album_record album%ROWTYPE;
BEGIN
    -- Fetching the album details into the row variable
    SELECT *
    INTO album_record
    FROM album
    WHERE id = 1;

    -- Accessing individual fields of the row variable
    RAISE NOTICE 'Album Name: %, Rating: %', album_record.name, album_record.rating;
END;
$$;

-- Example using RECORD:
-- This example demonstrates how to use RECORD to fetch and display details of a song along with its genre.

-- RECORD TYPE

-- RECORD is a more flexible and generic data type in PL/pgSQL that can hold a row of data with a structure determined at runtime. Unlike %ROWTYPE, RECORD is not tied to a specific table or view and can be used to hold rows from different queries with varying structures.
-- RECORD is useful when you need to handle rows from dynamic queries or when the structure of the row is not known until runtime.
-- It allows you to work with any result set without needing to define the exact structure in advance.

DO $$
DECLARE
    song_genre_record RECORD;
BEGIN
    -- Fetching song and genre details into the record variable
    SELECT s.id AS song_id, s.name AS song_name, g.name AS genre_name
    INTO song_genre_record
    FROM song s
    JOIN songs_genres sg ON s.id = sg.song_id
    JOIN genre g ON sg.genre_id = g.id
    WHERE s.id = 4;

    -- Accessing individual fields of the record variable
    RAISE NOTICE 'Song ID: %, Song Name: %, Genre Name: %', song_genre_record.song_id, song_genre_record.song_name, song_genre_record.genre_name;
END;
$$;
