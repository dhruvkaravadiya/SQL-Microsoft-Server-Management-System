create database lab5
--1.
--Create INSERT, UPDATE & DELETE Stored Procedures for Person table.

-------------------
--Create Procedure
-------------------
alter PROC PR_Insert_Person
	@PersonID int,
	@PersonName varchar(50),
	@Salary varchar(50),
	@JoiningDate datetime,
	@City varchar(100),
	@Age int,
	@BirthDate datetime
AS
BEGIN
Insert into Person(
	PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate
)
VALUES(
	@PersonID,
	@PersonName,
	@Salary,
	@JoiningDate,
	@City,	
	@Age,
	@BirthDate
)
END

INSERT INTO Person VALUES(61,'Dh234ruv',1000,'2022-04-22','Rajkot',20,'2003-04-22');

select * from PersonLog
--------------------
--Update Procedure
--------------------

alter PROC PR_Update_Person
	@PersonID int,
	@PersonName varchar(50),
	@Salary varchar(50),
	@JoiningDate datetime,
	@City varchar(100),	
	@Age int,
	@BirthDate datetime
AS
BEGIN
Update Person
Set
	PersonID=@PersonID,
	PersonName=@PersonName,
	Salary=@Salary,
	JoiningDate=@JoiningDate,
	City=@City,
	Age=@Age,
	BirthDate=@BirthDate
WHERE PersonID=@PersonID
END


-------------------
--Delete Procedure
-------------------

CREATE PROC PR_Delete_Person
@PersonID int
AS
BEGIN
Delete From Person
WHERE PersonID = @PersonID
END
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--2.
--Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that,
--create a new table PersonLog to log (enter) all operations performed on the Person table.
create TRIGGER TR_Q5
ON Person
FOR INSERT,UPDATE,DELETE
AS
BEGIN
	DECLARE 
		@PersonID int,
		@PersonName varchar(100),
		@operation varchar(6)

	
		IF exists(Select * from inserted)
			SET @operation = 'Insert'
		ELSE IF exists(Select * from deleted)
			SET @operation = 'Delete'
		ELSE IF exists(Select * from deleted) AND exists(Select * from inserted)
			SET @operation = 'Update'
		


	IF @operation = 'Insert'
		BEGIN
			Select @PersonID = PersonID, @PersonName = PersonName 
				FROM inserted 	
	END	

	ELSE
		BEGIN
			Select @PersonID = PersonID, @PersonName = PersonName 
				FROM deleted
		
		END
	
	
	INSERT INTO PersonLog
		values(
			@PersonID , @PersonName , @operation , getdate()
		)
		
END

--insert into Person 1,'Dhruv',20,'20220422','Rajkot',100,'20030422'
-----------------------------------------------------------------------------------------------
--4.
--Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints
--‘Record deleted successfully from PersonLog’.
create trigger TR_Q4
on PersonLog
FOR DELETE
AS
BEGIN
	PRINT 'Record deleted successfully from PersonLog'
END
-----------------------------------------------------------------------------------------------

