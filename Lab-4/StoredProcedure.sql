--Stored Procedure
--1.ALL TABLES, INSERT, UPDATE AND DELETE

--INSERT VALUES IN DEPARTMENT TABLE

CREATE PROCEDURE PR_Department_Insert
	@DepartmentID int,
	@DepartmentName varchar(100)
AS
BEGIN
Insert Into Department
(
	DepartmentID,
	DepartmentName
)
Values
(
	@DepartmentID,
	@DepartmentName
)
End

exec PR_Department_Insert 1,Admin
exec PR_Department_Insert 2,IT
exec PR_Department_Insert 3,HR
exec PR_Department_Insert 4,Account

select * from Department

--------------------------------------------------------------------------------------------------


--INSERT VALUES IN DESIGNATION


CREATE PROCEDURE PR_Designation_Insert
	@DesignationID int,
	@DesignationName varchar(100)
AS
BEGIN
Insert Into Designation
(
	DesignationID,
	DesignationName
)
Values
(
	@DesignationID,
	@DesignationName
)
End

exec PR_Designation_Insert 11,Jobber
exec PR_Designation_Insert 12,Welder
exec PR_Designation_Insert 13,Clerk
exec PR_Designation_Insert 14,Manager
exec PR_Designation_Insert 15,CEO
select * from Designation

--------------------------------------------------------------------------------------------------------

--INSERT IN PERSON
CREATE PROCEDURE PR_Person_Insert

	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary decimal(8, 2),
	@JoiningDate datetime,
	@DepartmentID int,
	@DesignationID int
AS
BEGIN
Insert Into Person
(

	FirstName,
	LastName,
	Salary,
	JoiningDate,
	DepartmentID,
	DesignationID
)
Values
(

	@FirstName,
	@LastName,
	@Salary,
	@JoiningDate,
	@DepartmentID,
	@DesignationID
)
End
exec PR_Person_Insert ' Rahul', 'Anshu' ,56000, '1990-01-01' ,1, 12
exec PR_Person_Insert 'Hardik','Hinsu' ,18000, '1990-09-25' ,2, 11
exec PR_Person_Insert 'Bhavin','Kamani', 25000, '1991-05-14', NULL, 11
exec PR_Person_Insert 'Bhoomi' ,'Patel', 39000, '2014-02-20', 1, 13
exec PR_Person_Insert 'Rohit', 'Rajgor', 17000, '1990-07-23', 2 ,15
exec PR_Person_Insert 'Priya' ,'Mehta',25000 ,'1990-10-18', 2 ,NULL
exec PR_Person_Insert 'Neha','Trivedi' ,18000 ,'2014-02-20' ,3 ,15
select * from Person

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

--UPDATE Peron Table
CREATE PROCEDURE PR_Person_Update
	@WorkerID	int,
	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary decimal(8, 2),
	@JoiningDate datetime,
	@DepartmentID int,
	@DesignationID int
AS
BEGIN
UPDATE Person
SET
	FirstName     = @FirstName,
	LastName      = @LastName,
	Salary        = @Salary,
	JoiningDate   = @JoiningDate,
	DepartmentID  = @DepartmentID,
	DesignationID = @DesignationID
WHERE WorkerID = @WorkerID
END
---------------------------------------------------------------------------------
CREATE PROCEDURE PR_Department_Update
	@DepartmentID int,
	@DepartmentName varchar(100)
AS
BEGIN
UPDATE Department
SET
	DepartmentID    = @DepartmentID,
	DepartmentName	= @DepartmentName 
WHERE DepartmentID    = @DepartmentID
END
--------------------------------------------------------------------------------
CREATE PROCEDURE PR_Designationt_Update
	@DesignationID int,
	@DesignationName varchar(100)
AS
BEGIN
UPDATE Designation
SET
	DesignationID   = @DesignationID,
	DesignationName	= @DesignationName 
WHERE DesignationID    = @DesignationID
END
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
CREATE PROCEDURE PR_Person_Delete
@WorkerID int
AS
BEGIN
Delete From Person
WHERE WorkerID = @WorkerID
END
-----------------------------------------------------------------------------------
CREATE PROCEDURE PR_Department_Delete
@DepartmentID int
AS
BEGIN
Delete From Department
WHERE DepartmentID = @DepartmentID
END
-----------------------------------------------------------------------------------
CREATE PROCEDURE PR_Designation_Delete
@DesignationID int
AS
BEGIN
Delete From Designation
WHERE DesignationID = @DesignationID
END
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

--All tables SelectAll (If foreign key is available than do write join and take columns on select list

Create PROC PC_SelectALL_Tables3
AS
BEGIN
SELECT
	P.*,D.DepartmentName,Ds.DesignationName
FROM Person as P
INNER JOIN Department AS D
ON P.DepartmentID = D.DepartmentID
Inner join	Designation as Ds
ON P.DesignationID = Ds.DesignationID
END

exec PC_SelectALL_Tables3
--------------------------------------------------------------
--- All tables SelectPK
Create PROC PR_Select_AllTables_By_PK
		@WorkerID int
AS 
BEGIN
Select 
P.*,D.DepartmentName,Ds.DesignationName
FROM Person as P

INNER JOIN Department AS D
ON P.DepartmentID = D.DepartmentID

Inner join	Designation as Ds
ON P.DesignationID = Ds.DesignationID

where WorkerID = @WorkerID
END

--exec PR_Select_AllTables_By_PK 1
---------------------------------------------------------------------------------------------------
--Create Procedure that takes Department Name & Designation Name as Input and Returns a 
--table with Worker’s First Name, Salary, Joining Date & Department Name
Create PROC PR_Select_Specified_By_DeptName_DesigName
		@DepartmentName varchar(100),
		@DesignationName varchar(100)
AS 
BEGIN
Select 
P.FirstName,P.Salary,P.JoiningDate,D.DepartmentName
FROM Person as P

INNER JOIN Department AS D
ON P.DepartmentID = D.DepartmentID

INNER JOIN Designation AS Ds
ON P.DesignationID = Ds.DesignationID

where DepartmentName = @DepartmentName and DesignationName = @DesignationName
END
--------------------------------------------------------------------------------------------
--Create Procedure that takes FirstName as an input parameter and displays’ all the details of 
--the worker with their department & designation name

Create PROC PR_Select_By_FirstName_DisplayAll
		@FirstName varchar(100)
AS 
BEGIN
Select 
P.*,D.DepartmentName,Ds.DesignationName
FROM Person as P

INNER JOIN Department AS D
ON P.DepartmentID = D.DepartmentID

INNER JOIN Designation AS Ds
ON P.DesignationID = Ds.DesignationID

where FirstName = @FirstName
END

------------------------------------------------------------------------------------------------
--Create Procedure which displays department wise maximum, minimum & total salaries.
Create PROC PR_Display_Salary_by_Dept
	@DepartmentID int
AS
BEGIN
Select Max(Salary) as MaxSalary, Min(Salary) as MinSalary, Sum(Salary) as TotalSalary 
from Person
where DepartmentID = @DepartmentID
group by DepartmentID
END

--EXEC PR_Display_Salary_by_Dept 1
-----------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
