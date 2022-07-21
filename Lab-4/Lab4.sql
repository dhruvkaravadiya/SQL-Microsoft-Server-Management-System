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

exec PR_Department_Insert 11,Jobber
exec PR_Department_Insert 12,Welder
exec PR_Department_Insert 13,Clerk
exec PR_Department_Insert 14,Manager
exec PR_Department_Insert 15,CEO
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

ALTER PROC PC_SelectALL_Tables3
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

 
