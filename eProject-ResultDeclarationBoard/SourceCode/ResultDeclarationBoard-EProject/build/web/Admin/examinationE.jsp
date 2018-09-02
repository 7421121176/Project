<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=examinationE.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=examinationE.jsp");
    } else {%>
<%@page import="beans.BSubject"%>
<%@page import="java.util.Collection"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">

    function kiemtra() {
        var date = document.form1.date;
        var time = document.form1.time;
        var fee = document.form1.fee;
        var regadingDate = document.form1.regadingDate;
        var regardingDeadline = document.form1.regardingDeadline;

        if (laChuoiRong(date.value)) {
            alert("Date must be not blank!");
            date.focus();
            return false;
        }

        if (laChuoiRong(time.value)) {
            alert("Time must be not blank!");
            time.focus();
            return false;
        }

        if (laChuoiRong(fee.value)) {
            alert("Fee must be not blank!");
            fee.focus();
            return false;
        }
        if (!laSoNguyen(fee.value))
        {
            alert('Fee number invalid!');
            fee.focus();
            return false;
        }
        if (laChuoiRong(regadingDate.value)) {
            alert("Regading Date must be not blank!");
            regadingDate.focus();
            return false;
        }
        if (laChuoiRong(regardingDeadline.value)) {
            alert("RegardingDeadline must be not blank!");
            regardingDeadline.focus();
            return false;
        }
        return true;
    }</script>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Examination Manage - Update Information</title>

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


        <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
        <!--header start-->
        <jsp:include page="header.jsp"/>
        <%
            String examId = "";
            String subId = "";
            String examDate = "";
            String examTime = "";
            String examFee = "";
            String examStartDate = "";
            String examEndDate = "";
            String ppage = "";
            examId = session.getAttribute("sexamId").toString();
            subId = session.getAttribute("ssubId").toString();
            examDate = session.getAttribute("sexamDate").toString();
            examTime = session.getAttribute("sexamTime").toString();
            examFee = session.getAttribute("sexamFee").toString();
            examStartDate = session.getAttribute("sexamStartDate").toString();
            examEndDate = session.getAttribute("sexamEndDate").toString();
            ppage = session.getAttribute("p").toString();
        %>
        <%
            BSubject ojb = new BSubject();
            Collection kq = ojb.getAllsubjectlist();
            request.setAttribute("subject", kq);
        %>
        <!--header end-->
        <section id="main-content">
            <section class="wrapper">
                <h3><i class="fa fa-angle-right"><a href="examination.jsp"></i> Examination Manage</a> </h3>
                <section id="container" >

                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="../CExamination" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Id</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="" value="<%=examId%>" class="form-control" placeholder="Examination Id" disabled="true"/>
                                            <input type="hidden" name="examId" value="<%=examId%>"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Subject</label>
                                        <div class="col-sm-10">        
                                            <select name="subject" class="form-control">   
                                                <c:forEach var="ex" items="${subject}"> 
                                                    <c:if test="${ex.sub_Id == sessionScope.ssubId}">
                                                        <option selected value="${ex.sub_Id}"><c:out value="${ex.sub_Id}"/>- <c:out value="${ex.sub_Name}"/></option>
                                                    </c:if>
                                                    <c:if test="${ex.sub_Id != sessionScope.ssubId}">

                                                        <option value="${ex.sub_Id}"><c:out value="${ex.sub_Id}"/>- <c:out value="${ex.sub_Name}"/></option>
                                                    </c:if> 
                                                </c:forEach>
                                            </select>                                   
                                        </div>
                                        <label class="col-sm-2 col-sm-2 control-label">Date</label>
                                        <div class="col-sm-10">                                              
                                            <input type="date" class="form-control" placeholder="Examination Date" name="date" size="5" value="<%=examDate%>">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Time</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" placeholder="Examination Time" name="time" size="5" value="<%=examTime%>"><br/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label" >Fee</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="<%=examFee%>"  class="form-control" placeholder="Examination Fee" name="fee" />
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Regarding Date</label>
                                        <div class="col-sm-10">
                                            <input type="date" class="form-control" value="<%=examStartDate%>" name="regadingDate" />
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Deadline Regarding</label>
                                        <div class="col-sm-10">
                                            <input type="date" class="form-control" placeholder="Regarding Deadline" name="regardingDeadline" size="5" value="<%=examEndDate%>">
                                        </div>      
                                    </div>       

                                    <input type="hidden" name="p" value="<%=ppage%>"/>
                                    <input type="submit" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal" name="btn" value="Save" />
                                </form>
                            </div>
                        </div>
                    </div><!-- col-lg-12-->  

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