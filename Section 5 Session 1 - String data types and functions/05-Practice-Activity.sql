select [name]
from sys.all_columns;

-- 1
select 'A' + [name]
from sys.all_columns

-- adding format character
select [name] + N'Ⱥ'
from sys.all_columns

-- removing first character
select RIGHT([name], LEN([name])-1), [name]
from sys.all_columns;

select SUBSTRING([name],2, LEN([name])-1), [name]
from sys.all_columns;

-- removing last character
select LEFT([name], LEN([name])-1), [name]
from sys.all_columns;

select SUBSTRING([name], 1, LEN([name])-1), [name]
from sys.all_columns;