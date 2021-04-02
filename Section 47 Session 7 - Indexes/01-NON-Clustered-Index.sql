CREATE NONCLUSTERED INDEX idx_tblEmployee_DateOfBirth on tblEmployee(DateOfBirth)

SELECT DateOfBirth
FROM tblEmployee
WHERE DateOfBirth >= '1992-01-01' AND DateOfBirth < '1993-01-01'


CREATE NONCLUSTERED INDEX idx_tblEmployee_DateOfBirth_Department on tblEmployee(DateOfBirth, Department)

SELECT DateOfBirth, Department
FROM tblEmployee
WHERE DateOfBirth >= '1992-01-01' AND DateOfBirth < '1993-01-01'