USE [70-461]

-- Average functions
SELECT DISTINCT EmployeeNumber,
-- Decimal
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY NumberAttendance) OVER (PARTITION BY EmployeeNumber) as AverageCont,
-- Int
PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY NumberAttendance) OVER (PARTITION BY EmployeeNumber) as AverageDisc
FROM tblAttendance


/**
        1
        3
        6
        7
        7

    -- Mean = Average  AVG() -> 4.8
    -- Mode = Highest -> 7
    -- Median = Medium value of the middle row -> 6
*/