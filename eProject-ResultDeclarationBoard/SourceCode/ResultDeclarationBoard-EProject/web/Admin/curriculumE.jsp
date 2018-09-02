<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=curriculumE.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=curriculumE.jsp");
    } else {%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var curName = document.form1.curName;
        var curPeriod = document.form1.curPeriod;
        var curFee = document.form1.curFee;



        if (laChuoiRong(curName.value))
        {
            alert('Curriculum name must be not blank!');
            curName.focus();
            return false;
        }
        if (laChuoiRong(curPeriod.value))
        {
            alert('Curriculum period  must be not blank!');
            curPeriod.focus();
            return false;
        }

        if (laChuoiRong(curFee.value))
        {
            alert('Curriculum fee  must be not blank!');
            curFee.focus();
            return false;
        }
        if (!laSoNguyen(curFee.value))
        {
            alert('Fee number invalid!');
            curFee.focus();
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

        <title>Curriculum Manage - Update Information</title>

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
                String curid = "";
                String curname = "";
                String curperiod = "";
                String curfee = "";
                String ppage = "";
                curid = session.getAttribute("scurriculumID").toString();
                curname = session.getAttribute("scurriculumname").toString();
                curperiod = session.getAttribute("scurriculumperiod").toString();
                curfee = session.getAttribute("scurriculumfee").toString();
                ppage = session.getAttribute("p").toString();
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="curriculum.jsp"> Curriculum Manage </a> </h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="../CCurriculum" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Id</label>
                                            <div class="col-sm-10">
                                                <input type="text" value="<%=curid%>" class="form-control" placeholder="" disabled=""/>
                                                <input type="hidden" name="curId" value="<%=curid%>"/>
                                            </div>
                                            <br/><br/>
                                            <label class="col-sm-2 col-sm-2 control-label">Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="curName" value="<%=curname%>" class="form-control" placeholder="Enter Curriculum Name">
                                            </div>
                                            <br/><br/>
                                            <label class="col-sm-2 col-sm-2 control-label">Period</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="curPeriod" value="<%=curperiod%>" class="form-control" placeholder="Enter Curriculum Period">
                                            </div>
                                            <br/><br/>
                                            <label class="col-sm-2 col-sm-2 control-label">Fee</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="curFee" value="<%=curfee%>" class="form-control" placeholder="Enter Fee">
                                            </div>
                                            <input type="hidden" name="p" value="<%=ppage%>"/>

                                        <br/><br/>


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