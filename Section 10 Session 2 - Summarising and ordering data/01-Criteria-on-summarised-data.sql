SELECT LEFT(EmployeeLastName, 1) as Initial, COUNT(*) as NumberInitial
FROM tblEmployee 
GROUP BY LEFT(EmployeeLastName, 1)
ORDER BY COUNT(*) DESC; -- Order by amount in descending order

-- get the TOP 5
SELECT TOP(5) LEFT(EmployeeLastName, 1) as Initial, COUNT(*) as NumberInitial
FROM tblEmployee
GROUP BY LEFT(EmployeeLastName, 1)
ORDER BY COUNT(*) DESC;

-- get those having 50 or more COUNT
SELECT LEFT(EmployeeLastName, 1) as Initial, COUNT(*) as NumberInitial
FROM tblEmployee
GROUP BY LEFT(EmployeeLastName, 1)
HAVING COUNT(*) >= 50 -- Having 50 or more
ORDER BY COUNT(*) DESC;

-- getting by date, and with min 20 coincidences
SELECT LEFT(EmployeeLastName, 1) as Initial, COUNT(*) as CountOfInitial
FROM tblEmployee
WHERE DateOfBirth > '19860101'
GROUP BY LEFT(EmployeeLastName, 1)
HAVING COUNT(*) >= 20 -- Having 20 or more
ORDER BY CountOfInitial DESC; -- ORDER BY goes after select, so we can use the 'as' variables from it