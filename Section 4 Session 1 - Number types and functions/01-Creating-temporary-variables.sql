-- Declaring a variable
DECLARE @myvar AS int = 2;

-- Intiate and Instaziate
DECLARE @myvar2 AS int;

SET @myvar2 = 3;

-- SELECT a variable
SELECT @myvar AS myVariable;

-- Override variable
SET @myvar = 15 + @myvar;

-- SELECT a variable
SELECT @myvar AS myVariable;
