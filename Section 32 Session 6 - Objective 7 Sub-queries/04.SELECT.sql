USE [70-461]

-- common way
SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, COUNT(T.EmployeeNumber) as NumberOfTransactions
FROM tblTransactions as T
JOIN tblEmployee as E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE E.EmployeeLastName LIKE 'y%'
GROUP BY E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
ORDER BY E.EmployeeNumber

-- Another way without JOIN (correlated query)
-- This way is much faster than the previous one
SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName, (SELECT COUNT(T.EmployeeNumber)
            FROM tblTransactions as T
            WHERE T.EmployeeNumber = E.EmployeeNumber) as NumberOfTransactions
FROM tblEmployee as E 
WHERE E.EmployeeLastName LIKE 'y%' -- correlated subquery: We can not run the inner query without the outer query