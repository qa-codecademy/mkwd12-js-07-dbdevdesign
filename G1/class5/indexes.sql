SELECT * FROM song
where name = 'Without Me'
-- 115

CREATE INDEX idx_artist_name ON artist(name)
CREATE INDEX idx_song_name ON song(name)

CREATE INDEX idx_playlists_songs ON playlists_songs(playlist_id, song_id)