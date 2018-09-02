<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=course_registration.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=course_registration.jsp");
    } else {%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BStudent"%>
<%@page import="org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Student_Subject Manage - Add Student</title>

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
        <%
            BStudent ojb = new BStudent();
            Collection kq = ojb.getAllstudentlist();
            request.setAttribute("student", kq);
        %>
        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <jsp:include page="header.jsp"/>
            <!--header end-->
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i><a href="substu.jsp"> COURSE REGISTRATION </a></h3>

                    <form class="form-horizontal style-form" action="../CSubject" method="post">
                        <div class="row mt">
                            <div class="col-md-12">
                                <div class="content-panel">
                                    <table class="table table-striped table-advance table-hover">
                                        <label class="col-sm-2 col-sm-2 control-label">Student</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="student">
                                                <c:forEach var="row" items="${student}"> 
                                                    <option value="${row.stu_RollNo}"><c:out value="${row.stu_RollNo}"/> - <c:out value="${row.stu_Name}"/></option>
                                                </c:forEach>
                                            </select>                                  
                                        </div>
                                        <br/><br/>
                                        <input type="submit" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal" name="btn" value="Register" />
                                    </table>

                                </div><!-- /content-panel -->
                            </div><!-- /col-md-12 -->
                        </div><!-- /row -->
                    </form>
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
