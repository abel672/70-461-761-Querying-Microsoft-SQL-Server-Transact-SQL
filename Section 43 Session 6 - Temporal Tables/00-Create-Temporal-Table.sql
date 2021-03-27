CREATE TABLE tblEmployeeTemporal
    (EmployeeNumber int NOT NULL PRIMARY KEY CLUSTERED,
    EmployeeFirstName varchar(50) NOT NULL,
    EmployeeMiddleName varchar(50) NULL,
    EmployeeLastName varchar(50) NOT NULL,
    EmployeeGovermentID char(10) NOT NULL,
    DateOfBirth date NOT NULL, Department varchar(19) NULL,
    -- This last three must always be together
    ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START,
    ValidTo datetime2(2) GENERATED ALWAYS AS ROW END,
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo))
    WITH (SYSTEM_VERSIONING = ON) -- tell computer to manage the updates


INSERT INTO tblEmployeeTemporal
    (EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName,
    EmployeeGovermentID, DateOfBirth, Department)
VALUES (123, 'Jane', NULL, 'Zwilling', 'AB123456G', '1985-01-01', 'Customer Relations'),
        (124, 'Carolyn', 'Andrea', 'Zimmerman', 'AB234567H', '1975-06-01', 'Commercial'),
        (125, 'Jane', NULL, 'Zabokritski', 'LU778728T', '1977-12-09', 'Commercial'),
        (126, 'Ken', 'J', 'Yukish', 'PO201903O', '1969-12-27', 'HR'),
        (127, 'Terri', 'Lee', 'Yu', 'ZH206496W', '1986-11-14', 'Customer Relations'),
        (128, 'Roberto', NULL, 'Young', 'EH793082D', '1967-04-05', 'Customer Relations')

SELECT * FROM tblEmployeeTemporal

UPDATE tblEmployeeTemporal SET EmployeeLastName = 'Smith' WHERE EmployeeNumber = 124
UPDATE tblEmployeeTemporal SET EmployeeLastName = 'Albert' WHERE EmployeeNumber = 124

DROP TABLE tblEmployeeTemporal