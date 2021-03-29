/**
ACID:
    Atomic: Single unit of work
    Consistant: Data must be left in a consistant state
    Isolated: Concurrent transactions are isolated from each other
    Durable: Effects are permanent
*/

--Implicit Transactions: Starts operation and Ends operation
UPDATE tblEmployee
SET EmployeeNumber = 122
WHERE EmployeeNumber = 123