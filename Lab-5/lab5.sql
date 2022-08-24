--1.
--Create INSERT, UPDATE & DELETE Stored Procedures for Person table.

-------------------
--Create Procedure
-------------------
alter PROC PR_Insert_Person
	@PersonID int,
	@PersonName varchar(50),
	@JoiningDate datetime,
	@City varchar(100),
	@Salary varchar(50),
	@BirthDate datetime
AS
BEGIN
Insert into Person(
	PersonID,PersonName,JoiningDate,City,Salary,BirthDate
)
VALUES(
	@PersonID,
	@PersonName,
	@JoiningDate,
	@City,
	@Salary,
	@BirthDate
)
END


--------------------
--Update Procedure
--------------------

CREATE PROC PR_Update_Person
	@PersonID int,
	@PersonName varchar(50),
	@JoiningDate datetime,
	@City varchar(100),
	@Salary varchar(50),
	@Age int,
	@BirthDate datetime
AS
BEGIN
Update Person
Set
	PersonID=@PersonID,
	PersonName=@PersonName,
	JoiningDate=@JoiningDate,
	City=@City,
	Salary=@Salary,
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
Create TRIGGER TR_Q2
ON Person
FOR INSERT,UPDATE,DELETE
AS
BEGIN
	DECLARE 
		@PersonID int,
		@operation varchar(6)

	SET @operation = CASE
		when exists(Select * from inserted)
			then 'Insert'
		when exists(Select * from deleted)
			then 'Delete'
		when exists(Select * from deleted) AND exists(Select * from inserted)
			then 'Update'
		else NULL
	END

	IF @operation = 'Insert'
		INSERT INTO PersonLog(
			PersonID,PersonName,Operation,UpdatedDate
		)
		Select @PersonID, inserted.PersonName , @operation , Getdate()
		FROM inserted
	IF @operation = 'Delete'
		INSERT INTO PersonLog(
			PersonID,PersonName,Operation,UpdatedDate
		)
		Select @PersonID , deleted.PersonName , @operation , Getdate()
		FROM deleted
	IF @operation = 'Update'
		INSERT INTO PersonLog(
			PersonID, PersonName , Operation , UpdatedDate
		)
		Select @PersonID , inserted.PersonName , @operation , Getdate()
		FROM inserted
END



--------------------------------------------------------------------------------------------------------
--2.
--Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that,
--create a new table PersonLog to log (enter) all operations performed on the Person table.
Create TRIGGER TR_Q2
ON Person
FOR INSERT,UPDATE,DELETE
AS
BEGIN
	DECLARE 
	
		@operation varchar(6)

	SET @operation = CASE
		when exists(Select * from inserted)
			then 'Insert'
		when exists(Select * from deleted)
			then 'Delete'
		when exists(Select * from deleted) AND exists(Select * from inserted)
			then 'Update'
		else NULL
	END

	IF @operation = 'Insert'
		INSERT INTO PersonLog(
			PersonID,PersonName,Operation,UpdatedDate
		)
		Select @PersonID, inserted.PersonName , @operation , Getdate()
		FROM inserted
	IF @operation = 'Delete'
		INSERT INTO PersonLog(
			PersonID,PersonName,Operation,UpdatedDate
		)
		Select @PersonID , deleted.PersonName , @operation , Getdate()
		FROM deleted
	IF @operation = 'Update'
		INSERT INTO PersonLog(
			PersonID, PersonName , Operation , UpdatedDate
		)
		Select @PersonID , inserted.PersonName , @operation , Getdate()
		FROM inserted
END


exec PR_Insert_Person 1,Dhruv,'20220422',Rajkot,100,'20030422'
