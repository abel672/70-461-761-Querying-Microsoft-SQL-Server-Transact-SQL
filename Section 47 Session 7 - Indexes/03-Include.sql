-- include the others, but not as keys indexes
-- include allows you to add additional items at the leaf level
CREATE NONCLUSTERED INDEX idx_LastNameForHR
ON tblEmployee(EmployeeNumber) -- Root level/node, Intermidiate Level/branch node
INCLUDE (EmployeeFirstName, EmployeeMiddleName, EmployeeLastName) -- Leaf level/node

-- Uses index seek to retrieve the data
SELECT EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
FROM tblEmployee
WHERE EmployeeNumber BETWEEN 140 AND 150