use StarSecurityDB
/*..................................*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[AddUpdateCustomer]
      @CustomerID NVARCHAR(50),
      @CustomerName NVARCHAR(30),
      @CompanyName NVARCHAR(40),
      @TitleID INT,
      @Address NVARCHAR(60),
      @CityID INT,
      @Phone NVARCHAR(24),
      @Gender BIT
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Customer WHERE CustomerID = @CustomerID)
    BEGIN
            UPDATE [tb_Customer]
            SET [CustomerName] = @CustomerName
               ,[CompanyName] = @CompanyName
               ,[TitleID] = @TitleID
               ,[Address] = @Address
               ,[CityID] = @CityID
               ,[Phone] = @Phone
               ,[Gender] = @Gender
            WHERE CustomerID = @CustomerID
    END
    ELSE
    BEGIN
            INSERT INTO [tb_Customer]
           ([CustomerID]
           ,[CustomerName]
           ,[CompanyName]
           ,[TitleID]
           ,[Address]
           ,[CityID]
           ,[Phone]
           ,[Gender])
        VALUES
           (@CustomerID
           ,@CustomerName
           ,@CompanyName
           ,@TitleID
           ,@Address
           ,@CityID
           ,@Phone
           ,@Gender)
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
alter PROCEDURE [dbo].[AddUpdateEmployee]
      @EmployeeID NVARCHAR(15),
      @Fullname NVARCHAR(30),
      @TitleID INT,
      @Gender BIT,
      @Address NVARCHAR(60),
      @CityID INT,
	  @BirthDate datetime,
	  @HireDate datetime,
      @Phone NVARCHAR(15),
	  @EduQualID int,
	  @Achievements nvarchar(50),
	  @RoleID int,
	  @Email nvarchar(50)
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Employee WHERE EmployeeID = @EmployeeID)
    BEGIN
            UPDATE [tb_Employee]
            SET [Fullname] = @Fullname
               ,[TitleID] = @TitleID
               ,[Gender] = @Gender
               ,[Address] = @Address
               ,[CityID] = @CityID
			   ,[BirthDate] = @BirthDate
               ,[Phone] = @Phone
               ,[EduQualID] = @EduQualID
               ,[Achievements] = @Achievements
               ,[RoleID] = @RoleID
			   ,[Email] = @Email
				WHERE EmployeeID = @EmployeeID
    END
    ELSE
    BEGIN
            INSERT INTO tb_Employee
           ([EmployeeID]
           ,[Fullname]
           ,[TitleID]
           ,[Gender]
           ,[Address]
           ,[CityID]
           ,[BirthDate]
           ,[HireDate]
           ,[Phone]
           ,[EduQualID]
           ,[Achievements]
           ,[RoleID]
		   ,[Email])
        VALUES
           (@EmployeeID
           ,@Fullname
           ,@TitleID
           ,@Gender
           ,@Address
           ,@CityID
           ,@BirthDate
           ,@HireDate
           ,@Phone
           ,@EduQualID
           ,@Achievements
           ,@RoleID
		   ,@Email)
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
alter PROCEDURE [dbo].[AddUpdateService]
      @ServiceID INT,
      @FunctionID INT,
      @ServiceName NVARCHAR(100),
      @Information NVARCHAR(Max),
      @Price MONEY,
      @PhotoPath NVARCHAR(255)
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Service WHERE ServiceID = @ServiceID)
    BEGIN
            UPDATE [tb_Service]
            SET [FunctionID] = @FunctionID
               ,[ServiceName] = @ServiceName
               ,[Information] = @Information
               ,[Price] = @Price
               ,[PhotoPath] = @PhotoPath
            WHERE ServiceID = @ServiceID
    END
    ELSE
    BEGIN
            INSERT INTO [tb_Service]
           ([FunctionID]
           ,[ServiceName]
           ,[Information]
           ,[Price]
           ,[PhotoPath])
        VALUES
           (@FunctionID
           ,@ServiceName
           ,@Information
           ,@Price
           ,@PhotoPath)
    END
   
    SELECT [ServiceID]
           ,[FunctionName]
           ,f.[FunctionID]
           ,[ServiceName]
           ,[Information]
           ,[Price]
           ,[PhotoPath]
           ,[PhotoPath]
      FROM tb_Service s, tb_Function f
		WHERE s.FunctionID=f.FunctionID        
END

/*..................................*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[AddUpdateVacancies]
      @VacancyID INT,
      @Quantity SMALLINT,
      @ExprirationDate DATETIME,
      @Description NVARCHAR(50),
	  @EduQualID INT,
      @Salary MONEY,
      @TitleID INT
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Vacancies WHERE VacancyID = @VacancyID)
    BEGIN
            UPDATE [tb_Vacancies]
            SET [Quantity] = @Quantity
               ,[ExprirationDate] = @ExprirationDate
               ,[Description] = @Description
               ,[EduQualID] = @EduQualID
               ,[Salary] = @Salary
               ,[TitleID] = @TitleID
            WHERE VacancyID = @VacancyID
    END
    ELSE
    BEGIN
            INSERT INTO [tb_Vacancies]
           ([Quantity]
           ,[ExprirationDate]
           ,[Description]
           ,[EduQualID]
           ,[Salary]
		   ,[TitleID])
        VALUES
           (@Quantity
           ,@ExprirationDate
           ,@Description
           ,@EduQualID
		   ,@Salary
           ,@TitleID)
    END
   
    SELECT [VacancyID]
           ,[Quantity]
           ,[ExprirationDate]
           ,[Description]
		   ,[EduQual]
           ,e.[EduQualID]
           ,[Salary]
		   ,[Title]
		   ,t.[TitleID]
      FROM tb_Vacancies v, tb_EduQual e, tb_Title t
		WHERE v.EduQualID=e.EduQualID and v.TitleID=t.TitleID        
END

/*..................................*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AddRegisVacancies]
      @VacancyID INT,
      @Fullname NVARCHAR(30),
	  @TitleID INT,
      @Gender BIT,
      @Address NVARCHAR(60),
	  @CityID INT,
	  @BirthDate datetime,
      @Phone NVARCHAR(15),
	  @EduQualID int,
	  @Achievements nvarchar(50),
	  @Email nvarchar(50)
AS
BEGIN
      SET NOCOUNT ON;
    BEGIN
            INSERT INTO tb_RegisVacancies
           ([VacancyID]
           ,[Fullname]
		   ,[TitleID]
           ,[Gender]
           ,[Address]
           ,[CityID]
           ,[BirthDate]
           ,[Phone]
           ,[EduQualID]
           ,[Achievements]
           ,[Email])
        VALUES
           (@VacancyID
           ,@Fullname
		   ,@TitleID
           ,@Gender
           ,@Address
           ,@CityID
           ,@BirthDate
           ,@Phone
           ,@EduQualID
           ,@Achievements
           ,@Email)
    END
   
    SELECT [VacancyID]
           ,[Quantity]
           ,[ExprirationDate]
           ,[Description]
           ,[EduQual]
           ,e.[EduQualID]
           ,[Salary]
		   ,[Title]
		   ,t.[TitleID]
      FROM tb_Vacancies v, tb_EduQual e, tb_Title t
		WHERE v.EduQualID=e.EduQualID and v.TitleID=t.TitleID
END

/*..................................*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[EditRegisVacancies]
      @RegisID INT
AS
BEGIN
      SET NOCOUNT ON;
    BEGIN
            UPDATE [tb_RegisVacancies]
            SET [Pass] = 'True'
            WHERE RegisID = @RegisID
    END
   
    SELECT [RegisID]
           ,[VacancyID]
           ,[Fullname]
		   ,[TitleID]
           ,[Gender]
           ,[Address]
           ,[CityID]
           ,[BirthDate]
           ,[Phone]
           ,[EduQualID]
           ,[Achievements]
           ,[Email]
      FROM tb_RegisVacancies 
END

/*..................................*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[AddUpdateContact]
	  @ContactID int,
      @Fullname NVARCHAR(30),
	  @Email nvarchar(50),
	  @Time datetime,
      @Comment NVARCHAR(MAX)
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Contact WHERE ContactID = @ContactID)
    BEGIN
            UPDATE [tb_Contact]
            SET Status =  'True'
            WHERE ContactID = @ContactID
    END
    ELSE
    BEGIN
            INSERT INTO tb_Contact
           ([Fullname]
		   ,[Email]
           ,[Time]
           ,[Comment])
        VALUES
           (@Fullname
           ,@Email
           ,@Time
           ,@Comment)
    END  

	SELECT [ContactID]
		   ,[Fullname]
		   ,[Email]
           ,[Time]
           ,[Comment]
		   ,[Status]
      FROM tb_Contact   
	  ORDER BY
		[Status] ASC        
END

/*..................................*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[AddOrder]
	  @CustomerID nvarchar(5),
      @EmployeeID NVARCHAR(15),
	  @Date datetime
AS
BEGIN
      SET NOCOUNT ON;
    BEGIN
            INSERT INTO tb_Order
           ([CustomerID]
		   ,[EmployeeID]
		   ,[Date])
        VALUES
           (@CustomerID
           ,@EmployeeID
		   ,@Date)
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
alter PROCEDURE [dbo].[AddUpdateOderDetails]
	  @OrderDetailID int,
	  @OrderID int,
	  @ServiceID int,
      @Quantity smallint,
	  @StartDate datetime,
	  @ExpirationDate datetime
AS
BEGIN
	DECLARE @Total int
	DECLARE @money int
	SELECT @money = Price from tb_Service where ServiceID = @ServiceID
	SET @Total = @money * @Quantity
          SET NOCOUNT ON;
	IF EXISTS(SELECT * FROM tb_OrderDetail WHERE OrderDetailID = @OrderDetailID)
    BEGIN
            UPDATE [tb_OrderDetail]
            SET [Quantity] = @Quantity
				,[Total] =  @Total
				,[StartDate] = @StartDate
				,[ExpirationDate] = @ExpirationDate
            WHERE OrderDetailID = @OrderDetailID
    END
    ELSE
    BEGIN
            INSERT INTO tb_OrderDetail
           ([OrderID]
           ,[ServiceID]
		   ,[Quantity]
		   ,[Total]
		   ,[StartDate]
           ,[ExpirationDate])
        VALUES
           (@OrderID
           ,@ServiceID
		   ,@Quantity
		   ,@Total
		   ,@StartDate
           ,@ExpirationDate)
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

/*..................................*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[UpdateRegion]
	  @RegionID int,
	  @Address nvarchar(50),
      @Details nvarchar(50),
	  @Person nvarchar(50)
AS
BEGIN
      SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM tb_Region WHERE RegionID = @RegionID)
    BEGIN
            UPDATE [tb_Region]
            SET [Address] = @Address
				,[Details] = @Details
				,[Person] = @Person
            WHERE RegionID = @RegionID
    END  
END