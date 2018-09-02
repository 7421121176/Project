<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>

<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=classE.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=classE.jsp");
    } else {%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BCurriculum"%>
<!DOCTYPE html>


<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var claname = document.form1.claname;
        var clacurid = document.form1.clacurid;



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
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Class Manage - Update Information</title>

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
                String claid = "";
                String claname = "";
                String claclacurid = "";
                String ppage = "";
                claid = session.getAttribute("sclassID").toString();
                claname = session.getAttribute("sclassname").toString();
                claclacurid = session.getAttribute("sclacurid").toString();
                ppage = session.getAttribute("p").toString();
            %>
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
                                <form class="form-horizontal style-form" action="../CClass" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Class ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="<%=claid%>" class="form-control" placeholder="" disabled=""/>
                                            <input type="hidden" name="claid" value="<%=claid%>"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Class Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="claname" value="<%=claname%>" class="form-control" placeholder="Enter Class Name">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Curriculum Id</label>
                                        <div class="col-sm-10">        
                                            <select name="clacurid" class="form-control">   
                                                <c:forEach var="ex" items="${curriculum}"> 
                                                    <c:if test="${ex.cur_Id == sessionScope.sclacurid}">
                                                        <option selected value="${ex.cur_Id}"><c:out value="${ex.cur_Id}"/>- <c:out value="${ex.cur_Name}"/></option>
                                                    </c:if>
                                                    <c:if test="${ex.cur_Id != claclacurid}">

                                                        <option value="${ex.cur_Id}"><c:out value="${ex.cur_Id}"/>- <c:out value="${ex.cur_Name}"/></option>
                                                    </c:if> 
                                                </c:forEach>
                                            </select>                                   
                                        </div>
                                        <br/><br/>


                                        <input type="hidden" name="p" value="<%=ppage%>"/>
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