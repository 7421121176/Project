<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=studentE.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=studentE.jsp");
    } else {%>
<%@page import="beans.BClass"%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BBranch"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.regex.Matcher"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var stuName = document.form1.stuName;
        var stuAddress = document.form1.stuAddress;
        var stuEmail = document.form1.stuEmail;
        var stuPhone = document.form1.stuPhone;
        var stuBirth = document.form1.stuBirth;

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

        <title>Student Manage - Update Information</title>

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

        <script src="assets/js/chart-master/Chart.js">
        </script>


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

            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="student.jsp">Student Manage </a></h3>
                    <%
                        String sturono = "";
                        String stuname = "";
                        String stuaddr = "";
                        String stuemai = "";
                        String stubirth = "";
                        String stuphoneno = "";
                        String stugend = "";
                        String stubraid = "";
                        String stuclaid = "";
                        String ppage = "";
                        sturono = session.getAttribute("sstudentRoll").toString();
                        stuname = session.getAttribute("sstudentname").toString();
                        stuaddr = session.getAttribute("sstudentaddress").toString();
                        stuemai = session.getAttribute("sstudentemail").toString();
                        stubirth = session.getAttribute("sstudentbirth").toString();
                        stuphoneno = session.getAttribute("sstudentphoneno").toString();
                        stugend = session.getAttribute("sstudentgend").toString();
                        stubraid = session.getAttribute("sstubranchid").toString();
                        stuclaid = session.getAttribute("sstuclassid").toString();
                        ppage = session.getAttribute("p").toString();
                    %>
                    <%
                        BBranch ojb = new BBranch();
                        Collection kq = ojb.getAllbranchlist();
                        request.setAttribute("branch", kq);
                    %>
                    <%
                        BClass ojb1 = new BClass();
                        Collection kq1 = ojb1.getAllclasslist();
                        request.setAttribute("class", kq1);
                    %>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="../CStudent" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">    
                                        <label class="col-sm-2 col-sm-2 control-label">Student Roll Number</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="" value="<%=sturono%>" class="form-control"  readonly="readonly"/>
                                            <input type="hidden" name="stuRollNo" value="<%=sturono%>"/>
                                        </div
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Full Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stuName" class="form-control" value="<%=stuname%>"/>

                                        </div>

                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Address</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stuAddress" class="form-control" value="<%=stuaddr%>"/>
                                        </div>

                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="email" name="stuEmail" class="form-control" value="<%=stuemai%>"/>                                            
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Phone Number</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stuPhone"  class="form-control" value="<%=stuphoneno%>"/>


                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Birth Date</label>
                                        <div class="col-sm-10">
                                            <input type="date" name="stuBirth" class="form-control" value="<%=stubirth%>"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Gender</label>
                                        <div class="col-sm-10">
                                            <c:if test="${sessionScope.sstudentgend=='1'}">
                                                <input type="radio" name="gender" value="Male" checked="checked" /> Male
                                                <br>   
                                                <input type="radio" name="gender" value="Female" /> Female  
                                            </c:if> 
                                            <c:if test="${sessionScope.sstudentgend=='0'}">
                                                <input type="radio" name="gender" value="Male" /> Male
                                                <br>   
                                                <input type="radio" name="gender" value="Female" checked="checked" /> Female  
                                            </c:if> 
                                        </div>
                                        <br/><br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Branch</label>
                                        <div class="col-sm-10">        
                                            <select name="stubraid" class="form-control">   
                                                <c:forEach var="ex" items="${branch}"> 
                                                    <c:if test="${ex.bra_Id == sessionScope.sstubranchid}">
                                                        <option selected value="${ex.bra_Id}"><c:out value="${ex.bra_Id}"/>- <c:out value="${ex.bra_Name}"/></option>
                                                    </c:if>
                                                    <c:if test="${ex.bra_Id != sessionScope.sstubranchid}">

                                                        <option value="${ex.bra_Id}"><c:out value="${ex.bra_Id}"/>- <c:out value="${ex.bra_Name}"/></option>
                                                    </c:if> 
                                                </c:forEach>
                                            </select>                                   
                                        </div>
                                        <br/><br/>

                                        <label class="col-sm-2 col-sm-2 control-label">Class</label>
                                        <div class="col-sm-10">        
                                            <select name="stuclaid" class="form-control">   
                                                <c:forEach var="ex1" items="${class}"> 
                                                    <c:if test="${ex1.cla_Id == sessionScope.sstuclassid}">
                                                        <option selected value="${ex1.cla_Id}"><c:out value="${ex1.cla_Id}"/>- <c:out value="${ex1.cla_Name}"/></option>
                                                    </c:if>
                                                    <c:if test="${ex1.cla_Id != sessionScope.sstuclassid}">

                                                        <option value="${ex1.cla_Id}"><c:out value="${ex1.cla_Id}"/>- <c:out value="${ex1.cla_Name}"/></option>
                                                    </c:if> 
                                                </c:forEach>
                                            </select>       
                                              
                                        </div>
                                        <input type="hidden" name="p" value="<%=ppage%>"/>
                                    </div>                                          
                                    <input type="submit" name="btn" value="Save" />
                                </form>
                            </div>
                        </div>
                    </div>
                </section>

                <jsp:include page="footer.jsp"/>
            </section>
        </section>
    </body>
</html>
<%}%>