SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
        T.Amount, T.DateOfTransaction
FROM tblEmployee as E
LEFT JOIN tblTransactions as T 
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber between 200 and 202
FOR XML RAW, xmlschema -- xmldata

/**
    XML Schema types (data types)
        i4 / int
        boolean
        datetime
        double
        string - varchar
        null - nil
*/