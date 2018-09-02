<%-- 
    Document   : header
    Created on : Feb 15, 2015, 3:37:47 PM
    Author     : DELL
--%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>KINGSTONE ACADEMIC - Header</title>

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
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="index.jsp" class="logo"><b>KINGSTONE ACADEMIC - Staff Panel</b></a>
                <!--logo end-->
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="../lock">Lock Screen</a></li>
                        <li><a class="logout" href="../Logout">Logout</a></li>
                    </ul>
                </div>
            </header>

            <!-- **********************************************************************************************************************************************************
            MAIN SIDEBAR MENU
            *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            
        <%
            String idlogin = "";
            String name = "";
            if (session.getAttribute("login") != null) {
                idlogin = session.getAttribute("login").toString();
                name = session.getAttribute("loginname").toString();
            }
        %>
            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">

                        <p class="centered"><a href="profile.jsp"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                        <h5 class="centered"><%=name%></out></h5>

                        <li class="mt">
                            <a class="active" href="index.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="sub-menu">
                            <a href="staff.jsp" >
                                <i class="fa fa-desktop"></i>
                                <span>Staff</span>
                            </a>
                        </li>

                        <li class="sub-menu">
                            <a href="student.jsp" >
                                <i class="fa fa-cogs"></i>
                                <span>Student</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="curriculum.jsp" >
                                <i class="fa fa-book"></i>
                                <span>Curriculum</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="class.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Class</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="branch.jsp" >
                                <i class="fa fa-th"></i>
                                <span>Branch</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="subject.jsp" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Subject</span>
                            </a>
                        </li>    
                         <li class="sub-menu">
                            <a href="notification.jsp" >
                                <i class="fa fa-cogs"></i>
                                <span>Notification</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="examination.jsp" >
                                <i class="fa fa-th"></i>
                                <span>Examination</span>
                            </a>
                            
                        <li class="sub-menu">
                            <a href="regarding.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Regarding</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="contact.jsp" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Contact</span>
                            </a>
                        </li>  
                            <ul class="sub">
                                <li><a  href=""></a></li>
                                <li><a  href=""></a></li>
                                <li><a  href=""></a></li>                          
                                <li><a  href=""></a></li>
                                <li><a  href=""></a></li>
                                <li><a  href=""></a></li>
                                <li><a  href=""></a></li>
                                <li><a  href=""></a></li>
                                <li><a  href=""></a></li>
                                <li><a  href=""></a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->

        </section>
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/jquery-1.8.3.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="assets/js/jquery.sparkline.js"></script>
        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets/js/gritter-conf.js"></script>
    </body>
</html>

