SELECT * FROM artist;
SELECT * FROM album; 
INSERT INTO artist (id, name) VALUES
(46, 'Tonyo San');


BEGIN;

INSERT INTO album(id, name, rating)
VALUES(55, 'Some Album Name Tonyo San', 4);

INSERT INTO song(id, name, duration, explicit, artist_id, album_id, rating) VALUES
(3001, 'Tonyo San song 1', '2 minutes', false, 46, 55, 5.0),
(3002, 'Tonyo San song 2', '3 minutes', true, 46, 55, 4.5);

-- ROLLBACK; -- WILL DO UNDO IF ERROR HAPPENS
COMMIT; -- WILL SAVE THE TRANSACTION

SELECT * FROM song WHERE artist_id = 46;
