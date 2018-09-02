<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=regardingA.jsp");
       } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=regardingA.jsp");
    } else {%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BExamination"%>
<!DOCTYPE html>


<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var reid = document.form1.reid;
        var sturoll = document.form1.sturoll;
        var date = document.form1.date;

        if (laChuoiRong(reid.value))
        {
            alert('Regarding Id must be not blank!');
            reid.focus();
            return false;
        }

        if (laChuoiRong(sturoll.value))
        {
            alert('Student RollNo must be not blank!');
            sturoll.focus();
            return false;
        }

        if (laChuoiRong(date.value))
        {
            alert('Date  must be not blank!');
            date.focus();
            return false;
        }

        if (laChuoiRong(braphone.value))
        {
            alert('Phone  must be not blank!');
            braphone.focus();
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

        <title>Regarding Manage - Add New</title>

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
                BExamination ojb = new BExamination();
                Collection kq = ojb.getAllexaminationlist();
                request.setAttribute("examination", kq);
            %>
            <!--header end-->
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="regarding.jsp">Regarding Manage</a> </h3>

                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <label class="col-sm-2 col-sm-2 control-label">
                                </label>
                                <form id="formbranch" action="../CRegarding" name="form1" class="form-horizontal style-form" method="post" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Regarding ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="reid" value="" class="form-control" placeholder="Enter Regarding Id"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Student Roll No</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="sturoll"  value=""  class="form-control" placeholder="Enter Student Roll No">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Status</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stat"  value="" class="form-control" placeholder="Enter Status">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Date Regarding</label>
                                        <div class="col-sm-10">
                                            <input type="date" name="date"  value="" class="form-control" placeholder="Date">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Exam Id</label>
                                        <div class="col-sm-10">
                                            <select name="examiid" class="form-control">
                                                <c:forEach var="row" items="${examination}">
                                                    <option value='<c:out value="${row.exam_Id}"/>'>
                                                        <c:out value="${row.exam_Id}"/>
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