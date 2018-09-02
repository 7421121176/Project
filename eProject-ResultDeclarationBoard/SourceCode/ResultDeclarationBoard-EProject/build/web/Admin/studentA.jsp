<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=studentA.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=studentA.jsp");
    } else {%>
<%@page import="beans.BStudent"%>
<%@page import="beans.BBranch"%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BClass"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var stuRollNo = document.form1.stuRollNo;
        var stuName = document.form1.stuName;
        var stuAddress = document.form1.stuAddress;
        var stuEmail = document.form1.stuEmail;
        var stuPhone = document.form1.stuPhone;
        var stuBirth = document.form1.stuBirth;

        if (laChuoiRong(stuRollNo.value)) {
            alert("Student roll number must be not blank!");
            return false;
        }
        if (laChuoiRong(stuName.value)) {
            alert("Full name must be not blank!");
            stuName.focus();
            return false;
        }
        if (laChuoiRong(stuAddress.value)) {
            alert("Address must be not blank!");
            stuAddress.focus();
            return false;
        }
        if (laChuoiRong(stuEmail.value)) {
            alert("Email must be not blank!");
            stuEmail.focus();
            return false;
        }
        if (!laEmail(stuEmail.value))
        {
            alert('Email invalid!, Ex: jhon@gmail.com');
            stuEmail.focus();
            return false;
        }
        if (laChuoiRong(stuPhone.value)) {
            alert("Phone must be not blank!");
            stuPhone.focus();
            return false;
        }
        if (!laSoNguyen(stuPhone.value))
        {
            alert('Phone number invalid!');
            stuPhone.focus();
            return false;
        }

        if (laChuoiRong(stuBirth.value)) {
            alert("Birthday must be not blank!");
            stuBirth.focus();
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

        <title>Student Manage - Add New</title>

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
                BClass ojb = new BClass();
                Collection kq = ojb.getAllclasslist();
                request.setAttribute("class", kq);
            %>
            <%
                BBranch ojb1 = new BBranch();
                Collection kq1 = ojb1.getAllbranchlist();
                request.setAttribute("branch", kq1);
            %>
            <%
                BStudent ojb2 = new BStudent();
                Collection kq2 = ojb2.getAllstudentlist();
                request.setAttribute("student", kq2);
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right" ><a href="student.jsp"></i> Student Manage </a></h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">                                
                                <label class="col-sm-2 col-sm-2 control-label">
                                </label>
                                <form id="formstudent" action="../CStudent" name="form1" class="form-horizontal style-form" method="post" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Student Roll Number</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stuRollNo" value="" class="form-control" placeholder="Enter roll number student"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Full Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stuName" class="form-control" placeholder="Student Full Name">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Address</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stuAddress" class="form-control" placeholder="Student Address">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stuEmail" class="form-control" placeholder="Student Email">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Phone Number</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stuPhone"  class="form-control" placeholder="Student Phone Number">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Birth Date</label>
                                        <div class="col-sm-10">
                                            <input type="date" name="stuBirth" class="form-control" placeholder="Student Birth Date">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Gender</label>
                                        <div class="col-sm-10">
                                            <input type="radio" name="gender" value="True" checked="checked" /> Male
                                            <br>
                                            <input type="radio" name="gender" value="False" /> Female                                     
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Branch</label>
                                        <div class="col-sm-10">
                                                <select name="stubraid" class="form-control">
                                                <c:forEach var="row1" items="${branch}">
                                                    <option value='<c:out value="${row1.bra_Id}"/>'>
                                                        <c:out value="${row1.bra_Id}"/> - <c:out value="${row1.bra_Name}"/>
                                                    </option>
                                                </c:forEach>
                                            </select>                                 
                                        </div>
                                        <br/><br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Class</label>
                                        <div class="col-sm-10">
                                            <select name="stuclaid" class="form-control">
                                                <c:forEach var="row2" items="${class}">
                                                    <option value='<c:out value="${row2.cla_Id}"/>'>
                                                        <c:out value="${row2.cla_Id}"/> - <c:out value="${row2.cla_Name}"/>
                                                    </option>
                                                </c:forEach>
                                            </select>                                    
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



    </body>
</html>
<%}%>