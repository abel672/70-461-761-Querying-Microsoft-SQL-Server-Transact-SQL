DECLARE @newvalue as UNIQUEIDENTIFIER -- GUID
SET @newvalue = NEWID()
SELECT @newvalue as TheNewID

GO 

-- GUID implementation
DECLARE @randomnumbergenerator int = DATEPART(MILLISECOND, SYSDATETIME())+1000*(DATEPART(SECOND, SYSDATETIME())
                                        +60*(DATEPART(MINUTE, SYSDATETIME())+60*DATEPART(HOUR, SYSDATETIME())))

SELECT RAND(@randomnumbergenerator) as RandomNumber


BEGIN TRAN
    CREATE TABLE tblEmployee4
    (UniqueID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWID(),
    EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE)

INSERT INTO tblEmployee4(EmployeeNumber)
VALUES (1), (2), (3)
SELECT * FROM tblEmployee4

ROLLBACK TRAN

GO 

-- Sequentian ID
DECLARE @newvalue as UNIQUEIDENTIFIER
SET @newvalue = NEWSEQUENTIALID()
SELECT @newvalue as TheNewID

BEGIN TRAN
    CREATE TABLE tblEmployee4
    (UniquerID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWSEQUENTIALID(),
    EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE)

    INSERT INTO tblEmployee4(EmployeeNumber)
    VALUES (1), (2), (3)
    SELECT * FROM tblEmployee4
ROLLBACK TRAN
