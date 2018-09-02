<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=staffR.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=staffR.jsp");
    } else {%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BRole"%>
<!DOCTYPE html>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>KINGSTONE ACADEMIC - Role Manage </title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
        <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
        <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

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
                BRole ojb = new BRole();
                Collection kq = ojb.getAllrolelist();
                request.setAttribute("roles", kq);
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="staff.jsp"> Staff Role Manage </a> </h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="../CStaff" method="post">
                                    <div class="form-group"></div>
                                    <c:forEach var="row" items="${staffRole}">
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Staff</label>
                                            <div class="col-sm-10">
                                                <input type="text" value="${row.staff_Id}" class="form-control" placeholder="" disabled=""/>
                                                <input type="hidden" name="staffId" value="${row.staff_Id}"/>
                                            </div>
                                            <br/><br/>
                                            <label class="col-sm-2 col-sm-2 control-label">Role</label>
                                            <div class="col-sm-10">        
                                                <select name="staffroleid" class="form-control">   
                                                    <c:forEach var="ex" items="${roles}"> 
                                                        <c:if test="${ex.role_Id == row.role_Id}">
                                                            <option selected value="${ex.role_Id}"><c:out value="${ex.role_Id}"/>- <c:out value="${ex.role_Name}"/></option>
                                                        </c:if>
                                                        <c:if test="${ex.role_Id != row.role_Id}">

                                                            <option value="${ex.role_Id}"><c:out value="${ex.role_Id}"/>- <c:out value="${ex.role_Name}"/></option>
                                                        </c:if> 
                                                    </c:forEach>
                                                </select>                                   
                                            </div>
                                            <br/><br/>
                                        </div>       
                                    </c:forEach>
                                    <input type="submit" name="btn" value="Confirm" />         

                                </form>

                            </div>
                        </div><!-- col-lg-12-->      	
                    </div>


                    <!-- /row -->

                </section><! --/wrapper -->
            </section>

            <!--main content end-->
            <!--footer start-->
            <jsp:include page="footer.jsp"/>
            <!--footer end-->
        </section>
        <!--custom switch-->
        <script src="assets/js/bootstrap-switch.js"></script>
        <!--custom tagsinput-->
        <script src="assets/js/jquery.tagsinput.js"></script>

        <!--custom checkbox & radio-->

        <script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>


        <script src="assets/js/form-component.js"></script>    
        <!--script for this page-->
        <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets/js/gritter-conf.js"></script>


    </body>
</html>
<%}%>