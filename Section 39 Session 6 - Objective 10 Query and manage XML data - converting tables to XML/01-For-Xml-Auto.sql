SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
    E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM tblEmployee as E 
LEFT JOIN tblTransactions as T 
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML AUTO, elements -- To convert to xml