DECLARE @param varchar(1000) = '127' + char(10) + 'SELECT * FROM tblDepartment'; -- SQL INJECTION

-- Safe way: Parametrised query
EXECUTE SYS.sp_executesql
@statement = 
    N'SELECT * FROM tblTransaction as T WHERE T.EmployeeNumber = @EmployeeNumber',
@params = N'@EmployeeNumber varchar(1000)',
@EmployeeNumber = @param


-- Dynamic query (not safe)
-- EXEC @sqlcode