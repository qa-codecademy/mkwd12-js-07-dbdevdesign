select * from song s;

alter table song 
add column rating decimal(2,1) check(rating >= 1 and rating <= 5);

create or replace function add_random_rating_songs() 
returns void as
$$
begin
	update song
	set rating = floor(random() * 5 + 1);
end;
$$ language plpgsql;

select add_random_rating_songs()

select * from album a 

create or replace function update_album_rating()
returns trigger as
$$
begin 
	update album a
	set rating = (
		select avg(s.rating) from song s
		where s.album_id = new.album_id
	)
	where a.id = new.album_id;
	return new;
end;
$$ language plpgsql;

create trigger album_rating_update
after insert or update on song
for each row 
execute function update_album_rating();

insert into song ("name",duration, explicit, artist_id, album_id, rating)
values('Song One', '4m', true, 1, 1, 5);

select * from song s
where album_id = 1
;

select * from album a 
where a.id = 1;

--Trgger 2 , audit song operations in new table

CREATE TABLE IF NOT EXISTS song_audit (
	id SERIAL PRIMARY KEY,
	action VARCHAR(10) NOT NULL,
	song_id INT, -- not adding reference to keep deleted songs
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
    explicit BOOLEAN NOT NULL
);

select * from song_audit sa 

create or replace function log_song_changes() 
returns trigger as 
$$
begin
	if tg_op = 'INSERT' then 
		insert into song_audit (action, song_id, name, duration, explicit)
		values ('INSERT', new.id, new.name, new.duration, new.explicit);
	elsif tg_op = 'UPDATE' then
		insert into song_audit (action, song_id, name, duration, explicit)
		values ('UPDATE', new.id, new.name, new.duration, new.explicit);
	elsif tg_op = 'DELETE' then
		insert into song_audit (action, song_id, name, duration, explicit)
		values ('DELETE', old.id, old.name, old.duration, old.explicit);
	end if;
		
	return new;
end;
$$ language plpgsql;

create trigger song_changes_trigger
after insert or update or delete on song
for each row 
execute function log_song_changes()

insert into song (name, duration, explicit, artist_id,album_id,rating)
values('Good Song', '5m 30s', false, 1,2,5)

UPDATE song
SET name = 'Updated song name'
WHERE id = 395

delete from song where id = 395;


