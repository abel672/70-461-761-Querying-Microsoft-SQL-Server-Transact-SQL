SELECT * FROM tblEmployee

SELECT @@TRANCOUNT -- 0

BEGIN TRAN MyTransaction WITH MARK

    SELECT @@TRANCOUNT -- 1
    BEGIN TRAN
        UPDATE tblEmployee
        SET EmployeeNumber = 122
        WHERE EmployeeNumber = 123

        SELECT @@TRANCOUNT -- 2
    COMMIT TRAN
    SELECT @@TRANCOUNT -- 1

IF @@TRANCOUNT > 0 -- 1
COMMIT TRAN MyTransaction

SELECT @@TRANCOUNT -- 0

SELECT * FROM tblEmployee
