-- One Batch
SELECT 1+1 AS Result;

GO -- Important to separate executions (batch)

-- Another Batch
SELECT 1*1 AS Result;

GO

-- This one will crash, the others will continue
SELECT 1/0 AS Result

GO

SELECT 1/1 AS Result
