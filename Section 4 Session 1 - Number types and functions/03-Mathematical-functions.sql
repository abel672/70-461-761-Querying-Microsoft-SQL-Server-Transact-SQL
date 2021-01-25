-- Math functions: https://docs.microsoft.com/en-us/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver15

DECLARE @myvar AS numeric(7,2) = 3;

SELECT POWER(@myvar, 2) as PowerBy2;
SELECT SQUARE(@myvar) as SquarBy2;

SELECT POWER(@myvar, 0.5) as PowerHalf;
SELECT SQRT(@myvar) as Half;

GO

-- ROUND UP and DOWN

DECLARE @myvar AS numeric(7,2) = 3.5445;

SELECT FLOOR(@myvar) AS myFloor; -- down
SELECT CEILING(@myvar) AS myCeiling; -- up
SELECT ROUND(@myvar, 1) AS myRound1; -- round to the closest
SELECT ROUND(@myvar, 2) AS myRound2; -- round using two decimals places as reference
SELECT ROUND(@myvar, -1) AS myRoundMinus1; -- round to nearest 10

GO

-- PI and E

SELECT PI() AS myPI;
SELECT EXP(1) AS E;

-- Absolute and SIGN

DECLARE @myvar AS numeric(7,2) = -456;

SELECT ABS(@myvar) AS PositiveValue, SIGN(@myvar) AS SignValue;

GO

-- Random value

SELECT RAND(345);