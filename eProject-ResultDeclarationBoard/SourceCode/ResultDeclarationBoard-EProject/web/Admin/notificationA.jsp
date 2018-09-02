<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=notificationA.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=notificationA.jsp");
    } else {%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<%@ page import="java.io.*,java.util.*" %>
<script language="javascript">
    function kiemtra() {
        var notiid = document.form1.notiid;
        var notiti = document.form1.notiti;
        var notiinfo = document.form1.notiinfo;



        if (laChuoiRong(notiid.value))
        {
            alert('Notification Id must be not blank!');
            notiid.focus();
            return false;
        }

        if (laChuoiRong(notiti.value))
        {
            alert('Notification title must be not blank!');
            notiti.focus();
            return false;
        }
        if (laChuoiRong(notiinfo.value))
        {
            alert('Notification information  must be not blank!');
            notiinfo.focus();
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

        <title>Notification Manage - Add new</title>

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
        <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <jsp:include page="header.jsp"/>
            <!--header end-->
            <%
                String idlogin = "";
                if (session.getAttribute("login") != null) {
                    idlogin = session.getAttribute("login").toString();
                }
            %>
            <%
                Date dNow = new Date();
                SimpleDateFormat ft
                        = new SimpleDateFormat("dd/MM/yyyy");
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="notification.jsp"> Notification Manage </a> </h3>


                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="../CNotification" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Notification ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="notiid" value="" class="form-control" placeholder="Enter Notification ID"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Notification Title</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="notiti" class="form-control" placeholder="Enter Notification Title">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Notification Infomation</label>
                                        <div class="col-sm-10">
                                            <textarea type="text" name="notiinfo" class="form-control" placeholder="Enter Notification Infomation"></textarea>
                                        </div>
                                        <input type="hidden" name="notistaffid" value="<%=idlogin%>"/>
                                        <br/><br/>

                                    </div>          
                                    <input type="submit" name="btn" value="Add" />
                                </form>
                            </div>
                        </div><!-- col-lg-12-->      	
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