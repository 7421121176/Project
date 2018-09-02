

<%@page import="beans.BNotification"%>
<%@page import="java.util.Collection"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
Template Name: Fertile
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html>
    <head>
        <title>Notification</title>
        <meta charset="utf-8">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
        <%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
        <!-- s3slider -->
    </head>
    <body id="top">
        <!-- SITE CONTENT -->
        <jsp:include page="Header.jsp"/>
        <%
            BNotification ojb = new BNotification();
            Collection kq = ojb.getAllnotificationjoinlist();
            request.setAttribute("notification", kq);
        %>
        <div class="wrapper row2 bgded" style="background-image:url('images/demo/backgrounds/header_4.jpg');">
            <div id="pageintro"> 
                <!-- ################################################################################################ -->
            </div>
        </div>
        <div class="wrapper row3">
            <main class="container clear"> 
                <h3 class="title"><strong>Notification</strong></h3>
                <table>
                    <thead>
                        <tr>
                            <th><i class="fa fa-bullhorn"></i> Title</th>
                            <th class="hidden-phone"><i class="fa fa-question-circle"></i> Information</th>
                            <th><i class="fa fa-bookmark"></i> Date</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:set var="count" value="0"/>
                    <pg:paging pageSize="10" url="notification.jsp"> 
                        <c:forEach var="row" items="${notification}">
                            <pg:item> 
                                <tr>
                                <td><c:out value="${row.no_Title}"/></td> 
                                <td><c:out value="${row.no_Info}"/></td> 
                                <td><c:out value="${row.no_Date}" /></td> 
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
                <!-- ################################################################################################ -->
                <!-- / container body -->
                <div class="clear"></div>
            </main>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <jsp:include page="Footer.jsp"/>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
        <script src="layout/scripts/jquery.min.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>

    </body>
</html>