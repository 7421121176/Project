<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=staff.jsp");
        } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=staff.jsp");
    } else {%>
<%@page import="beans.BStaff"%>
<%@page import="java.util.Collection"%>
<%@page import="org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>KINGSTONE ACADEMIC - Staff Manage </title>

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
            BStaff ojb = new BStaff();
            Collection kq = ojb.getAllstafflist();
            request.setAttribute("staff", kq);
        %>
        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <jsp:include page="header.jsp"/>
            <!--header end-->

            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> Staff Manage </h3>

                    <script>
                        function confirmGo(m, u) {
                            if (confirm(m)) {
                                window.location = u;
                            }
                        }
                    </script>

                    <div class="row mt">
                        <div class="col-md-12">
                            <div class="content-panel">
                                <table class="table table-striped table-advance table-hover">                                    
                                    <form action="staffA.jsp">
                                        <button class="btn btn-success btn-xs"><i class="fa fa-angle-right" class="fa fa-check"></i> Add new</button>
                                    </form>
                                    <hr>
                                    <thead>
                                        <tr>
                                            <th><i class="fa fa-bullhorn"></i> Id</th>
                                            <th><i class="fa fa-bullhorn"></i> Name</th>
                                            <th class="hidden-phone"><i class="fa fa-question-circle"></i> Address</th>
                                            <th><i class="fa fa-bookmark"></i> Email</th>
                                            <th><i class=" fa fa-edit"></i> Phone</th>
                                            <th><i class="fa fa-bookmark"></i> Birth Date</th>
                                            <th><i class="fa fa-bookmark"></i> Gender</th>                                            
                                            <th><i class="fa fa-bookmark"></i> Date Working</th>
                                            <th><i class="fa fa-bookmark"></i> Branch</th>
                                            <th><i class="fa fa-edit"></i> Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="count" value="0"/>
                                        <pg:paging pageSize="10" url="staff.jsp"> 
                                            <c:forEach var="row" items="${staff}">
                                                <pg:item> 
                                                    <tr>
                                                        <td><c:out value="${row.staff_Id}"/></td> 
                                                        <td><c:out value="${row.staff_FullName}"/></td> 
                                                        <td><c:out value="${row.staff_Address}"/></td> 
                                                        <td><c:out value="${row.staff_Email}"/></td> 
                                                        <td><c:out value="${row.staff_Phone}"/></td> 
                                                        <td><c:out value="${row.staff_Birth}"/></td> 
                                                        <c:if test="${row.staff_Gender == '1'}">
                                                            <td><c:out value="Male"/></td> 
                                                        </c:if>
                                                        <c:if test="${row.staff_Gender == '0'}">
                                                            <td><c:out value="Female"/></td> 
                                                        </c:if>
                                                        <td><c:out value="${row.staff_StartDate}"/></td>                                                         
                                                        <td><c:out value="${row.bra_Id}"/></td>                                                         
                                                        <c:if test="${row.staff_Status == '1'}">
                                                            <td><c:out value="Accept"/></td> 
                                                        </c:if>
                                                        <c:if test="${row.staff_Status == '0'}">
                                                            <td><c:out value="Denied"/></td> 
                                                        </c:if>
                                                        <c:url var="edit" value="../CStaff">
                                                            <c:param name="btn" value="Edit" />
                                                            <c:param name="estaffID" value="${row.staff_Id}" />
                                                            <c:param name="estaffname" value="${row.staff_FullName}" />
                                                            <c:param name="estaffaddr" value="${row.staff_Address}" />
                                                            <c:param name="estaffmail" value="${row.staff_Email}" />
                                                            <c:param name="estaffphone" value="${row.staff_Phone}" />
                                                            <c:param name="estaffbirth" value="${row.staff_Birth}" />
                                                            <c:param name="estaffgen" value="${row.staff_Gender}" />
                                                            <c:param name="estaffstartd" value="${row.staff_StartDate}" />
                                                            <c:param name="estaffbraid" value="${row.bra_Id}" />
                                                            <c:param name="estaffstatus" value="${row.staff_Status}" />
                                                            <c:param name="p" value="${param.pageNum}"/> 
                                                        </c:url> 
                                                        <c:url var="delete" value="../CStaff">
                                                            <c:param name="btn" value="Delete" />
                                                            <c:param name="staffId" value="${row.staff_Id}" />                                                
                                                            <c:param name="p" value="${param.pageNum}"/> 
                                                        </c:url>
                                                        <c:url var="editrole" value="../CStaff">
                                                            <c:param name="btn" value="EditRole" />
                                                            <c:param name="eestaffID" value="${row.staff_Id}" />
                                                            <c:param name="p" value="${param.pageNum}"/> 
                                                        </c:url> 
                                                        <td>
                                                            <a href="${editrole}" class="btn btn-success btn-xs"><i class="fa fa-check"></i></a>
                                                            <a href="${edit}" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                                                            <a href="${delete}" onclick="return confirmGo('Do you really want to delete this records ?')" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></a>
                                                        </td>
                                                    </tr>
                                                </pg:item> 
                                            </c:forEach>
                                            <pg:index>
                                            <ul class="controls-buttons">


                                                <li><pg:page><b><%=thisPage%></b></pg:page></li>
                                                <li><pg:firstPage><img src="images/icons/fugue/navigation-180.png" width="16" height="16"><b> [  Previous   ]</pg:firstPage></li>
                                                <li><pg:lastPage>[  Next  ] <img src="images/icons/fugue/navigation.png" width="16" height="16"></pg:lastPage></li>

                                                </ul>

                                        </pg:index> 

                                    </pg:paging> 	
                                    </tbody>
                                </table>
                            </div><!-- /content-panel -->
                        </div><!-- /col-md-12 -->
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