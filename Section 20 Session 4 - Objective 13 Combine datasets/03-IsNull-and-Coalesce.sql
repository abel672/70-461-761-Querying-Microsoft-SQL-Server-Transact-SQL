SELECT * FROM tblEmployee WHERE EmployeeMiddleName is null;

DECLARE @myOption as varchar(10) = 'Option B';
SELECT ISNULL(@myOption, 'No Option') as MyOptions;
GO

DECLARE @myFirstOption as varchar(10) = 'Option A';
DECLARE @mySecondOption as varchar(10) = 'Option B';

-- take the first parameter that is not null
SELECT COALESCE(@myFirstOption, @mySecondOption, 'No Option') as MyOptions;
GO

SELECT ISNULL('ABC', 1) as MyAnswer; -- take first no null parameter and print it
SELECT COALESCE('ABC', 1) as MyOtherAnswer; -- all parameters must be the same data type. Similar to CASE
GO

SELECT ISNULL(null, null) as MyAnswer; 
SELECT COALESCE(null, null) as MyOtherAnswer; -- something must not be null to use this.
GO

-- with table example
CREATE TABLE tblExample
(myOption nvarchar(10) null)
go

INSERT INTO tblExample (myOption)
values ('Option A')

-- COALESCE always create null oclumns
SELECT COALESCE(myOption, 'No Option') as MyOptions
INTO tblIsCoalesce -- creating new table
FROM tblExample;
go

-- ISNULL can create not null columns
SELECT ISNULL(myOption, 'No Option') as MyOptions
INTO tblIsNull -- creating new table
FROM tblExample
go

DROP TABLE tblExample
DROP TABLE tblIsNull
DROP TABLE tblIsCoalesce

/**
	ISNULL when is only two values to compare
	COALESCE when there are more values to compare
*/