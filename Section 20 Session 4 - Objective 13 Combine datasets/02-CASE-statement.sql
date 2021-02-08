DECLARE @myOption as varchar(10) = 'Option B';

-- case 1: Comparing the value with another value (=, >, <, <>)
-- also compare multiple variables
SELECT CASE WHEN @myOption = 'Option A' THEN 'First Option'	
			WHEN @myOption = 'Option B' THEN CONVERT(varchar(10), 2) -- keep always seem type of data
			ELSE 'No Option' END as MyOptions;

-- case 2: True or false
-- only one variable (like a SWITCH)
SELECT CASE @myOption WHEN 'Option A' THEN 'First option'
						WHEN 'Option B' THEN 'Second option'
						ELSE 'No Option' END as MyOptions;

GO


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeNumber]
      ,[EmployeeFirstName]
      ,[EmployeeMiddleName]
      ,[EmployeeLastName]
      ,[EmployeeGovermentID]
      ,[DateOfBirth]
      ,[Department],
	  CASE WHEN LEFT(EmployeeGovermentID, 1) = 'A' THEN 'Letter A'
			WHEN LEFT(EmployeeGovermentID, 1) = 'B' THEN 'Letter B'
			ELSE 'Neither letter' END + '.' as LetterColumn
  FROM [70-461].[dbo].[tblEmployee]