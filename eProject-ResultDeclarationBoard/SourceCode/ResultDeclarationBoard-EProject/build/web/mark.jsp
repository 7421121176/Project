
<!DOCTYPE html>
<!--
Template Name: Fertile
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Result Declaration Board</title>
        <meta charset="utf-8">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <link rel="stylesheet" href="layout/styles/main.css">  
        <script type="text/javascript" src="layout/scripts/jquery.min.js"></script>

        <!-- s3slider -->
    </head>
    <body id="top">
        <!-- SITE CONTENT -->
        <jsp:include page="Header.jsp"/>
        <%
            String stuno = "";
            stuno = session.getAttribute("kaka").toString();
        %>
        <div class="wrapper row2 bgded" style="background-image:url('images/demo/backgrounds/header_2.jpg');">
            <div id="pageintro"> 
                <!-- ################################################################################################ -->
            </div>
        </div>
        <div class="wrapper row3">
            <main class="container clear"> 
                <h3 class="title">Exam <strong>Result</strong></h3>
                <table >
                    <thead>
                        <tr>
                            <th>Roll.No</th>
                            <th>Student</th>
                            <th>Birth </th>
                            <th>Gender</th>
                            <th>Class</th>            
                            <th>Mark</th>                            
                            <th>Faculty</th>    
                            <th>Status</th>          
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${search}">
                        <pg:item> 
                            <tr>
                                <td><c:out value="${row.stu_RollNo}" /></td>
                                <td><c:out value="${row.stu_Name}" /></td>
                                <td><c:out value="${row.stu_Birth}" /></td>
                                <c:if test="${row.stu_Gender == '1'}">
                                    <td><c:out value="Male"/></td> 
                                </c:if>
                                <c:if test="${row.stu_Gender == '0'}">
                                    <td><c:out value="Female"/></td> 
                                </c:if>                                    
                                <td><c:out value="${row.cla_Id}" /></td>
                                <td><c:out value="${row.mark}" /></td>
                                <c:if test="${row.mark < 40}">
                                    <td><c:out value="F"/></td> 
                                </c:if>    
                                <c:if test="${row.mark < 50 and row.mark >= 40}">
                                    <td><c:out value="D"/></td> 
                                </c:if>
                                <c:if test="${row.mark < 60 and row.mark >= 50}">
                                    <td><c:out value="D+"/></td> 
                                </c:if>
                                <c:if test="${row.mark < 70 and row.mark >= 60}">
                                    <td><c:out value="C"/></td> 
                                </c:if>
                                <c:if test="${row.mark < 80 and row.mark >= 70}">
                                    <td><c:out value="C+"/></td> 
                                </c:if>
                                <c:if test="${row.mark < 85 and row.mark >= 80}">
                                    <td><c:out value="B"/></td> 
                                </c:if>
                                <c:if test="${row.mark < 90 and row.mark >= 85}">
                                    <td><c:out value="B+"/></td> 
                                </c:if>
                                <c:if test="${row.mark >= 90}">
                                    <td><c:out value="A"/></td> 
                                </c:if>
                                <c:if test="${row.mark < 40}">
                                    <td><c:out value="Fail"/></td> 
                                </c:if>
                                <c:if test="${row.mark >= 40}">
                                    <td><c:out value="Pass"/></td> 
                                </c:if>
                            </tr>
                        </pg:item> 
                    </c:forEach>  
                    </tbody>
                </table>
                <!-- ################################################################################################ -->
                <!-- / container body -->
                <div class="clear"></div>
            </main>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <jsp:include page="Footer.jsp"/>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
        <script src="layout/scripts/jquery.min.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>

    </body>
</html>