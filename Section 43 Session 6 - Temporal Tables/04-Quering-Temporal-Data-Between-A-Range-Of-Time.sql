SELECT * FROM tblEmployeeTemporal
FOR SYSTEM_TIME
FROM '2019-01-01' TO '2024-01-01'
WHERE EmployeeNumber = 124
-- FROM startdatetime TO enddatetime - current and historic data, exclude enddatetime


SELECT * FROM tblEmployeeTemporal
FOR SYSTEM_TIME
BETWEEN '2019-01-01' AND '2024-01-01'
WHERE EmployeeNumber = 124
-- BETWEEN startdatetime AND enddatetime - current and historic data, indludes enddatetime


SELECT * FROM tblEmployeeTemporal
FOR SYSTEM_TIME
CONTAINED IN('2019-01-01', '2024-01-01')
WHERE EmployeeNumber = 124
-- CONTAINED IN (startdatetime, enddatetime) - NOT current data; historic data