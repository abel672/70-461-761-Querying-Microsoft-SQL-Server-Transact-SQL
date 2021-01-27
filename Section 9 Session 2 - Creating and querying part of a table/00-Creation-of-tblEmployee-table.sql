USE [70-461];

CREATE TABLE tblEmployee
(
	EmployeeNumber INT NOT NULL,
	EmployeeFirstName VARCHAR(50) NOT NULL,
	EmployeeMiddleName VARCHAR(50) NULL,
	EmployeeLastName VARCHAR(50) NOT NULL,
	EmployeeGovermentID CHAR(10) NULL,
	DateOfBirth DATE NOT NULL
);