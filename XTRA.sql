CREATE PROC PR_Insert_Student
	@Rno int,
	@Name varchar(250),
	@Branch varchar(50),
	@Semester int,
	@CPI int
AS
BEGIN
INSERT INTO Student(Rno,Name,Branch,Semester,CPI)
VALUES (@Rno,@Name,@Branch,@Semester,@CPI)
END
--truncate table Student
--Select * from Student
EXEC PR_Insert_Student 101,'Ramesh','CE',3,9;
EXEC PR_Insert_Student 102,'Mahesh','EC',3,8;
EXEC PR_Insert_Student 103,'Suresh','ME',4,7;
EXEC PR_Insert_Student 104,'Amit','EE',4,8;
EXEC PR_Insert_Student 106,'Anita','CE',3,8;
EXEC PR_Insert_Student 107,'Reeta','ME',3,7;
EXEC PR_Insert_Student 108,'Rohit','EE',3,9;
EXEC PR_Insert_Student 109,'Chetan','CE',3,8;
EXEC PR_Insert_Student 110,'Rakesh','CE',4,9;
 
alter TRIGGER TR_Update_Student
on Student
FOR UPDATE
AS 
BEGIN
	DECLARE @Rno int
	Select @Rno = Rno from inserted
	INSERT INTO LogTable
	VALUES('Record UPDATED on   ' + GETDATE() );
END


create TRIGGER TR_Insert_Student
on Student
for INSERT
AS 
BEGIN
	DECLARE @Rno int 
	Select @Rno = @Rno from inserted 
	Insert into LogTable
	VALUES('Record INSERTED on   '+getdate());
END 



ALTER TRIGGER TR_Delete_Student
on Student
for DELETE
AS 
BEGIN
	DECLARE @Rno int 
	Select @Rno = @Rno from inserted 
	Insert into LogTable
	VALUES(@Rno+' ROLL NO '+'Record INSERTED on   '+getdate());
END 
