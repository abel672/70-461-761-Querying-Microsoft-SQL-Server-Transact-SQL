DECLARE @firstname as nvarchar(20);
DECLARE @middlename as  nvarchar(20);
DECLARE @lastname as nvarchar(20);

set @firstname = 'John';
set @middlename = 'Walker';
set @lastname = 'Smith';

-- Concat with +
SELECT @firstname + ' ' + @middlename + ' ' + @lastname as FullName;

GO

DECLARE @firstname as nvarchar(20);
DECLARE @middlename as  nvarchar(20);
DECLARE @lastname as nvarchar(20);

set @firstname = 'John';
set @lastname = 'Smith';

-- if we add a non existig variable, the answer of the operation will be NULL = I don't know
SELECT @firstname + ' ' + @middlename + ' ' + @lastname as FullName;

-- Solution IF statemnents of WHEN THEN cases
SELECT @firstname + IIF(@middlename is null, '', ' ' + @middlename) + ' ' + @lastname as FullName;

SELECT @firstname + 
	CASE WHEN @middlename IS NULL THEN '' ELSE ' ' + @middlename END
		+ ' ' + @lastname as FullName;

-- COALESCE take the first not null value in the params
SELECT @firstname + COALESCE(' ' + @middlename, '') + ' ' + @lastname as FullName;

-- CONCAT discards null values automatically
SELECT CONCAT(@firstname, ' ' + @middlename, ' ', @lastname) as FullName;