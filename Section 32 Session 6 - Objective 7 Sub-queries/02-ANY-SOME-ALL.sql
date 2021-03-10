USE [70-461]

SELECT * 
FROM tblTransactions as T 
WHERE EmployeeNumber = ANY -- same as IN
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber

SELECT * 
FROM tblTransactions as T 
WHERE EmployeeNumber = SOME -- same as IN
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber

SELECT * 
FROM tblTransactions as T 
WHERE EmployeeNumber <> ALL
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber

-- any/some = OR
-- all = AND