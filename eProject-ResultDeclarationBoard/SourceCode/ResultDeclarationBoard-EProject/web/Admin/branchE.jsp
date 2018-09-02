<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=branchE.jsp");
       } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=branchE.jsp");
    } else {%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var braname = document.form1.braname;
        var braaddress = document.form1.braaddress;
        var braemail = document.form1.braemail;
        var braphone = document.form1.braphone;

        if (laChuoiRong(braname.value))
        {
            alert('Full name must be not blank!');
            braname.focus();
            return false;
        }
        if (laChuoiRong(braaddress.value))
        {
            alert('Address  must be not blank!');
            braaddress.focus();
            return false;
        }

        if (laChuoiRong(braemail.value))
        {
            alert('Email  must be not blank!');
            braemail.focus();
            return false;
        }
        if (!laEmail(braemail.value))
        {
            alert('Email invalid!, Ex: jhon@gmail.com');
            braemail.focus();
            return false;
        }





        if (laChuoiRong(braphone.value))
        {
            alert('Phone  must be not blank!');
            braphone.focus();
            return false;
        }
        if (!laSoNguyen(braphone.value))
        {
            alert('Phone number invalid!');
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
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Branch Manage - Update Information</title>

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
                String bid = "";
                String bname = "";
                String badd = "";
                String bemail = "";
                String bphone = "";
                String ppage = "";
                bid = session.getAttribute("sbranchID").toString();
                bname = session.getAttribute("sbranchname").toString();
                badd = session.getAttribute("saddress").toString();
                bemail = session.getAttribute("semail").toString();
                bphone = session.getAttribute("sphoneno").toString();
                ppage = session.getAttribute("p").toString();
            %>
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="branch.jsp">Branch Manage</a> </h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form class="form-horizontal style-form" action="../CBranch" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Brand ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="<%=bid%>" class="form-control" placeholder="" disabled=""/>
                                            <input type="hidden" name="braid" value="<%=bid%>"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Brand Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braname" value="<%=bname%>" class="form-control" placeholder="Enter Brand Name">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Brand Address</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braaddress" value="<%=badd%>" class="form-control" placeholder="Enter Brand Address">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Brand Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braemail" value="<%=bemail%>" class="form-control" placeholder="Enter Brand Email">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Brand Phone</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braphone" value="<%=bphone%>" class="form-control" placeholder="Enter Brand Phone Number">
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
