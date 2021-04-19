DECLARE @EmployeeID int
-- Declare cursor
DECLARE csr CURSOR FOR
    SELECT EmployeeNumber
    FROM tblEmployee
    WHERE EmployeeNumber BETWEEN 120 AND 299

-- Open cursor
OPEN csr
FETCH NEXT FROM csr INTO @EmployeeID -- first row of employeeNumber

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT * FROM tblTransaction WHERE EmployeeNumber = @EmployeeID
    FETCH NEXT FROM csr INTO @EmployeeID
END

CLOSE csr
DEALLOCATE csr