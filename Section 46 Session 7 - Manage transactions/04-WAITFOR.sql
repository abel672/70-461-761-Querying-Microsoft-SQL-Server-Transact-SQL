BEGIN TRAN

    UPDATE tblEmployee SET EmployeeNumber = 122 WHERE EmployeeNumber = 123

    WAITFOR DELAY '00:00:10' -- Thiw transaction will have its lock for 10 sec

ROLLBACK TRAN 