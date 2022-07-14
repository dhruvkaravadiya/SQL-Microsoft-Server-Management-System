--1. Find all persons with their department name & code. 
Select PersonName , DepartmentName , DepartmentCode
from Person
inner join
Department
ON Person.DepartmentID  = Department.DepartmentID; 

  
--2. Give department wise maximum & minimum salary with department name.
Select DepartmentName  , Max(Salary) as MaxSalary,Min(Salary) as MinSalary
from Department D
 inner join Person P
 on P.DepartmentID  = D.DepartmentID
 group by DepartmentName;


--3. Find all departments whose total salary is exceeding 100000.
Select DepartmentName,Sum(Salary)
 from Person P
 inner join
 Department D
 on P.DepartmentID  = D.DepartmentID
 Group by DepartmentName
 having Sum(Salary)>100000;


--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT PersonName , Salary , DepartmentName
from Person P
inner join 
Department D
on P.DepartmentID  = D.DepartmentID
where City = 'Jamnagar';


--5. Find all persons who does not belongs to any department.
Select PersonName 
from Person
where DepartmentID is Null;


--6. Find department wise person counts.
Select DepartmentName ,  Count(PersonID)
from Person P
inner join
Department D
on P.DepartmentID  = D.DepartmentID
group by DepartmentName;


--7. Find average salary of person who belongs to Ahmedabad city.
Select PersonName , Avg(Salary) as AvgSalary
from  Person 
where City = 'Ahmedabad'
group by PersonName;


--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly(In single column)
Select PersonName + ' earns '+ Convert(varchar(100),Salary) + ' from department ' + DepartmentName
from  Person P
 inner join
 Department D
 on P.DepartmentID  = D.DepartmentID;



--9. List all departments who have no persons.
Select DepartmentName 
from Department D
inner join 
Person P
on P.DepartmentID  = D.DepartmentID
where PersonID is Null;



--10. Find city & department wise total, average & maximum salaries.
Select City, DepartmentName,Sum(Salary) , Avg(Salary) , Max(Salary)
from Department D 
inner join Person P
on P.DepartmentID  = D.DepartmentID
Group by City, DepartmentName;


--11. Display Unique city names.
Select Distinct City from  Person;



--12. List out department names in which more than two persons.
Select DepartmentName 
from Person P
inner join 
Department D
on P.DepartmentID  = D.DepartmentID
group by DepartmentName
having Count(PersonID)>2;



--13. Combine person name’s first three characters with city name’s last three characters in single column.
Select SUBSTRING(PersonName,1,3)+Right(City,3)
 AS Combined_Name
from Person;


--14. Give 10% increment in Computer department employee’s salary.
Update Person
SET Salary = Salary + (Salary * 10/100)
where DepartmentName = 'Computer'; 


--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.
