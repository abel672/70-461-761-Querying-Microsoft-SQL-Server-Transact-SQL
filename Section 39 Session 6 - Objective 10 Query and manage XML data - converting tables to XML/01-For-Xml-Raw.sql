SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
    E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM tblEmployee as E 
LEFT JOIN tblTransactions as T 
ON E.EmployeeNumber = T.EmployeeNumber
FOR XML RAW('MyRow'), elements -- To convert to xml