-- Creating a new table
CREATE TABLE IF NOT EXISTS employee (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	age INTEGER NULL
)

-- Update the table with a new column
ALTER TABLE employee
ADD COLUMN city VARCHAR(100)

-- Update the table with a new column (If records exist, it will fail,
-- as they don't have the specified NOT NULL value)
ALTER TABLE employee
ADD COLUMN is_retired BOOL DEFAULT false NOT NULL

-- Renaming a table column
ALTER TABLE employee
RENAME COLUMN is_retired TO retired

-- Deleting a table column
ALTER TABLE employee
DROP COLUMN city

-- Adding a single record
INSERT INTO employee (name, age)
VALUES ('Ivan', 26)

-- Adding multiple records
INSERT INTO employee (name, age, retired) VALUES
('Nikola', 26, true),
('Petar', null, false),
('Nenad', 23, true),
('Filip', null, true);

-- Select all employees
SELECT * FROM employee

-- Select all employees' id and name
SELECT id, name FROM employee

-- Update data
UPDATE employee
SET name = 'Pavle'

-- Updating a record that doesn't exist doesn't fail
UPDATE employee
SET age = 40
WHERE id = 313212

-- Deleting a record from the table
DELETE
FROM employee
WHERE id = 1