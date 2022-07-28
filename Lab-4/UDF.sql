--------------------------------------------User Defined Functions----------------------------------

--1.Create a table valued function which accepts DepartmentID as a parameter & returns a worker 
--table based on DepartmentID
CREATE FUNCTION [dbo].Function_1 (
	@DepartmentID int
)
RETURNS table
AS
    RETURN (Select* from Person where DepartmentID = @DepartmentID)

--select * from [dbo].Function_1(1)

--3.
--Create a scalar valued function which accepts two parameters start date & end date, and 
--returns a date difference in days

Create function [dbo].Function_2 (	
	@StartDate datetime ,
	@EndDate datetime
)
returns table
as 
	return (Select Datediff(day , @StartDate , @EndDate) as DateDifference from Person)

--4. Create a scalar valued function which accepts two parameters year in integer & month in 
--integer and returns total days in passed month & year
alter function [dbo].Function_4
(	@Month int,
	@Year int
)
returns table
AS
RETURN (Select datename(day ,eomonth(cast(cast(@Year as varchar(04))+cast(@Month as varchar(04))+cast('01' as varchar(04)) as Datetime))) as TotDays)	

select * from [dbo].Function_4(04, 2022)







    




	IF DATENAME(weekday, GETDATE()) IN (N'Saturday', N'Sunday')
       SELECT 'Weekend';
ELSE 
       SELECT 'Weekday';

 
