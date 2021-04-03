-- SARG: Search Argument
SELECT E.EmployeeNumber, T.Amount
FROM tblEmployee as E
LEFT JOIN tblTransaction as T 
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber / 10 = 34 -- Not SARG: Is goint to scan our Indexes


SELECT E.EmployeeNumber, T.Amount
FROM tblEmployee as E
LEFT JOIN tblTransaction as T 
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349 -- SARG: Its seeking our indexes
-- Don't SORT, unless you need to
ORDER BY Amount -- SORT Cost a lot of performance (check execution plan of this query and first query)