-- create or replace procedure add_artist_with_details (
-- 	p_name varchar,
-- 	p_date_of_birth date,
-- 	p_full_name varchar,
-- 	p_country varchar,
-- 	p_city varchar, 
-- 	p_is_married boolean,
-- 	p_spouse_name varchar
-- )
-- as 
-- $$
-- declare 
-- 	v_artist_id int;
-- begin
-- 	insert into artist (name) values (p_name) returning id into v_artist_id;
	
-- 	insert into artist_details (
-- 		date_of_birth,
--         full_name,
--         country,
--         city,
--         is_married,
--         spouse_name,
--         artist_id
-- 	) values (
-- 		p_date_of_birth,
-- 		p_full_name,
-- 		p_country,
-- 		p_city, 
-- 		p_is_married,
-- 		p_spouse_name,
-- 		v_artist_id
-- 	);
	
-- 	commit;
-- end;
-- $$ language plpgsql;

-- call add_artist_with_details('Risto','1954-10-10', 'Risto Blazhov', 'Negotino', 'Negotino', true, 'Blagjica');

create or replace procedure create_playlist_with_songs(
	p_playlist_title varchar,
	p_song_ids int[]
) as
$$
declare 
	v_playlist_id int;
	song_id int;
begin 
	insert into playlist (title) values (p_playlist_title) returning id into v_playlist_id;
	
	foreach song_id in array p_song_ids
	loop
		insert into playlists_songs (playlist_id, song_id) values (v_playlist_id, song_id);
	end loop;
	
exception
	when others then
		rollback;
		raise;
end;
$$ language plpgsql;

call create_playlist_with_songs('Procedure Playlist One', ARRAY[1,2,3,4,123123312]);

select * from playlist p


-- join playlists_songs ps on p.id = ps.playlist_id
-- where p.title = 'Procedure Playlist One'










