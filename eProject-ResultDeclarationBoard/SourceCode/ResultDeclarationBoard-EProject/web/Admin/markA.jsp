<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=markA.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=markA.jsp");
    } else {%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var makra = document.form1.makra;

        if (!laSoNguyen(makra.value))
        {
            alert('Mark invalid!');
            makra.focus();
            return false;
        }
       
        return true;
    }
</script>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Examination Manage - Mark</title>

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
                String stuno = "";
                String mama = "";
                stuno = session.getAttribute("mamsturollno").toString();
                mama = session.getAttribute("marka").toString();
                
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="markA.jsp">Mark Manage</a> </h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="../CExamMark" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Student Roll No</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="<%=stuno%>" class="form-control" placeholder="" disabled=""/>
                                            <input type="hidden" name="studrolno" value="<%=stuno%>"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Mark</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="makra" value="<%=mama%>" class="form-control" placeholder="Enter Mark (0/100)">
                                        </div>
                                    </div>       
                                    <input type="submit" name="btn" value="Save" />         

                                </form>

                            </div>
                        </div><!-- col-lg-12-->      	
                    </div>


                    <!-- /row -->

                </section><! --/wrapper -->
            </section>
            <!-- /MAIN CONTENT -->


            <!--main content end-->
            <!--footer start-->
            <jsp:include page="footer.jsp"/>
            <!--footer end-->
        </section>



    </body>
</html>
<%}%>