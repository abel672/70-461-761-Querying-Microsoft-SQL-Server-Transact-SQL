USE [70-461]

SELECT * FROM tblDepartment
SELECT * FROM tblEmployee
SELECT * FROM tblTransactions


SELECT MIN(EmployeeNumber) as MinNumber, MAX(EmployeeNumber) as MaxNumber
FROM tblTransactions

SELECT MIN(EmployeeNumber) as MinNumber, MAX(EmployeeNumber) as MaxNumber
FROM tblEmployee


SELECT *
FROM tblTransactions as T 
JOIN tblEmployee as E 
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastName LIKE 'y%'
ORDER BY T.EmployeeNumber

-- Similar way: Sub query
SELECT *
FROM tblTransactions as T 
WHERE EmployeeNumber IN (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')