SELECT * 
FROM dbo.TransList(123)

GO

SELECT *, (SELECT COUNT(*) FROM dbo.TransList(E.EmployeeNumber)) as NumTransactions
FROM tblEmployee as E 


-- Apply is used instead of JOIN with a table and a function
SELECT *
FROM tblEmployee as E
OUTER APPLY TransList(E.EmployeeNumber) as T


SELECT *
FROM tblEmployee as E
CROSS APPLY TransList(E.EmployeeNumber) as T

-- OUTER APPLY = LEFT JOIN
-- CROSS APPLY = INNER JOIN