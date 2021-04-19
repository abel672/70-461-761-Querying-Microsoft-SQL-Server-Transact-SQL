-- much more faster than a cursor
SELECT T.*
FROM tblTransaction as T
RIGHT JOIN tblEmployee as E 
ON T.EmployeeNumber = E.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 120 AND 299
AND T.EmployeeNumber is not null