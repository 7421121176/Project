use StarSecurityDB
/*..................................*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[DeleteCustomer]
      @CustomerID NVARCHAR(50)
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Customer WHERE CustomerID = @CustomerID)
    BEGIN
            DELETE FROM [tb_Customer]
            WHERE CustomerID = @CustomerID
    END
   
    SELECT [CustomerID]
           ,[CustomerName]
           ,[CompanyName]
           ,[Title]
           ,t.[TitleID]
           ,[Address]
           ,[City]
           ,c.[CityID]
           ,[Phone]
           ,[Gender]
      FROM tb_Customer cs, tb_Title t, tb_City c
	  WHERE cs.TitleID=t.TitleID and cs.CityID=c.CityID          
END

/*..................................*/	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[DeleteEmployee]
      @EmployeeID NVARCHAR(15)
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Employee WHERE EmployeeID = @EmployeeID)
    BEGIN
            DELETE FROM [tb_Employee]
            WHERE EmployeeID = @EmployeeID
    END
   
   SELECT [EmployeeID]
           ,[Fullname]
           ,[Title]
           ,t.[TitleID]
           ,[Gender]
           ,[Address]
           ,[City]
           ,c.[CityID]
           ,[BirthDate]
           ,[HireDate]
           ,[Phone]
		   ,[Email]
           ,[EduQual]
           ,e.[EduQualID]
           ,[Achievements]
           ,[Role]
           ,r.[RoleID]
      FROM tb_Employee e,tb_Title t, tb_City c, tb_EduQual ed,tb_Role r 
		WHERE e.TitleID=t.TitleID and e.CityID=c.CityID and e.EduQualID=ed.EduQualID and e.RoleID=r.RoleID    
END

/*..................................*/	

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[DeleteService]
      @ServiceID int
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Service WHERE ServiceID = @ServiceID)
    BEGIN
            DELETE FROM [tb_Service]
            WHERE ServiceID = @ServiceID
    END
   
    SELECT [ServiceID]
           ,[FunctionName]
           ,f.[FunctionID]
           ,[ServiceName]
           ,[Information]
           ,[Price]
           ,[PhotoPath]
      FROM tb_Service s, tb_Function f
		WHERE s.FunctionID=f.FunctionID    
END

/*..................................*/	

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[DeleteOder]
      @OrderID int
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Order WHERE OrderID = @OrderID)
    BEGIN
            DELETE FROM [tb_Order]
            WHERE OrderID = @OrderID
    END
   
    SELECT [OrderID]
		   ,[CustomerName]
		   ,c.[CustomerID]
		   ,[EmployeeID]
           ,[Sum]
		   ,[Date]
      FROM tb_Order o, tb_Customer c
		  WHERE o.CustomerID = c.CustomerID
END

/*..................................*/	

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[DeleteOderDetails]
      @OrderDetailID int,
	  @OrderID int
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_OrderDetail WHERE OrderDetailID = @OrderDetailID)
    BEGIN
            DELETE FROM [tb_OrderDetail]
            WHERE OrderDetailID = @OrderDetailID
    END     
        
   
    DECLARE @money2 int
	DECLARE @Sum int
	SELECT @money2 = sum(Total) from tb_OrderDetail where [OrderID]=@OrderID;
	SET @Sum=@money2
	UPDATE [tb_Order]
		 SET [Sum] = @Sum
           WHERE OrderID = @OrderID

	SELECT [OrderDetailID]
		   ,[OrderID]
           ,[ServiceName]
           ,s.[ServiceID]
		   ,[Quantity]
		   ,[Total]
		   ,[StartDate]
           ,[ExpirationDate]
      FROM tb_OrderDetail o, tb_Service s
		WHERE o.ServiceID=s.ServiceID and OrderID=@OrderID   
END
