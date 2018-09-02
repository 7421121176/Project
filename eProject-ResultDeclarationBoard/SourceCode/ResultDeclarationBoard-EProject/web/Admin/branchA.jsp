<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=branchA.jsp");
     } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=branchA.jsp");
    } else {%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var braid = document.form1.braid;
        var braname = document.form1.braname;
        var braaddress = document.form1.braaddress;
        var braemail = document.form1.braemail;
        var braphone = document.form1.braphone;



        if (laChuoiRong(braid.value))
        {
            alert('branch Id must be not blank!');
            braid.focus();
            return false;
        }

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

        <title>Branch Manage - Add New</title>

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
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> <a href="branch.jsp">Branch Manage</a> </h3>

                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <label class="col-sm-2 col-sm-2 control-label">
                                </label>
                                <form id="formbranch" action="../CBranch" name="form1" class="form-horizontal style-form" method="post" id="form1" onsubmit="return kiemtra()">
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Brand ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braid" value="" class="form-control" placeholder="Enter brand id"/>
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Brand Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braname"  value=""  class="form-control" placeholder="Enter Brand Name">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Brand Address</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braaddress"  value="" class="form-control" placeholder="Enter Brand Address">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Brand Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braemail"  value="" class="form-control" placeholder="Enter Brand Email">
                                        </div>
                                        <br/><br/>
                                        <label class="col-sm-2 col-sm-2 control-label">Brand Phone</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="braphone" value="" class="form-control" placeholder="Enter Brand Phone Number">
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