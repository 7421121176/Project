<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=student.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=student.jsp");
    } else {%>
<%@page import="beans.BStudent"%>
<%@page import="java.util.Collection"%>
<!DOCTYPE html>
<%@page import="org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>KINGSTONE ACADEMIC - Student Manage</title>
        <script>
            function confirmGo(m, u) {
                if (confirm(m)) {
                    window.location = u;
                }
            }
        </script>
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <jsp:include page="header.jsp"/>
            <!--header end-->
            <%
                BStudent ojb = new BStudent();
                Collection kq = ojb.getAllstudentjoinlist();
                request.setAttribute("student", kq);
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> Student Manage </h3>


                    <div class="row mt">
                        <div class="col-md-12">
                            <div class="content-panel">
                                <table class="table table-striped table-advance table-hover">
                                    <form action="studentA.jsp">
                                        <button class="btn btn-success btn-xs"><i class="fa fa-angle-right" class="fa fa-check"></i> Add new</button>
                                    </form>
                                    <thead>
                                        <tr>
                                            <th><i class="fa fa-bullhorn"></i> Roll Number</th>
                                            <th><i class="fa fa-bullhorn"></i> Name</th>
                                            <th class="hidden-phone"><i class="fa fa-question-circle"></i> Address</th>
                                            <th><i class="fa fa-bookmark"></i> Email</th>
                                            <th><i class="fa fa-bookmark"></i> Birthday</th>
                                            <th><i class=" fa fa-edit"></i> Phone</th>
                                            <th><i class="fa fa-bookmark"></i> Gender</th>
                                            <th><i class="fa fa-edit"></i> Branch</th>
                                            <th><i class="fa fa-edit"></i> Curriculum</th>
                                        </tr>
                                    </thead>
                                    <br/><br/><form name="myForm" action="../CStudent" method="post">                                        
                                        Enter Roll Number: <input type="text" name="txtsearch" value="" /> 
                                        <input  type="submit" name="btn" value="Search">
                                        <tbody>
                                           

                                    </form>
                                    <hr>

                                    <c:if test="${empty param.Id}"> 

                                        <tbody>
                                            <c:set var="count" value="0"/>
                                            <pg:paging pageSize="10" url="student.jsp"> 
                                                <c:forEach var="row" items="${student}">
                                                    <pg:item> 
                                                        <tr>
                                                            <td><c:out value="${row.stu_RollNo}"/></td> 
                                                            <td><c:out value="${row.stu_Name}"/></td> 
                                                            <td><c:out value="${row.stu_Address}"/></td> 
                                                            <td><c:out value="${row.stu_Email}"/></td> 
                                                            <td><c:out value="${row.stu_Birth}"/></td> 
                                                            <td><c:out value="${row.stu_Phone}"/></td> 
                                                            <c:if test="${row.stu_Gender =='1'}">
                                                                <td><c:out value="Male"/></td> 
                                                            </c:if>
                                                            <c:if test="${row.stu_Gender =='0'}">
                                                                <td><c:out value="Female"/></td> 
                                                            </c:if>   
                                                            <td><c:out value="${row.bra_Name}"/></td>
                                                            <td><c:out value="${row.cla_Name}"/></td>

                                                            <c:url var="edit" value="../CStudent">
                                                                <c:param name="btn" value="Edit" />
                                                                <c:param name="estudentRoll" value="${row.stu_RollNo}" />
                                                                <c:param name="estudentname" value="${row.stu_Name}" />
                                                                <c:param name="estudentaddress" value="${row.stu_Address}" />
                                                                <c:param name="estudentemail" value="${row.stu_Email}" />
                                                                <c:param name="estudentbirth" value="${row.stu_Birth}" />
                                                                <c:param name="estudentphoneno" value="${row.stu_Phone}" />
                                                                <c:param name="estudentgend" value="${row.stu_Gender}" />
                                                                <c:param name="estubranchid" value="${row.bra_Id}" />
                                                                <c:param name="estuclassid" value="${row.cla_Id}" />
                                                                <c:param name="p" value="${param.pageNum}"/> 
                                                            </c:url> 
                                                            <c:url var="delete" value="../CStudent">
                                                                <c:param name="btn" value="Delete" />
                                                                <c:param name="sturollno" value="${row.stu_RollNo}" />                                                
                                                                <c:param name="p" value="${param.pageNum}"/> 
                                                            </c:url>
                                                            <td>
                                                                <a href="${edit}" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                                                                <a href="${delete}" onclick="return confirmGo('Do you really want to delete this records ?')" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></a>
                                                            </td>
                                                        </tr>
                                                    </pg:item> 
                                                </c:forEach>
                                                <pg:index>
                                                <ul class="controls-buttons">


                                                    <li><pg:page><b><%=thisPage%></b></pg:page></li>
                                                    <li><pg:firstPage><img src="images/icons/fugue/navigation-180.png" width="16" height="16"><b> [  Previous   ]</pg:firstPage></li>
                                                    <li><pg:lastPage>[  Next  ] <img src="images/icons/fugue/navigation.png" width="16" height="16"></pg:lastPage></li>

                                                    </ul>

                                            </pg:index> 

                                        </pg:paging> 		

                                    </c:if>
                                    </tbody>
                                </table>
                            </div><!-- /content-panel -->
                        </div><!-- /col-md-12 -->
                    </div><!-- /row -->

                </section><! --/wrapper -->
            </section>

            <!--main content end-->
            <!--footer start-->
            <jsp:include page="footer.jsp"/>
            <!--footer end-->
        </section>



    </body>
</html>
<%}%>