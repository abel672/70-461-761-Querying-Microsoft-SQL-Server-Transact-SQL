ALTER TABLE tblEmployee
    ADD
        ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START CONSTRAINT def_ValidFrom DEFAULT SYSUTCDATETIME(),
        ValidTo datetime2(2) GENERATED ALWAYS AS ROW END CONSTRAINT def_ValidTo DEFAULT
                                                                    CONVERT(datetime2(2), '9999-12-31 23:59:59'),
        PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)

SELECT * FROM tblEmployee

ALTER TABLE tblEmployee
    SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = tblEmployeeHistory2))

