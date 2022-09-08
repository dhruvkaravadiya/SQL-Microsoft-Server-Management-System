create database Person_Info_New
--1.
--Print message like - Error Occur that is: Divide by zero error encountered
CREATE PROC PR_divide
	@a decimal,
	@b decimal,
	@c decimal output
AS
BEGIN
	BEGIN TRY
		SET @c = @a / @b;
	END TRY
	BEGIN CATCH
		print('Error Occur that is: Divide by zero encountered');
	END CATCH
END;

--true for TRY block
DECLARE @r decimal;
EXEC PR_divide 10, 2, @r output;
PRINT @r
--false for TRY block
DECLARE @r decimal;
EXEC PR_divide 10, 0, @r output;
PRINT @r
---------------------------------------------------------------------------------------------------
--2.
--print error message in insert statement using Error_Message () function: Conversion failed when 
--converting datetime from character string.

BEGIN
	BEGIN TRY
		DECLARE @conv_datetime varchar(100) = '10/16/2015 10;01:55'
		SELECT CONVERT(datetime , @conv_datetime , 5) as ConvertedDate
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE() as ErrorMessage;
	END CATCH
END

exec PR_DateTime_to_Character 1,'Dhruv','insert','2002-12-12'


-----------------------------------------------------------------------------------------------------------
--3.
--Create procedure which prints the error message that “The PLogID is already taken. Try another 
--one”
create PROC PR_PK_Taken
	@PLogID int , 
	@PersonName varchar(50)
AS
BEGIN
	BEGIN TRY
		INSERT INTO Person_Info
		VALUES(
			@PlogId,@PersonName,'Insert',Getdate()
		)
	END TRY
	BEGIN CATCH
		print('The PLogID is already taken. Try another one');
	END CATCH
END

insert into PersonLog values(2,'Dhruv' , 'insert','10/16/2015')
------------------------------------------------------------------------------------------------------------------------
--4.
--Create procedure that print the sum of two numbers: take both number as integer & handle 
--exception with all error functions if any one enters string value in numbers otherwise print result
CREATE PROC PR_ADD_EXCEPTION
	@a integer,
	@b integer,
	@c integer output
AS
BEGIN
	BEGIN TRY
		SET @c = @a + @b;
	END TRY
	BEGIN CATCH
		SELECT ERROR_STATE() as ErrorState,
				ERROR_SEVERITY() as ErrorSeverity,
				ERROR_LINE() as ErrorLine,
				ERROR_MESSAGE() as ErrorMessage,
				ERROR_PROCEDURE() as ErrorProcedure,
				ERROR_NUMBER() as ErrorNumber			
	END CATCH
END;

--true for TRY block
DECLARE @r integer;
EXEC  PR_ADD_EXCEPTION  10, 2, @r output;
PRINT @r

--false for TRY block
DECLARE @r integer;
EXEC PR_ADD_EXCEPTION 'dhruv', 5, @r output;
PRINT @r

----------------------------------------------------------------------------------------------------------
--5.
--Throw custom exception using stored procedure which accepts PLogID as input & that throws 
--Error like no plogid is available in database

CREATE PROC PR_Q5
	@PLogId int
AS
BEGIN
	BEGIN TRY
		IF exists(Select * from PersonLog where PlogId = @PLogId)
			print('Entered PlogId exists');
	END TRY
	BEGIN CATCH
		THROW(50000 , 'Error like no plogid is available in database' , );
	END  CATCH
END


-----------------------------------------------------------------------------------------
--6.
--Create cursor with name per_cursor which takes PLogID & PersonName as variable and produce 
--combine output with PLogID & Person Name.
DECLARE 
	@PLogId int,
	@PersonName varchar(250)
DECLARE Cr_Q51 CURSOR
FOR SELECT 
		PLogId,PersonName
	from 
		PersonLog
OPEN CR_Q51;
FETCH NEXT FROM CR_Q51 INTO
	@PLogId , @PersonName
	WHILE @@FETCH_STATUS = 0
		BEGIN 
			PRINT(CAST(@PLogId as varchar) + '-' + @PersonName);
			FETCH NEXT FROM CR_Q51 INTO
				@PLogId , @PersonNAME
		END
CLOSE CR_Q51
DEALLOCATE CR_Q51
			
-------------------------------------------------------------------------------------------------
--7.
--Use Table Student (Id, Rno, EnrollmentNo, Name, Branch, University) - Create cursor that updates 
--enrollment column as combination of branch & Roll No. like SOE22CE0001 and so on. (22 is 
--admission year)
insert into Student values (1,31,'1001','Dhruv','cse','Darshan')
declare 
	@EnrollmentNo varchar(20),
	@Branch varchar(50),
	@Rno int
DECLARE CR_Q7 CURSOR
FOR Select 
	Rno,
	EnrollmentNo,
	Branch
	from Student
OPEN CR_Q7
FETCH NEXT FROM CR_Q7 INTO
	@Branch , @Rno
	WHILE @@FETCH_STATUS = 0
		BEGIN
			Update Student 
				SET EnrollmentNo = 'SOE22' + @Branch + cast(@Rno as varchar) 
				WHERE EnrollmentNo = @EnrollmentNo
				FETCH NEXT FROM  CR_Q7 INTO
					@Branch , @Rno 
		END
CLOSE CR_Q7
DEALLOCATE CR_Q7





