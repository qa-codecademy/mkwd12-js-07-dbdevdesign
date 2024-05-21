-- Select everything and run the script
DROP TABLE IF EXISTS artist_details, song_lyrics, playlists_songs, songs_genres, song, playlist, genre, artist, album;

-- Artist table
CREATE TABLE artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Artist Details table (One-to-One relationship with artist)
CREATE TABLE artist_details (
    id SERIAL PRIMARY KEY,
    date_of_birth DATE NOT NULL,
    full_name VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    is_married BOOLEAN DEFAULT false NOT NULL,
    spouse_name VARCHAR(100),
    artist_id INT UNIQUE REFERENCES artist(id)
);

-- Album table
CREATE TABLE album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    rating DECIMAL CHECK(rating >= 0 AND rating <= 5)
);

-- Song table
CREATE TABLE song (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INTERVAL NOT NULL,
    explicit BOOLEAN DEFAULT false NOT NULL,
    artist_id INT REFERENCES artist(id),
    album_id INT REFERENCES album(id)
);

-- Song Lyrics table (One-to-One relationship with songs)
CREATE TABLE song_lyrics (
    id SERIAL PRIMARY KEY,
    lyrics TEXT NOT NULL,
    song_id INT UNIQUE REFERENCES song(id)
);

-- Playlist table
CREATE TABLE playlist (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100)
);

-- Playlist_Songs table (Many-to-Many relationship between playlists and songs)
CREATE TABLE playlists_songs (
    playlist_id INT REFERENCES playlist(id),
    song_id INT REFERENCES song(id),
    PRIMARY KEY (playlist_id, song_id)
);

-- Genre table
CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Songs_Genres table (Many-to-Many relationship between songs and genres)
CREATE TABLE songs_genres (
    song_id INT REFERENCES song(id),
    genre_id INT REFERENCES genre(id),
    PRIMARY KEY (song_id, genre_id)
);