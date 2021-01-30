SELECT COUNT(Department) as NumberOfDepartment
FROM
-- derived table: Create a new Table from a query result, and select the wished columns
(SELECT Department, COUNT(*) as NumberPerDepartment
FROM tblEmployee
GROUP BY Department) as newTable; 

-- DISTICT:  Similar to GROUP BY
SELECT DISTINCT Department
FROM tblEmployee;

-- CREATING A TABLE DINAMICALLY (this just works one, like CREATE TABLE)
SELECT DISTINCT Department, '' as DepartmentHead
INTO tblDepartment -- creating new table here
FROM tblEmployee;


SELECT * FROM tblDepartment;

-- Modifify column with varchar(20)
DROP TABLE tblDepartment;

SELECT DISTINCT Department, CONVERT(VARCHAR(20), 'N') as DepartmentHead
INTO tblDepartment
FROM tblEmployee;

ALTER TABLE tblDepartment
ALTER COLUMN Department VARCHAR(30) NULL;