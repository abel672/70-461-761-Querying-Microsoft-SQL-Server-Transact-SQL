USE [70-461]
-- Sub query: Alternative to JOIN
SELECT *
FROM tblTransactions as T 
WHERE EmployeeNumber IN 
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName NOT LIKE 'y%')
ORDER BY EmployeeNumber -- must be in tblEmployee AND tblTransaction, and not 126-129
                        -- INNER JOIN


SELECT *
FROM tblTransactions as T 
WHERE EmployeeNumber NOT IN 
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber -- must be in tblTransaction, and not 126-129
                        -- LEFT JOIN