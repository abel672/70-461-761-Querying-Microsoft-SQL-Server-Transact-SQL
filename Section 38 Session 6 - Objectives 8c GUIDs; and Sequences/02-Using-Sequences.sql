CREATE SEQUENCE newSeq as BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
CACHE 50

-- Adding Sequence in CONSTRAINT
ALTER TABLE tblTransactions
ADD NextNumber int CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq

ALTER TABLE tblTransactions
DROP DF_Transaction

ALTER TABLE tblTransactions
DROP COLUMN NextNumber

ALTER TABLE tblTransactions
ADD NextNumber int

ALTER TABLE tblTransactions
ADD CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq for NextNumber


-- The Sequence does not get undone, even if the row is undone (rollback)
BEGIN TRAN
    SELECT * FROM tblTransactions

    INSERT INTO tblTransactions(Amount, DateOfTransaction, EmployeeNumber)
    VALUES (1, '2017-01-01', 123)

    SELECT * FROM tblTransactions WHERE EmployeeNumber = 123

    UPDATE tblTransactions
    SET NextNumber = NEXT VALUE FOR newSeq
    WHERE NextNumber IS NULL
ROLLBACK TRAN 

ALTER TABLE tblTransactions
DROP DF_Transaction

-- Restart sequence
ALTER SEQUENCE newSeq
RESTART WITH 1

ALTER TABLE tblTransactions
DROP DF_Transaction
ALTER TABLE tblTransactions
DROP COLUMN NextNumber
DROP SEQUENCE newSeq