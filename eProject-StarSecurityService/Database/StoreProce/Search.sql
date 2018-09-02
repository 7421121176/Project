use StarSecurityDB
/*..................................*/

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SearchCustomer]
      @CustomerName NVARCHAR(30)
AS
BEGIN
      SET NOCOUNT ON;
    BEGIN
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
	  WHERE cs.TitleID=t.TitleID and cs.CityID=c.CityID and CustomerName LIKE '%'+@CustomerName+'%'
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
	  WHERE cs.TitleID=t.TitleID and cs.CityID=c.CityID and CustomerName LIKE '%'+@CustomerName+'%'
END

/*..................................*/	

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[SearchEmployee]
      @Fullname NVARCHAR(30)
AS
BEGIN
      SET NOCOUNT ON;
    BEGIN
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
           ,[EduQual]
           ,e.[EduQualID]
           ,[Achievements]
           ,[Role]
           ,r.[RoleID]
      FROM tb_Employee e,tb_Title t, tb_City c, tb_EduQual ed,tb_Role r 
		WHERE e.TitleID=t.TitleID and e.CityID=c.CityID and e.EduQualID=ed.EduQualID and e.RoleID=r.RoleID and Fullname LIKE '%'+@Fullname+'%'
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
           ,[EduQual]
           ,e.[EduQualID]
           ,[Achievements]
           ,[Role]
           ,r.[RoleID]
      FROM tb_Employee e,tb_Title t, tb_City c, tb_EduQual ed,tb_Role r 
		WHERE e.TitleID=t.TitleID and e.CityID=c.CityID and e.EduQualID=ed.EduQualID and e.RoleID=r.RoleID and Fullname LIKE '%'+@Fullname+'%'
END

/*..................................*/

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[SearchService]
      @ServiceName NVARCHAR(100)
AS
BEGIN
      SET NOCOUNT ON;
    BEGIN
           SELECT [ServiceID]
           ,[FunctionName]
           ,f.[FunctionID]
           ,[ServiceName]
           ,[Information]
           ,[Price]
           ,[PhotoPath]
			FROM tb_Service s, tb_Function f
				WHERE s.FunctionID=f.FunctionID and ServiceName LIKE '%'+@ServiceName+'%'
    END   
    
    SELECT [ServiceID]
           ,[FunctionName]
           ,f.[FunctionID]
           ,[ServiceName]
           ,[Information]
           ,[Price]
           ,[PhotoPath]
      FROM tb_Service s, tb_Function f
		WHERE s.FunctionID=f.FunctionID and ServiceName LIKE '%'+@ServiceName+'%'
END

/*..................................*/	

	