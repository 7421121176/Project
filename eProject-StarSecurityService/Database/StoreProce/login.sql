USE [StarSecurityDB]
GO
/****** Object:  StoredProcedure [dbo].[login_form]    Script Date: 04/26/2014 09:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[login_form]
@EmployeeID nvarchar(15) ,--coi lai kieu du kieu
@Password nvarchar(200)   --pass 200 tro len
as
select * from dbo.tb_Employee where EmployeeID = @EmployeeID and  Password= @Password
