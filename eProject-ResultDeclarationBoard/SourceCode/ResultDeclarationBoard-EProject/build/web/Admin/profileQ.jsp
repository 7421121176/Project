<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=profileQ.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=profileQ.jsp");
    } else {%>
<%@page import="beans.BQuestion"%>
<%@page import="java.util.Collection"%>
<!DOCTYPE html>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var stapass = document.form1.stapass;
        var staans = document.form1.staans;
        var staconpass = document.form1.staconpass;

        if (laChuoiRong(stapass.value))
        {
            alert('Password must be not blank!');
            stapass.focus();
            return false;
        }

        if (laChuoiRong(staans.value))
        {
            alert('Answer must be not blank!');
            staans.focus();
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

        <title>KINGSTONE ACADEMIC - Change Secret Question</title>

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
        <%
            String idlogin = "";
            if (session.getAttribute("login") != null) {
                idlogin = session.getAttribute("login").toString();
            }
        %>
        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <jsp:include page="header.jsp"/>
            <%
            BQuestion ojb = new BQuestion();
            Collection kq = ojb.getAllquestionlist();
            request.setAttribute("question", kq);
            %>
            <!--header end-->
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> Profile Manage </h3>

                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">

                                <form action="profile.jsp">
                                    <button class="btn btn-success btn-xs"><i class="fa fa-angle-right" class="fa fa-check"></i>Change information</button>
                                </form>
                                <form action="profileP.jsp">
                                    <button class="btn btn-success btn-xs"><i class="fa fa-angle-right" class="fa fa-check"></i>Change password</button>
                                </form>
                                <form class="form-horizontal style-form" action="../CProfile" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group">
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" name="staffId" value="<%=idlogin%>"/>
                                        <label class="col-sm-2 col-sm-2 control-label">Staff Password</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="stapass" class="form-control" placeholder="Staff Password">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Question</label>
                                        <div class="col-sm-10">        
                                            <select name="staques" class="form-control">   
                                                <c:forEach var="rows" items="${question}">
                                                    <option value='<c:out value="${rows.ques_Id}"/>'>
                                                        <c:out value="${rows.ques_question}"/>
                                                    </option>
                                                </c:forEach>
                                            </select>                                   
                                        </div>
                                        <label class="col-sm-2 col-sm-2 control-label">Answer</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="staans" class="form-control" placeholder="Answer the question">
                                        </div>
                                        <br/><br/>
                                    </div>          
                                    <input type="submit" name="btn" value="Change secret password" />
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