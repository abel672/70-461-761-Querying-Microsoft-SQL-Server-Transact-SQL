-- concat numbers with strings
SELECT 'My Number is: ' + CONVERT(varchar(20), 4567);
SELECT 'My Number is: ' + CAST(4567 as varchar(20));

SELECT 'My salary is: ' + CONVERT(varchar(20), 2345.6);

-- format into a currency string
SELECT 'My salary is: ' + FORMAT(2345.6, 'C'); -- $ 2345.6

SELECT 'My salary is: ' + FORMAT(2345.6, 'C', 'en-GB'); -- pounds 2345.6
SELECT 'My salary is: ' + FORMAT(2345.6, 'C', 'fr-FR'); -- 2345.6 euros