-- begin;

-- insert into playlist (title) values ('Playlist Two');

-- insert into playlists_songs (playlist_id, song_id)
-- values
-- 	((select id from playlist where title = 'Playlist Two'), 1),
-- 	((select id from playlist where title = 'Playlist Two'), 3),
-- 	((select id from playlist where title = 'Playlist Two'), 5);
	 
-- commit;

-- select * from playlist

begin;

insert into artist (name) values ('Blazho');

insert into album (name, rating) 
values ('Negotinska Elegija', 5);

insert into song (name, duration, explicit, artist_id, album_id)
values
	('Jano Mori', '5m', false, (select id from artist a where a.name = 'Blazho'), (select id from album a where a.name = 'Negotinska Elegija'));

commit;

select * from artist a

select * from album a 

select * from song s 
order by id desc

