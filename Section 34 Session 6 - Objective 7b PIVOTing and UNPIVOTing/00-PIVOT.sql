WITH myTable as 
(SELECT YEAR(DateOfTransaction) as TheYear, MONTH(DateOfTransaction) as TheMonth, Amount FROM tblTransactions)

-- get total amount per month of each year
SELECT TheYear, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] FROM myTable
PIVOT (SUM(Amount) for TheMonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as MyPvt
ORDER BY TheYear