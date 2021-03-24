SELECT 1 as Tag, NULL as Parent,
        E.EmployeeFirstName as [Elements!1!EmployeeFirstName],
        E.EmployeeLastName as [Elements!1!EmployeeLastName],
        E.EmployeeNumber as [Elements!1!EmployeeNumber],
        E.DateOfBirth as [Elements!1!DateOfBirth],
        null as [Elements!2!Amount],
        null as [Elements!2!DateOfTransaction]
FROM tblEmployee as E 
WHERE E.EmployeeNumber BETWEEN 200 AND 202
UNION ALL
SELECT 2 as Tag, 1 as Parent,
        null as [EmployeeFirstName],
        null as [EmployeeLastName],
        T.EmployeeNumber,
        null as DateOfBirth,
        Amount,
        DateOfTransaction
FROM tblTransactions as T
INNER JOIN tblEmployee as E ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 200 AND 202
ORDER BY EmployeeNumber, [Elements!2!Amount]
FOR XML EXPLICIT

/**
<Elements EmployeeFirstName="Michiko" EmployeeLastName="Robinett" EmployeeNumber="200" DateOfBirth="1967-01-25">
  <Elements Amount="-5.0900" DateOfTransaction="2015-08-31T00:00:00"/>
  <Elements Amount="958.9400" DateOfTransaction="2015-02-25T00:00:00"/>
</Elements>
<Elements EmployeeFirstName="Carol" EmployeeLastName="Roberts" EmployeeNumber="201" DateOfBirth="1975-08-05">
  <Elements Amount="-893.2300" DateOfTransaction="2014-09-18T00:00:00"/>
  <Elements Amount="-351.4100" DateOfTransaction="2014-04-14T00:00:00"/>
</Elements>
<Elements EmployeeFirstName="Merav" EmployeeLastName="Rizzi" EmployeeNumber="202" DateOfBirth="1971-05-19">
  <Elements Amount="-332.2300" DateOfTransaction="2015-10-17T00:00:00"/>
  <Elements Amount="-98.2400" DateOfTransaction="2015-01-11T00:00:00"/>
  <Elements Amount="913.3600" DateOfTransaction="2015-04-12T00:00:00"/>
</Elements>
*/