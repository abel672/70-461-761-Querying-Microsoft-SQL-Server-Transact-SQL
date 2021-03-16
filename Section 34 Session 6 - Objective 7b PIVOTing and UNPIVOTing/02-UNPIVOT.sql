-- WITH myTable as 
-- (SELECT YEAR(DateOfTransaction) as TheYear, MONTH(DateOfTransaction) as TheMonth, SUM(Amount) as Amount FROM tblTransactions
-- GROUP BY YEAR(DateOfTransaction), MONTH(DateOfTransaction))

-- -- get total amount per month of each year
-- SELECT TheYear, ISNULL([1], 0) as [1], 
--                 ISNULL([2], 0) as [2], 
--                 ISNULL([3], 0) as [3], 
--                 ISNULL([4], 0) as [4], 
--                 ISNULL([5], 0) as [5], 
--                 ISNULL([6], 0) as [6], 
--                 ISNULL([7], 0) as [7], 
--                 ISNULL([8], 0) as [8], 
--                 ISNULL([9], 0) as [9], 
--                 ISNULL([10], 0) as [10], 
--                 ISNULL([11], 0) as [11], 
--                 ISNULL([12], 0) as [12] into tblPivot FROM myTable
-- PIVOT (SUM(Amount) for TheMonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as MyPvt
-- ORDER BY TheYear

-- UNPIVOT
SELECT * FROM tblPivot
UNPIVOT (Amount FOR Month IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as tblUnPivot
WHERE Amount <> 0