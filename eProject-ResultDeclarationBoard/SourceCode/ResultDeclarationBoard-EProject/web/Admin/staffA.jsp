<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=staffA.jsp");
       } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=staffA.jsp");
    } else {%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BBranch"%>
<!DOCTYPE html>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var staffId = document.form1.staffId;
        var staffName = document.form1.staffName;
        var staffAddress = document.form1.staffAddress;
        var staffEmail = document.form1.staffEmail;
        var staffPhone = document.form1.staffPhone;
        var staffBirth = document.form1.staffBirth;
        var staffDate = document.form1.staffDate;

        if (laChuoiRong(staffId.value))
        {
            alert('Staff Id must be not blank!');
            staffId.focus();
            return false;
        }

        if (laChuoiRong(staffName.value))
        {
            alert('Staff name must be not blank!');
            staffName.focus();
            return false;
        }

        if (laChuoiRong(staffAddress.value))
        {
            alert('Staff address must be not blank!');
            staffAddress.focus();
            return false;
        }

        if (laChuoiRong(staffEmail.value))
        {
            alert('Email  must be not blank!');
            staffEmail.focus();
            return false;
        }
        if (!laEmail(staffEmail.value))
        {
            alert('Email invalid!, Ex: jhon@gmail.com');
            staffEmail.focus();
            return false;
        }

        if (laChuoiRong(staffPhone.value))
        {
            alert('Phone  must be not blank!');
            staffPhone.focus();
            return false;
        }

        if (laChuoiRong(staffBirth.value))
        {
            alert('Staff birthdate must be not blank!');
            staffBirth.focus();
            return false;
        }

        if (laChuoiRong(staffDate.value))
        {
            alert('asdsa must be not blank!');
            staffDate.focus();
            return false;
        }
        return true;
    }
</script>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Staff Manage - Add new</title>

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
                BBranch ojb = new BBranch();
                Collection kq = ojb.getAllbranchlist();
                request.setAttribute("branch", kq);
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="staff.jsp"> Staff Manage </a> </h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="../CStaff" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Staff Id</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="staffId" value="" class="form-control" placeholder="First Letter of Last Name and Middle Name with First Name, Example: ttanh"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Full Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="staffName"  class="form-control" placeholder="Staff Full Name">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Address</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="staffAddress" class="form-control" placeholder="Staff Address">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="staffEmail" class="form-control" placeholder="Staff Email">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Phone Number</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="staffPhone" class="form-control" placeholder="Staff Phone Number">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Birth Date</label>
                                        <div class="col-sm-10">
                                            <input type="date" name="staffBirth" class="form-control" placeholder="Staff Birth Date">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Gender</label>
                                        <div class="col-sm-10">
                                            <input type="radio" name="gender" value="Male" checked="checked" /> Male
                                            <br>
                                            <input type="radio" name="gender" value="Female" /> Female                                     
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Start Date</label>
                                        <div class="col-sm-10">
                                            <input type="date" name="staffDate"  class="form-control" placeholder="Staff Start Date">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Branch Id</label>
                                        <div class="col-sm-10">
                                            <select name="stabraid" class="form-control">
                                                <c:forEach var="row" items="${branch}">
                                                    <option value='<c:out value="${row.bra_Id}"/>'>
                                                        <c:out value="${row.bra_Id}"/> - <c:out value="${row.bra_Name}"/>
                                                    </option>
                                                </c:forEach>
                                            </select>                                   
                                        </div>
                                        <br/><br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Status</label>
                                        <div class="col-sm-10">
                                            <input type="checkbox" name="staffStatus" value="staffStatus" data-toggle="switch" CHECKED/>
                                        </div>   

                                    </div> 
                                    <input type="submit" name="btn" value="Add" />

                                </form>
                            </div>
                        </div><!-- col-lg-12-->      	
                    </div>

                </section>
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