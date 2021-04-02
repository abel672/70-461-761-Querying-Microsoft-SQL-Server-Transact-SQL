-- filtered index
CREATE NONCLUSTERED INDEX idx_LastNameForHR
ON tblEmployee(EmployeeLastName) WHERE Department = 'HR'


SELECT EmployeeLastName
FROM tblEmployee
WHERE Department = 'HR'