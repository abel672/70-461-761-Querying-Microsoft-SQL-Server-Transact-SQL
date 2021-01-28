-- YEAR 1976 and 1986
SELECT * FROM tblEmployee
WHERE DateOfBirth BETWEEN '19760101' AND '19861231';

-- between one year and next year
SELECT * FROM tblEmployee
WHERE DateOfBirth BETWEEN '19760101' AND '19870101';

SELECT * FROM tblEmployee
WHERE YEAR(DateOfBirth) BETWEEN 1976 AND 1986; -- DO NOT USE

-- YEAR of date of birth of every employee
-- COUNT() and GROUP BY 
SELECT YEAR(DateOfBirth) as YearOfDateOfBirth, COUNT(*) as NumberBorn
FROM tblEmployee
GROUP BY YEAR(DateOfBirth); -- you need this to use COUNT()

-- Checking one year amount
SELECT * FROM tblEmployee
WHERE YEAR(DateOfBirth) = 1967;

SELECT YEAR(DateOfBirth) as YearOfDateOfBirth, COUNT(*) as NumberBorn
FROM tblEmployee -- Query execution starts always from here, SELECT is the last line to be run
WHERE 1=1
GROUP BY YEAR(DateOfBirth);
-- non-deterministic (not always same results, in same order)

-- ORDER BY
SELECT YEAR(DateOfBirth) as YearOfDateOfBirth, COUNT(*) as NumberBorn
FROM tblEmployee
WHERE 1=1
GROUP BY YEAR(DateOfBirth)
ORDER BY YEAR(DateOfBirth);

-- ORDER BY DESC
SELECT YEAR(DateOfBirth) as YearOfDateOfBirth, COUNT(*) as NumberBorn
FROM tblEmployee
WHERE 1=1
GROUP BY YEAR(DateOfBirth)
ORDER BY YEAR(DateOfBirth) DESC;