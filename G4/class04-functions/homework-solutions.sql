--Show all details for artists born before 01-04-1992
select * from artist_details ad 
where ad.date_of_birth < '1992-01-04';
--Show all details for artists from Germany
select * from artist_details ad 
where ad.country = 'Germany';
--Show all songs longer than 4 minutes
select * from song s 
where s.duration > '4m';
--Show all explicit songs
select * from song s 
where s.explicit = true;
--Show all genres having ‘o’ in the name
select * from genre g 
where g.name like '%o%';
--Show all lyrics having the word ‘that’
select * from song_lyrics sl 
where sl.lyrics like '%that%';
--Show all details from artists that have ‘e’ in their full name, ordered by date of birth by the oldest one to the youngest one
select * from artist_details ad 
where ad.full_name like '%e%'
order by ad.date_of_birth asc;
--Show all non-explicit songs sorted by duration from shortest to longest
select * from song s 
where s.explicit = false
order by s.duration ;
--Show albums that have ‘u’ in their name sorted by rating, with worst rating on top
select * from album a
where a.name like '%u%'
order by rating;
--Show all album names and it’s rating
select a.name as album_name, a.rating as album_rating from album a; 
--Show all artists with their name and full name side by side
select a.name as artist_name, ad.full_name as artist_full_name from artist a 
join artist_details ad ON ad.artist_id = a.id;
--Show all songs with their lyrics side by side
select s.name, sl.lyrics  from song s
join song_lyrics sl on s.id = sl.song_id ;
--Show artist names with album names side by side
select a.name as artist_name, al.name as album_name from artist a 
join song s on a.id = s.artist_id 
join album al on al.id = s.album_id; 
--Show the artist names and their spouse name for all artists including ones that don’t have details
select a.name as artist_name, ad.spouse_name as artist_spouse from artist a
 left join artist_details ad on ad.artist_id = a.id;
--Show artist names and list of countries for all, including missing artist and missing details info
select a.name, ad.country from artist a 
full join artist_details ad on a.id = ad.artist_id;
--List all song names with genre names
select s."name", g.name  from songs_genres sg
join song s on sg.song_id = s.id
join genre g on sg.genre_id = g.id;
--List all song names with playlist names
select s.name , p.title from playlists_songs ps 
join song s on s.id = ps.song_id
join playlist p on p.id = ps.playlist_id;
--List all album names and rating that have rating above 4 with the artist name
select al.name  as album_name, al.rating as album_rating, a.name as artist_name from album al
join song s on al.id = s.album_id 
join artist a on a.id = s.artist_id 
where al.rating > 4;
--List all explicit song names and artist names without missing data
select s.name as song_name, a.name as artist_name from song s 
join artist a on s.artist_id  = a.id 
where s.explicit = true;
--Calculate the count of all songs in the system
select count(*) from song s;
--Calculate the count of all songs per artist in the system
select s.artist_id  as artist_id, count(*) as song_count from song s 
group by s.artist_id 
order by s.artist_id;
--Calculate the count of all songs per artist in the system for first 100 albums (ID < 100)
select s.artist_id  as artist_id, count(*) as song_count from song s 
where s.album_id  < 100
group by s.artist_id 
order by s.artist_id;
--Find the maximal duration and the average duration per song for each artist
select a.name as artist_name, max(s.duration) as max_duration, avg(s.duration) as avg_duration from artist a 
join song s on s.artist_id = a.id
group by a.name;
--Calculate the count of all songs per artist in the system and filter only song count greater than 10
select s.artist_id  as artist_id, count(*) as song_count from song s 
group by s.artist_id 
having count(*) > 10
order by s.artist_id;
--Calculate the count of all songs per artist in the system for first 100 albums (ID < 100) and filter artists with more than 10 song count
select s.artist_id  as artist_id, count(*) as song_count from song s 
where s.album_id  < 100
group by s.artist_id 
having count(*) > 10
order by s.artist_id;
--Find the song count, maximal duration, and the average duration per artist on all songs in the system. Filter only records where maximal duration is more than the average duration
select a.name, count(s.id), max(s.duration), avg(s.duration) from artist a
join song s on s.artist_id = a.id 
group by a.name
having max(s.id) > avg(s.id);


--Create a new view (vw_ArtistSongCounts) that will list all artist IDs and count of songs per artist
create view vw_ArtistSongCounts as 
select a.id, count(s.id) as song_count from artist a 
join song s on s.artist_id
group by a.id;
--Recreate the view to show artist names instead of artist ID
drop view vw_ArtistSongCounts;

create view vw_ArtistSongCounts as 
select a.name, count(s.id) as song_count from artist a 
join song s on s.artist_id = a.id
group by a.name;

--List all rows from the view ordered by the biggest song count
select * from vw_ArtistSongCounts
order by song_count desc;
--Create a new view (vw_ArtistAlbumDetails) that will list all artists (name) and count the albums they have
create view vw_ArtistAlbumDetails as 
select a.name, count(al.id) as album_count from artist a 
join song s on s.artist_id = a.id
join album al on s.album_id = al.id
group by a.name

select * from vw_ArtistAlbumDetails




