-- 1. Find all artists named 'Eminem'
select * from artist a 
where a.name = 'Eminem'

select * from artist a 

-- 2. Find all artists whose name starts with 'M'
select * from artist a
where a.name like 'M%'

-- 3. Find all artists from 'Canada'
select * from artist_details ad 
where ad.country = 'Canada'

-- 4. Find all married artists from 'USA'
select * from artist_details ad 
where ad.is_married = true and ad.country = 'USA'

-- 5. Find all artists with date of birth greater than '01.01.1980'
select * from artist_details ad 
where ad.date_of_birth > '1980-01-01'

-- 6. Find all explicit songs
select * from song s 
where s.explicit = true

-- 7. Find all lyrics containing the word “can”
select * from song_lyrics sl 
where lower(sl.lyrics) like '%can%'

-- 8. Find all albums having rating more than 4.5
select * from album a 
where a.rating > 3

-- 9. Find all artists married to a person who’s name starts with ‘K’
select * from artist_details ad 
where ad.is_married = true and ad.spouse_name like 'K%'

-- 10. Find all single artists from ‘Zagreb’
select * from artist_details ad 
where ad.city = 'London' and ad.is_married = false

-- 11. Find all artists that have spouses and are not married ?!
select * from artist_details ad 
where ad.is_married = false and ad.spouse_name is not null

-- Sorting

--Find all genres sorted by name A-Z
select * from genre g 
order by g.name ASC

--Find all albums who’s name starts with “A” sorted by rating
select * from album a 
where a.name like 'A%'
order by rating desc

--Find all songs ending on “o” sorted by duration
select * from song s 
where s.name like '%o'
order by s.duration

--Find all married artists sorted by spouse name
select spouse_name  from artist_details ad 
where ad.is_married = true
order by ad.spouse_name asc

--Find all artists from ‘Macedonia’ sorted by city name
select * from artist_details ad 
where ad.country = 'Macedonia'
order by ad.city;

update artist_details
set city = 'Krushevo'
where id = 3;

select * from artist_details ad 
where ad.full_name like 'Svetlana%'




--Union/Union All/Intersect

--Combine Song Names and Album Names into a Single List
select name from song 
union
select name from album;
--List All Song Names and Album Names, Including Duplicates
select name from song 
union all
select name from album;
--Find Common Names Between Songs and Albums
select name from song 
intersect
select name from album;


