SELECT E.EmployeeFirstName as '@EmployeeFirstName', -- To add them as attributes, they must be in the first place
        E.EmployeeLastName as '@EmployeeLastName',
        E.EmployeeNumber,
        E.DateOfBirth, 
        T.Amount as 'Transaction/Amount', -- Put elements nested into <Transaction>
        T.DateOfTransaction as 'Transaction/DateOfTransacion'
FROM tblEmployee as E 
LEFT JOIN tblTransactions as T 
ON E.EmployeeNumber = T.EmployeeNumber
FOR XML PATH('Employee'), ROOT('MyXML')


-- Another way (with sub query)
SELECT E.EmployeeFirstName, -- as '@EmployeeFirstName',
        E.EmployeeLastName, -- as '@EmployeeLastName',
        E.EmployeeNumber,
        E.DateOfBirth, 
        -- Removing JOIN to nest Transaction Elements
        (SELECT T.Amount as 'Amount'
        FROM tblTransactions as T
        WHERE T.EmployeeNumber = E.EmployeeNumber
        FOR XML PATH(''), TYPE) as TransactionElement -- To conver document into XML
FROM tblEmployee as E 
FOR XML PATH('Elements'), ROOT('MyXML')