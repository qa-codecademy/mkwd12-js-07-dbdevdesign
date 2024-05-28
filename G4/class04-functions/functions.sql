--Concatenate artist name and song name
select concat(a.name, ' - ', s.name) as artist_song_name  from song s 
join artist a on s.artist_id = a.id 
;
--Convert all genre names to uppercase
select upper(g.name) from genre g;
--Convert album names to lowercase
select lower(a.name) from album a;
--Extract the first 10 characters of song names
select left(s.name, 10) from song s;
--Extract the last 5 characters of artist names
select right(a.name, 5) from artist a;
--Get the length of song names
select s.name,  char_length(s.name) as song_name_length from song s; 
--Extract a substring from song names
select s.name, substring(s.name from 3 for 4) from song s;
--Remove leading and trailing spaces from artist names
select trim(a.name) as trimmed_artist_name from artist a;
--Replace null values with 'Unknown' for artist spouse names
select coalesce(ad.spouse_name, 'Unknown') as spouse_name, ad.full_name from artist_details ad;
--Replace 'e' with 'E' in song names
select replace(s.name, 'e', 'E') as replaced_song_name from song s;

do $$ 
declare
   first_name varchar(50) := 'Risto';
   last_name  varchar(50) := 'Blazhovski';
   payment    numeric(11,2) := 20.5;
begin 
   raise notice '% % has been paid % USD', 
	   first_name, 
	   last_name, 
	   payment;
end $$;

--Declare function (get_average_song_duration) for retrieving the average duration of all existing songs
create or replace function get_average_song_duration()
returns interval as
$$
declare avg_duration interval;
begin
	select avg(s.duration) into avg_duration
	from song s;
	
	return avg_duration;
end;
$$ language plpgsql;

select get_average_song_duration() as avg_duration

--Declare a function get_artist_song_count that is going to retrieve the number of songs that the artists has
create or replace function get_artist_song_count (artist_name varchar)
returns integer as 
$$
declare
	var_artist_id integer;
	song_count integer;
begin
	--Get the artist id based on the supplied name
	select id into var_artist_id from artist a
	where a.name = artist_name;

	select count(*) into song_count from song s
	where s.artist_id = var_artist_id;
	
	return song_count;
end;
$$ language plpgsql;

select get_artist_song_count('Eminem');
select get_artist_song_count('50 Cent');

--Declare a function “get_artist_songs” that is going to provide a table as a return value, with information about song name, song duration and about being explicit or not, based on provided artist name
create or replace function get_artist_songs(artist_name varchar, is_explicit boolean)
returns table (
	song_name varchar,
	duration interval,
	explicit boolean
) as
$$
begin
	return query
	select s.name, s.duration, s.explicit
	from song s
	join artist a on s.artist_id = a.id
	where a.name = artist_name and s.explicit = is_explicit;
end;
$$ language plpgsql;

select * from get_artist_songs('Eminem')





