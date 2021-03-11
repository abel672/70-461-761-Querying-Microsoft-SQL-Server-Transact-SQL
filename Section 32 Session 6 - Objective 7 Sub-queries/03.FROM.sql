USE [70-461]


SELECT *
FROM tblTransactions as T
LEFT JOIN (SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE 'y%') as E 
ON E.EmployeeNumber = T.EmployeeNumber
ORDER BY T.EmployeeNumber


SELECT *
FROM tblTransactions as T
LEFT JOIN tblEmployee as E 
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastName LIKE 'y%'
ORDER BY T.EmployeeNumber
