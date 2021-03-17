BEGIN TRAN 

    ALTER TABLE tblEmployee
        add Manager int 
    go 

    UPDATE tblEmployee
        SET Manager = ((EmployeeNumber-123)/10) + 123
        WHERE EmployeeNumber > 123
    
    -- Self Join. Employees who are also managers of other employees (they are in the same table)
    SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, E.Manager,
            M.EmployeeNumber as ManagerNumber, 
            M.EmployeeFirstName as ManagerFirstName, 
            M.EmployeeLastName as ManagerLastName
    FROM tblEmployee as E 
    JOIN tblEmployee as M 
    ON E.Manager = M.EmployeeNumber

ROLLBACK TRAN