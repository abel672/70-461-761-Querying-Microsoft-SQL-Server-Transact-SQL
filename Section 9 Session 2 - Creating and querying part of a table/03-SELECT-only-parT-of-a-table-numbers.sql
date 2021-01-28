-- not bigger than 200
SELECT * from tblEmployee
WHERE NOT EmployeeNumber > 200;

SELECT * from tblEmployee
WHERE EmployeeNumber != 200;

-- between values
SELECT * FROM tblEmployee
WHERE EmployeeNumber >=200 AND EmployeeNumber <=209;

SELECT * FROM tblEmployee
WHERE NOT (EmployeeNumber>=200 AND EmployeeNumber<=209);

SELECT * FROM tblEmployee
WHERE EmployeeNumber<200 OR EmployeeNumber>209;

SELECT * FROM tblEmployee
WHERE EmployeeNumber BETWEEN 200 AND 209;  

SELECT * FROM tblEmployee
WHERE EmployeeNumber NOT BETWEEN 200 AND 209;