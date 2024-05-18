--All songs must be saved with positive duration
alter table song
add constraint check_duration_positive check(duration >= interval '0 seconds');
--All albums must be saved with positive rating
alter table album 
add constraint check_rating_positive check(rating > 0);
--Ensure title of each playlist is unique
alter table playlist 
add constraint unique_playlist_title unique (title);

--Adding a column to a table
alter table artist
add column stage_name varchar(100);


alter table song
rename column explicit to is_explicit;

--Deleting all data from a table
truncate table song;

--adding a foreign key column and constraint to a table (manual relation)
alter table album 
add column artist_id integer;

alter table album
add constraint fK_album_artist
foreign key (artist_id)
references artist(id)
on delete cascade;
