ALTER TRIGGER tr_ViewByDepartment
	ON dbo.ViewByDepartment
	INSTEAD OF DELETE
	AS
	BEGIN
		SELECT *, 'To Be Deleted' FROM deleted;
		
		-- use join to delete multiple rows comming from the deleted table
		DELETE tblTransactions 
		FROM tblTransactions as T
		JOIN deleted as D
		ON T.EmployeeNumber = D.EmployeeNumber
		AND T.DateOfTransaction = D.DateOfTransaction
		AND T.Amount = D.TotalAmount
	END
GO

BEGIN TRAN
	SELECT *, 'Before Delete' FROM ViewByDepartment WHERE EmployeeNumber = 132;
	
	DELETE FROM ViewByDepartment
	WHERE EmployeeNumber = 132-- AND TotalAmount = 861.16;

	SELECT *, 'After Delete' FROM ViewByDepartment WHERE EmployeeNumber = 132;
ROLLBACK TRAN