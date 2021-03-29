BEGIN TRAN MyTransaction WITH MARK

    SELECT * 
    FROM tblEmployee

    UPDATE tblEmployee
    SET EmployeeNumber = 122
    WHERE EmployeeNumber = 123

ROLLBACK TRAN MyTransaction