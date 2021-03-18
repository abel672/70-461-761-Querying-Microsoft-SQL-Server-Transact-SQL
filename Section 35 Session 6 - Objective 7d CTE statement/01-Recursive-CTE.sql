BEGIN TRAN 

    ALTER TABLE tblEmployee
        add Manager int 
    go 

    UPDATE tblEmployee
        SET Manager = ((EmployeeNumber-123)/10) + 123
        WHERE EmployeeNumber > 123;
    
    -- A CTE is a WITH statement
    WITH myTable as
        (SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName, 0 as BossLevel -- Anchor
        FROM tblEmployee 
        WHERE Manager IS NULL
        UNION ALL 
        -- once this below query does not retrieve results, the recursion stops
        SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, myTable.BossLevel + 1 -- Recursive
        FROM tblEmployee as E 
        JOIN myTable on E.Manager = myTable.EmployeeNumber
        )
    
    SELECT * FROM myTable

-- recursive CTE Statement
ROLLBACK TRAN