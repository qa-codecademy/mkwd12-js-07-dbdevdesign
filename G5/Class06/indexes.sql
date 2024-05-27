-- Adding index for the name column of the table artist
CREATE INDEX idx_arist_name ON artist(name);


SELECT * FROM artist
WHERE name = 'Eminem';

-- Example 2
SELECT * FROM artist_details;

CREATE INDEX idx_artist_country_city ON artist_details(country, city);

SELECT * FROM artist_details
WHERE country = 'France' AND city = 'Paris';