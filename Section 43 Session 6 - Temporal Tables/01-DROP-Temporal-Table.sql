USE [70-461]
GO

/****** 1. SET SYSTEM_VERSIONING OFF ******/
ALTER TABLE [dbo].[tblEmployeeTemporal] SET ( SYSTEM_VERSIONING = OFF  )
GO

/****** DROP the table ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmployeeTemporal]') AND type in (N'U'))
DROP TABLE [dbo].[tblEmployeeTemporal]
GO

/****** Drop the hidden table that the computer has created (History Table) ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSSQL_TemporalHistoryFor_222623836]') AND type in (N'U'))
DROP TABLE [dbo].[MSSQL_TemporalHistoryFor_222623836]
GO


