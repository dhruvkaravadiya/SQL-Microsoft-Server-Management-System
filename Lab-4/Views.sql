
--------Views

--1. Create a view that display first 100 workers details.
Create View VW_Display_Top100
AS
SELECT Top 100 *
FROM Person;

--2.Create a view that displays designation wise maximum, minimum & total salaries
Create View VW_lab4_viewNo1
AS
Select Max(Salary) as MaxSalary, Min(Salary) as MinSalary, Sum(Salary) as TotalSalary 
from Person
Group by DesignationID;

--3.Create a view that displays Worker’s first name with their salaries & joining date, it also displays 
--duration column which is difference of joining date with respect to current date.
alter View VW_lab4_viewNo2
AS
Select 
FirstName ,
Salary ,
JoiningDate ,
dateadd() as Duration
from
Person

select * from  VW_lab4_viewNo2;

DATEDIFF(year, '2017/08/25', '2011/08/25')
