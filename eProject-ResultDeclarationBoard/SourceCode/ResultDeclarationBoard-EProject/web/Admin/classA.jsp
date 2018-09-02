<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>

<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=classA.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=classA.jsp");
    } else {%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BCurriculum"%>
<!DOCTYPE html>


<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var claid = document.form1.claid;
        var claname = document.form1.claname;
        var clacurid = document.form1.clacurid;



        if (laChuoiRong(claid.value))
        {
            alert('Class Id must be not blank!');
            claid.focus();
            return false;
        }

        if (laChuoiRong(claname.value))
        {
            alert('Class name must be not blank!');
            claname.focus();
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

        <title>Class Manage - Add New</title>

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
                BCurriculum ojb = new BCurriculum();
                Collection kq = ojb.getAllcurriculumlist();
                request.setAttribute("curriculum", kq);
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="class.jsp"> Class Manage </a> </h3>

                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <label class="col-sm-2 col-sm-2 control-label">
                                </label>
                                <form id="formbranch" action="../CClass" name="form1" class="form-horizontal style-form" method="post" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Class ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="claid" value="" class="form-control" placeholder="Enter brand id"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Class Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="claname"  value=""  class="form-control" placeholder="Enter Brand Name">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Curriculum Id</label>
                                        <div class="col-sm-10">
                                            <select name="clacurid" class="form-control">
                                                <c:forEach var="row" items="${curriculum}">
                                                    <option value='<c:out value="${row.cur_Id}"/>'>
                                                        <c:out value="${row.cur_Id}"/> - <c:out value="${row.cur_Name}"/>
                                                    </option>
                                                </c:forEach>
                                            </select>                                   
                                        </div>
                                        <br/><br/>


                                    </div>          
                                    <input type="submit" name="btn" value="Add" />
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