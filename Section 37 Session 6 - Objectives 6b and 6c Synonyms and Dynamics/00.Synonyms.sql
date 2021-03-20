USE [70-461]
-- Synonym 1
CREATE SYNONYM EmployeeTable
for tblEmployee

GO 

SELECT * FROM EmployeeTable

-- Synonym Example, for remote table in remote server
CREATE SYNONYM RemoteTable
for REMOTE_SERVER.databaseName.dbo.tblRemote

GO 

SELECT * FROM RemoteTable