

--------Views

--1. Create a view that display first 100 workers details.
Create View VW_Display_Top100
AS
SELECT Top 100 *
FROM Person;

--select * from VW_Display_Top100

--2.Create a view that displays designation wise maximum, minimum & total salaries
Create View VW_lab4_viewNo1
AS
Select Max(Salary) as MaxSalary, Min(Salary) as MinSalary, Sum(Salary) as TotalSalary 
from Person
Group by DesignationID;

--select * from VW_lab4_viewNo1
--3.Create a view that displays Worker’s first name with their salaries & joining date, it also displays 
--duration column which is difference of joining date with respect to current date.
alter View VW_lab4_viewNo2
AS
Select 
FirstName ,
Salary ,
JoiningDate ,
DATEDIFF(year,  JoiningDate ,getDate()) as Duration
from
Person

--select * from  VW_lab4_viewNo2;



--4.Create a view which shows department & designation wise total number of workers.
create view  vw_Q4
AS
Select
	DepartmentName, 
	DesignationName ,
	Count(WorkerID) AS TotalWorker 
from  Person P 
	inner join Department D
on P.DepartmentID = D.DepartmentID
	inner join Designation Ds
on P.DesignationID = Ds.DesignationID
GROUP BY DepartmentName,DesignationName

--select * from vw_Q4

--5.Create a view that displays worker names who don’t have either in any department or designation
CREATE view vw_Q5
AS 
Select FirstName + LastName as WorkerName
from Person
where DepartmentID IS Null 
or DesignationID IS Null

select * from vw_Q5
 


