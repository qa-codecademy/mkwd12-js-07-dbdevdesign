--Creating a table
CREATE TABLE customers
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	age INTEGER NOT NULL
);
--Deleting a table
DROP TABLE customers;
--Inserting (Adding) into a table
INSERT INTO customers (name,city,age)
VALUES 
('Marko', 'Berlin', 4),
('Jane', 'London', 55),
('Bob', 'Stockholm', 32);


--Selecting data from a table
SELECT name AS customer_name, city AS customer_city, age AS customer_age FROM customers
WHERE age >= 32 OR age <= 60;

SELECT * FROM customers
ORDER BY id 
LIMIT 10
OFFSET 30

--Updatating data in a table
UPDATE customers 
SET age = 60
WHERE id = 3

--Deleting records from a table
DELETE  FROM customers
WHERE id = 4;


