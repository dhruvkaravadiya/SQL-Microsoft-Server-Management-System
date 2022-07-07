--sp_rename 'MST_State.State_ID','StateID','column';
--1. Procedure to Select All CityID,CityName,PinCode,StateID,City_Remarks,StateName,

create PROC PR_Select_All
	
AS
Begin

Select *from MST_City Inner Join MST_State

	ON 
	MST_City.StateID = MST_State.StateID
END


----------------------------------------------------------------------
--2. Insert
create proc PR_InsertValuesinMST_City1
	@CityID int,
	@CityName varchar(250),
	@PinCode varchar(6),
	@StateID int,
	@CityRemarks varchar(500)
	
as
begin 
Insert into MST_City(
	CityID,
	CityName,
	PinCode,
	StateID,
	CityRemarks
)

values(
	@CityID ,
	@CityName ,
	@PinCode ,
	@StateID ,
	@CityRemarks 	
)

END

PR_InsertValuesinMST_City1 5,'Mumbai','555555',3,'Crowded';
------------------------------------------------------------------
--3.Update
create proc PR_UpdateAllValues
	@CityID int,
	@CityName varchar(250),
	@PinCode varchar(6),
	@StateID int,
	@CityRemarks varchar(500)
	
as
begin 
Update MST_City
set	
	CityID = @CityID,
	CityName = @CityName,
	PinCode = @PinCode,
	StateID = @StateID,
	CityRemarks = @CityRemarks
where 
 CityID = @CityID;
END


------------------------------------------------------------------
--4. Delete
create proc PR_DeleteValues3
	@CityID int
		
as
begin
 
Delete from MST_City
where
	CityID = @CityID
		
end
------------------------------------------------------------------
--5.SelectbyPK
create proc PR_SelectByPk
	@CityID int
		
as
begin
 
Select * from MST_City
where
	CityID = @CityID
	
END
----------------------------------------------------------------------------
--PR_SelectBy_PinCode-StartsWith_360
create proc PR_SelectBy_PinCode_StartsWith_360
	@PinCode varchar(6)
	
as
begin 
Select * from MST_City

where PinCode like '360%'

END
PR_SelectBy_PinCode_StartsWith_360 360005

-------------------------------------------------------------------------
create proc PR_SelectBy_PinCode_CityName
	@PinCode varchar(6),
	@CityName varchar(250)
	
as
begin 
Select * from MST_City

where PinCode = @PinCode
	  and
	  CityName = @CityName 

END
-------------------------------------------------------------------------
create proc PR_SelectBy_CityRemarks
	@CityRemarks varchar(500)
	
as
begin 
Select * from MST_City

where CityRemarks = @CityRemarks

END
------------------------------------------------------------------------
create proc PR_SelectBy_StateID
	@StateID int
	
as
begin 
Select * from MST_City

where StateID = @StateID

END
----------------------------------------------------------------------

create proc PR_SelectBy_StateID_CityID
	@StateID int,
	@CityID INT
	
as
begin 
Select * from MST_City

where StateID = @StateID 
	  AND
	  CityID = 	@CityID

END
