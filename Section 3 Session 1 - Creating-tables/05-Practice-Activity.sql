/**
Now that you've seen how to make tables and add values, it's now your turn.

Firstly, please make a table called tblPrimeNumbers. It should have a field called intField, an integer (int).

Then can you add, as separate records, the values 2, 3, 5 and 7 and 11.

There are two ways to do this. Either you can use the GUI, or you can use T-SQL - or you can do both. If you do both, make sure the second table is called something like tblPrimeNumbers2.

After this, view the data, and then remove the data and then remove the table.

Remember, practice makes perfect - and making mistakes is good, as you'll learn how to correct them. :-)
*/

-- 1. Firstly, please make a table called tblPrimeNumbers. It should have a field called intField, an integer (int).
CREATE TABLE tblPrimeNumbers
	(intField int)


-- 2. Then can you add, as separate records, the values 2, 3, 5 and 7 and 11.
INSERT INTO tblPrimeNumbers VALUES
	(2),
	(3),
	(5),
	(7),
	(11);