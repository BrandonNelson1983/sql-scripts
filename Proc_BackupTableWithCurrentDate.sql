SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Brandon Nelson>
-- Create date: <06/26/2017>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CustomersBackupProc]
	-- Add the parameters for the stored procedure here
AS
BEGIN

--*****************************************************************************
--*	       Back up table NORTHWND.dbo.Customers Daily Activity             	  *
--***************************************************************************** 

--Dumping data into a temp table--
SELECT * into CustomersBackup from Customers with(nolock)

DECLARE @table1 varchar(500)

--Setting my table name with the date at the end--
SET @table1='CustomersBackup' +(CONVERT(VARCHAR(8),GETDATE(),112))

DECLARE @drop1 NVARCHAR(MAX) = 'DROP TABLE CustomersBackup' +(CONVERT(VARCHAR(8),GETDATE(),112))
IF OBJECT_ID('CustomersBackup' +(CONVERT(VARCHAR(8),GETDATE(),112))) IS NOT NULL
BEGIN
exec sp_executesql @drop1
END

--Renaming the temp table up top to the new table name with the date--
EXEC sp_rename 'CustomersBackup', @table1

END
