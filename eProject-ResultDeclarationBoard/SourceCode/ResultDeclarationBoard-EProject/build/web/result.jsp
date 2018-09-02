
<%@page import="java.util.Collection"%>
<%@page import="beans.BExamination"%>
<!DOCTYPE html>
<%@page import="org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
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
        <title>Result Declaration Board</title>
        <meta charset="utf-8">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <link rel="stylesheet" href="layout/styles/main.css">  
        <script type="text/javascript" src="layout/scripts/jquery.min.js"></script>

        <!-- s3slider -->
    </head>
    <body id="top">
        <!-- SITE CONTENT -->
        <jsp:include page="Header.jsp"/>

        <%
            BExamination ojb = new BExamination();
            Collection kq = ojb.getAllexaminationjoinlist();
            request.setAttribute("examination", kq);
        %>
        <div class="wrapper row2 bgded" style="background-image:url('images/demo/backgrounds/header_2.jpg');">
            <div id="pageintro"> 
                <!-- ################################################################################################ -->
            </div>
        </div>
        <div class="wrapper row3">
            <main class="container clear"> 
                <h3 class="title">Exam <strong>Result</strong></h3>
                <table >
                    <thead>
                        <tr>
                            <th>Subject Name</th>
                            <th>Date Exam</th>
                            <th>Time Exam</th>                         
                            <th>Date Regarding</th>
                            <th>Deadline Regarding</th>
                            <th>Fee Regarding</th>
                            <th>Mark</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="count" value="0"/>
                        <pg:paging pageSize="10" url="examination.jsp"> 
                            <c:forEach var="row" items="${examination}">
                                <pg:item> 
                                    <tr>                                                        
                                        <td><c:out value="${row.sub_Name}"/></td>                                                       
                                        <td><c:out value="${row.exam_Date}"/></td>
                                        <td><c:out value="${row.exam_Time}"/></td>                                                       
                                        <td><c:out value="${row.exam_StartDate}"/></td>
                                        <td><c:out value="${row.exam_EndDate}"/></td>                                        
                                        <td><c:out value="${row.exam_Fee}"/></td>  
                                        <c:url var="addmark" value="CExamMark">
                                            <c:param name="btn" value="MarkMem" />
                                            <c:param name="mexamid" value="${row.exam_Id}" />
                                            <c:param name="p" value="${param.pageNum}"/> 
                                        </c:url> 
                                        <td>
                                            <a href="${addmark}" class="btn btn-success btn-xs"><i class="fa fa-check"></i></a>
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