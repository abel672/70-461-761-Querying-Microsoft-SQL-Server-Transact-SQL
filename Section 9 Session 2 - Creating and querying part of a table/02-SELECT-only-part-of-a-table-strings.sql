-- Inserting multiple values
INSERT INTO tblEmployee
	VALUES (1, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations'),
(2, 'Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation');

SELECT * FROM tblEmployee
WHERE EmployeeLastName = 'Word';

-- filter data
SELECT * FROM tblEmployee
WHERE EmployeeLastName != 'Word';

-- whose last name comes before 'Word' in the alphabet
SELECT * FROM tblEmployee
WHERE EmployeeLastName < 'Word';

-- whose last name comes after 'Word' in the alphabet
SELECT * FROM tblEmployee
WHERE EmployeeLastName > 'Word';

-- everything that starts with 'W'
SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE 'W%';

-- everything that contains 'W'
SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE '%W%';

-- everything that has 'W' in the second position (Oward, Zwilling)
-- '_' means First character
SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE '_W%';


-- First character starts between r and t in the alphabet (r, s, t) ) (Ramon, Sandra, Teodoro)
SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE '[r-t]%';

-- Any character that is not 'rst'
SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE '[^rst]%';

-- % = 0-infinity characters
-- _ = 1 character
-- [A-G] = In the range A-G.
-- [AGQ] = A, G or Q.
-- [^AGQ] = NOT A, G or Q.

-- First character starts by % literally
SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE '[%]%';