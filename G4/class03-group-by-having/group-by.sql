--!JOINS RECAP

select * from artist a 

select * from artist_details ad 

--Inner join
select * from artist a 
join artist_details ad on a.id = ad.artist_id 

--Left join
select * from artist a 
left join artist_details ad on a.id = ad.artist_id 

--Right join
select * from artist a 
right join artist_details ad on a.id = ad.artist_id 

--Inner join
select * from artist a 
full join artist_details ad on a.id = ad.artist_id 

--List all songs with their corresponding albums.
select s.name as song_name, a.name as album_name from album a
right join song s on a.id = s.album_id;

--List all playlists with their songs.
select * from playlist p 
 join playlists_songs ps on p.id = ps.playlist_id 
 join song s on s.id = ps.song_id 
 
 
--!GROUPING ROWS IN SQL
 
 select count(*) from artist a 
 
 select avg(s.duration) as avg_duration, 
 		max(s.duration) as max_duration, 
 		min(s.duration) as min_duration,
 		sum(s.duration) as total_duration,
 		string_agg(s.name, ', ') as crazy_name_string from song s
 
select count(*) as sum from artist_details ad 
where ad.is_married = true
 
select * from artist_details ad 

--Count the number of songs in each album

select * from album a
join song s on s.album_id = a.id
where a.name ='Lemonade'

select a.name, count(s.id) as song_count, sum(s.duration) as album_duration from album a
join song s on s.album_id = a.id
group by a.name

--Find the minimum duration of songs in each playlist
select p.title as playlist_title, min(s.duration) as min_duration from playlist p 
join playlists_songs ps on p.id = ps.playlist_id 
join song s on s.id = ps.song_id 
group by p.title

--Calculate the total duration of songs in each playlist
select p.title as playlist_title, sum(s.duration) as total_duration from playlist p 
join playlists_songs ps on p.id = ps.playlist_id 
join song s on s.id = ps.song_id 
group by p.title

--Count the number of songs in each album
select a.id as id, a.name, count(s.id) from album a 
join song s on a.id = s.album_id 
group by (a.id,a.name)
order by a.id

--Find the average duration of songs for each artist
select a.name, avg(s.duration) as avg_duration from artist a 
join song s on s.artist_id = a.id
group by a.name
order by a.name

--Find the total number of songs in each album
select a.name, count(s.id) from album a 
join song s on a.id = s.album_id 
group by a.name

--Count the number of explicit songs for each artist
select a.name, count(s.id) as explicit_song_count  from artist a 
left join song s on a.id = s.artist_id 
where s.explicit = true
group by a.name
order by count(s.id) desc


--Find the number of songs in each genre
select g.name as genre_name, count(sg.song_id) from songs_genres sg 
join genre g on sg.genre_id = g.id 
join song s on sg.song_id = s.id
group by g.name

--Find the total number of songs in each playlist
select p.title, count(ps.song_id) as total_songs from playlists_songs ps 
join playlist p on ps.playlist_id = p.id 
join song s on ps.song_id  = s.id
group by p.title 


--Find the sum of all song durations for each artist
select a.name as artist_name, sum(s.duration) as total_duration from artist a 
join song s on a.id = s.artist_id 
group by a.name
order by total_duration

--Count the number of artists in each country
select ad.country, count(*) as artist_count from artist_details ad 
group by ad.country 
order by artist_count desc

--Find the minimum duration of songs for each artist
select a.name, min(s.duration) as min_duration from artist a 
join song s on s.artist_id = a.id
group by a.name
order by a.name

--Find the average duration of songs in each genre
select g.name, avg(s.duration) as avg_duration from songs_genres sg 
join genre g on sg.genre_id = g.id 
join song s on sg.song_id  = s.id
group by g.name

--Find the total number of songs in each genre, including genres with no songs
select g.name, count(sg.song_id) as total_songs from songs_genres sg 
right join genre g on g.id = sg.genre_id 
group by g.name
order by total_songs

--Find the minimum and maximum duration of songs in each genre
select g.name, min(s.duration) as min_duration, max(s.duration) as max_duration from songs_genres sg 
join genre g on sg.genre_id = g.id 
join song s on sg.song_id  = s.id
group by g.name

--Find the total number of songs in each genre with at least 5 songs
select g.name as genre_name, count(sg.song_id) as song_count from genre g
join songs_genres sg ON g.id = sg.genre_id 
group by g.name
having count(sg.song_id) >= 5 

--Find all playlists containing at least 10 songs
select p.title, count(ps.song_id) from playlist p 
join playlists_songs ps on p.id = ps.playlist_id 
group by p.title
having count(ps.song_id) >= 3;
--Calculate the average duration of songs in each playlist and exclude playlists with less than 5 songs
select p.title, avg(s.duration) as avg_duration from playlist p 
join playlists_songs ps on p.id = ps.playlist_id 
join song s on s.id = ps.song_id 
group by p.title
having count(ps.song_id) > 3;

--Find the number of songs in each album and calculate the total duration for albums with more than 10 songs
select a.name, sum(s.duration) as total_duration from album a 
join song s on s.album_id = a.id
group by a.name
having count(s.id) > 10;
--Count the number of songs in each genre and display genres with more than 8 songs, sorted by the number of songs in descending order
select g.name, count(sg.song_id) from genre g
join songs_genres sg on g.id = sg.genre_id
group by g."name" 
having count(sg.song_id) > 8

--Find the average duration of songs in each playlist and include only playlists with a minimum duration of 10 minutes
select p.title, avg(s.duration) as avg_duration, sum(s.duration) as total_duration from playlist p 
join playlists_songs ps on ps.playlist_id = p.id
join song s on ps.song_id = s.id
group by p.title 
having sum(s.duration) > '14m'

--Find the total number of songs in each album and display albums with more than 20 songs
select a.name from album a 
join song s on a.id = s.album_id 
group by a.name
having count(s.id) > 20


--Find the number of songs in each genre and calculate the total duration for genres with more than 100 songs
select g.name, count(sg.song_id), sum(s.duration) as total_duration from genre g
join songs_genres sg on g.id = sg.genre_id
join song s on sg.song_id  = s.id
group by g."name" 
having count(sg.song_id) > 5


--Count the number of songs in each playlist and display playlists with more than 15 songs, sorted by the number of songs in descending order
select p.title, count(ps.song_id) as song_count from playlist p 
join playlists_songs ps on ps.playlist_id = p.id
join song s on ps.song_id = s.id
group by p.title 
having count(ps.song_id) > 3
order by count(ps.song_id) desc




--!VIEWS

-- Example 1: Create a view to display the total duration of songs in each playlist
create view playlist_duration as
select p.title as playlist_title, sum(s.duration) as total_duration from playlist p 
join playlists_songs ps on p.id = ps.playlist_id 
join song s on s.id = ps.song_id 
group by p.title


select * from playlist_duration pd 

-- Example 2: Create a view to display the number of songs in each genre
create view genre_song_count as 
select g.name as genre_name, count(sg.song_id) as song_count
from genre g
left join songs_genres sg on g.id = sg.genre_id
group by g.name

select * from genre_song_count gsc 

