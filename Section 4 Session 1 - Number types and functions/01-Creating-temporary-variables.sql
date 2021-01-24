-- Declaring a variable
DECLARE @myvar AS tinyint = 2;

-- Trying to make it negative
SET @myvar = -3;

SELECT @myvar as minusThreeVariable;

-- Intiate and Instaziate
DECLARE @myvar2 AS int;

SET @myvar2 = 3;

-- SELECT a variable
SELECT @myvar AS myVariable;

-- Override variable
SET @myvar = 15 + @myvar;

-- SELECT a variable
SELECT @myvar AS myVariable;

-- smallint
DECLARE @myvar3 AS smallint = 2000;

SET @myvar3 = @myvar3 * 10;


/**

	Bigint
	Int - up to 2,000,000,000
	Tinyint - 0-255
	Smallint - -32767 to 32768

	BITS
*/