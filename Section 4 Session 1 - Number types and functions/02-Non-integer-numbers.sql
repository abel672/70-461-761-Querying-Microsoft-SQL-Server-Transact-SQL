-- https://docs.microsoft.com/en-us/sql/t-sql/data-types/decimal-and-numeric-transact-sql?view=sql-server-ver15
-- Initialise a variable, give it a data type and a initial value

DECLARE @myvar AS decimal(7,2);

-- 12345.67 is valid for the above
-- 123456.7 is not valid

SET @myvar = 12345.67;

SELECT @myvar AS myVariable;

GO

-- 1,000,000,000.12345678 PRECISION OF 18

DECLARE @myvar AS numeric(18, 8); -- 9 bytes needed.

SET @myvar = 1000000000.12345678;

SELECT @myvar AS myVariable;

GO

DECLARE @myvar AS smallmoney = 123456.78917;

SELECT @myvar as myVariable; 

GO

DECLARE @myvar AS float(24) = 123456.7891;

SELECT @myvar AS myVariable;