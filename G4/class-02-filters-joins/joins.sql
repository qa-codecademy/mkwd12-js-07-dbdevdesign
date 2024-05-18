--select * from artist a;
--
--select * from artist_details ad;

insert into artist (id,name) 
values (51,'Nikola Badev');

select * from artist a 
full join artist_details ad 
on a.id = ad.artist_id;

--List all artists and the song names
select a.name as artist_name , s.name as song_name from artist a 
join song s
on a.id = s.artist_id;

--List all artists that are married with their spouse name
select a.name as artist_name, ad.spouse_name as spouse_name
from artist a 
join artist_details ad ON a.id = ad.artist_id 
where ad.is_married = true

--List all combinations of song names and genre names
select song.name as song_name, genre.name as genre_name
from song
cross join genre
--List all albums with rating and artist name

--List song name and duration, album name and rating, artist name
select 
	s.name as song_name, 
	s.duration as song_duration, 
	al.name as album_name, 
	al.rating as album_rating,
	a.name as artist_name from song s
join album al
on s.album_id = al.id
join artist a 
on s.artist_id = a.id;

