<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=substu.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=substu.jsp");
    } else {%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Subject - Student Manage</title>

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
            <%
                String subid = "";
                subid = session.getAttribute("jaja").toString();

            %>
            <!--header end-->
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i><a href="subject.jsp"> Subject Manage </a></h3>

                    <form action="" method="POST">
                        <div class="row mt">
                            <div class="col-md-12">
                                <div class="content-panel">
                                    <table class="table table-striped table-advance table-hover">           
                                        <form action="">
                                           
                                        </form>
                                        <form action="course_registration.jsp">
                                            <button class="btn btn-success btn-xs"><i class="fa fa-angle-right" class="fa fa-check"></i> Add Student</button>
                                        </form>
                                        <form action="course_registration_class.jsp">
                                            <button class="btn btn-success btn-xs"><i class="fa fa-angle-right" class="fa fa-check"></i> Add Class</button>
                                        </form>
                                        <hr>
                                        <thead>
                                            <tr>
                                                <th><i class="fa fa-bullhorn"></i> Roll No</th>
                                                <th><i class="fa fa-bullhorn"></i> Name</th>
                                                <th><i class="fa fa-bullhorn"></i> Gender</th>
                                                <th><i class="fa fa-bullhorn"></i> Birthday</th>
                                                <th><i class="fa fa-bullhorn"></i> Email</th>
                                                <th><i class="fa fa-bullhorn"></i> Class</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="row" items="${search}">
                                            <pg:item> 
                                                <tr>
                                                    <td><c:out value="${row.stu_RollNo}" /></td>
                                                    <td><c:out value="${row.stu_Name}" /></td>
                                                    <c:if test="${row.stu_Gender == '1'}">
                                                        <td><c:out value="Male"/></td> 
                                                    </c:if>
                                                    <c:if test="${row.stu_Gender == '0'}">
                                                        <td><c:out value="Female"/></td> 
                                                    </c:if>
                                                    <td><c:out value="${row.stu_Birth}" /></td>
                                                    <td><c:out value="${row.stu_Email}" /></td>
                                                    <td><c:out value="${row.cla_Id}" /></td>
                                                </tr>
                                            </pg:item> 
                                        </c:forEach>  
                                        </tbody>
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