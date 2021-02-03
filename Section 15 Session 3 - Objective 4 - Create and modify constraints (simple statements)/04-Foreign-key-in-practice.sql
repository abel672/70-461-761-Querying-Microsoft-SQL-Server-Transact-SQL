-- Adding foreign key
BEGIN TRAN;

	ALTER TABLE tblTransactions ALTER COLUMN EmployeeNumber INT NULL; -- set column data to the same type
	--ALTER TABLE tblTransactions ADD CONSTRAINT DF_tblTransaction DEFAULT 124 FOR EmployeeNumber;
	-- Foreign key 
	ALTER TABLE tblTransactions WITH NOCHECK
		ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)
		REFERENCES tblEmployee(EmployeeNumber)
		ON UPDATE CASCADE -- Update in cascade, in case of updates happens
		-- ON UPDATE SET NULL; -- Set to null is udpate happens
		-- ON UPDATE DEFAULT; -- Rejects the update and set its own default value in the column
		ON DELETE NO ACTION; -- In case of delete, nothing happens
		-- ON DELETE CASCADE; -- In case of delete, delete all
		-- ON DELETE SET NULL; -- In case of delete, set to null
		-- ON DELETE SET DEFAULT; -- In case of delete, set to default value

	UPDATE tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber IS NULL;

	DELETE tblEmployee WHERE EmployeeNumber = 123;

	SELECT E.EmployeeNumber, T.*
	FROM tblEmployee as E
	RIGHT JOIN tblTransactions as T
	ON E.EmployeeNumber = T.EmployeeNumber
	WHERE T.Amount IN(-179,47, 786.22, -967.36, 957.03);

ROLLBACK TRAN;