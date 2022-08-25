create trigger TR_Insert
on Person
FOR Insert
AS
BEGIN
	SELECT * FROM inserted
END
exec PR_Person_Insert ' Rahul', 'Anshu' ,56000, '1990-01-01' ,1, 12
exec PR_Person_Insert 'Hardik','Hinsu' ,18000, '1990-09-25' ,2, 11
exec PR_Person_Insert 'Bhavin','Kamani', 25000, '1991-05-14', NULL, 11
exec PR_Person_Insert 'Bhoomi' ,'Patel', 39000, '2014-02-20', 1, 13
exec PR_Person_Insert 'Rohit', 'Rajgor', 17000, '1990-07-23', 2 ,15
exec PR_Person_Insert 'Priya' ,'Mehta',25000 ,'1990-10-18', 2 ,NULL
exec PR_Person_Insert 'Neha','Trivedi' ,18000 ,'2014-02-20' ,3 ,15



--------------------------------------------------------

create trigger TR_Update
on Person
FOR Update
AS
BEGIN
	SELECT * FROM inserted
END

exec PR_Person_Update 
--------------------------------------------
create trigger TR_Delete
on Person
FOR Insert
AS
BEGIN
	SELECT * FROM deleted
END

exec PR_Person_Delete 21
-----------------------------------------------------
CREATE Trigger TR_INS_MSG_LOG
ON Department
for insert
as 
begin
	declare @DepartmentID int
	select @DepartmentID = DepartmentID from inserted 
	insert into MSG
	VALUES('Record inserted with DeptID : '+CAST(@DepartmentID as varchar)+' is inserted on '+cast(GETDATE() as varchar(50)))
END

insert into Department values(6,'AA')
