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
alter PROC PR_DateTime_to_Character
	@PLogId int,
	@PersonName varchar(250),
	@Operation varchar(50),
	@UpdatedDate datetime
AS
BEGIN
	BEGIN TRY
		INSERT INTO Person_Info(
			PlogId , PersonName , Operation , UpdatedDate
		)
		VALUES(
			@PlogId,@PersonName,@Operation,@UpdatedDate
		)
	END TRY
	BEGIN CATCH
		print ERROR_MESSAGE() 
	END CATCH
END

exec PR_DateTime_to_Character 1,'Dhruv','insert','2002-12-12'


-----------------------------------------------------------------------------------------------------------
--3.
--Create procedure which prints the error message that “The PLogID is already taken. Try another 
--one”
alter PROC PR_PK_Taken
	@PLogId int,
	@PersonName varchar(250),
	@Operation varchar(50),
	@UpdatedDate datetime
AS
BEGIN
	BEGIN TRY
		INSERT INTO Person_Info(
			PlogId , PersonName , Operation , UpdatedDate
		)
		VALUES(
			@PlogId,@PersonName,@Operation,@UpdatedDate
		)
	END TRY
	BEGIN CATCH
		print ERROR_MESSAGE() 
	END CATCH
END
------------------------------------------------------------------------------------------------------------------------
--4.
--Create procedure that print the sum of two numbers: take both number as integer & handle 
--exception with all error functions if any one enters string value in numbers otherwise print result
