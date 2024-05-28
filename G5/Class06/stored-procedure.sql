CREATE OR REPLACE PROCEDURE add_artist_with_details(
prop_name VARCHAR,
prop_dob DATE,
prop_full_name VARCHAR,
prop_country VARCHAR,
prop_city VARCHAR,
prop_is_married BOOLEAN,
prop_spouse_name VARCHAR
)
AS $$
DECLARE variable_artist_id INT;
BEGIN
	
	-- INSERT INTO artist
	INSERT INTO artist(name) VALUES (prop_name) RETURNING id INTO variable_artist_id;
	
	-- INSERT INTO artist_details
	INSERT INTO artist_details (date_of_birth, full_name, country, city, is_married, spouse_name, artist_id) VALUES
	(prop_dob, prop_full_name,prop_country, prop_city, prop_is_married, prop_spouse_name, variable_artist_id);
	
	COMMIT;

END;
$$ LANGUAGE plpgsql;


CALL add_artist_with_details('Alica', '2000-01-01', 'Alica Keys', 'USA', 'New York', false, null);
