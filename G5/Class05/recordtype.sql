-- RECORD TYPE
-- CREATE FUNCTION THAT SELECT fullname, country and city from artist_details as RECORD
SELECT * FROM artist_details;

CREATE OR REPLACE FUNCTION get_artist_details_by_id(artist_details_id INT)
RETURNS RECORD 
AS $$
DECLARE
	my_rec RECORD;
	
	BEGIN
		SELECT ad.full_name, ad.country, ad.city INTO my_rec
		FROM artist_details ad
		WHERE ad.artist_id = artist_details_id;
		
		RETURN my_rec;
	END;
	

$$ LANGUAGE plpgsql;

SELECT get_artist_details_by_id(1);

SELECT (my_rec).full_name, (my_rec).country, (my_rec).city
FROM get_artist_details_by_id(1) AS my_rec(full_name VARCHAR, country VARCHAR, city VARCHAR);
