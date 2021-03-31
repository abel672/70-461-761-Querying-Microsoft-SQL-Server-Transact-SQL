SET TRANSACTION ISOLATION LEVEL READ COMITTED -- Level 1 (default)
SET TRANSACTION ISOLATION LEVEL READ UNCOMITTED -- Level 2 (dont have to wait for other transaction to finish)
-- it allows to insert additional rows, while the transaction is running
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ -- Level 3 (if something change in the middle of a transaction, this one takes those changes)
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE -- Level 4 (does not allow insertion, while the transaction is running)