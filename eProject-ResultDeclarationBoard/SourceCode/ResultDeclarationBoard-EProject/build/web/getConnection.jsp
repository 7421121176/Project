<%-- 
    Document   : getConnection
    Created on : Mar 2, 2015, 8:43:18 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" 
                           url="jdbc:sqlserver://localhost;user=sa;password=sa123456;database=ResultDeclarationBoardDB;" user="sa" 
                           password="sa123456" var="conn" scope="session"/> 
    </body>
</html>
