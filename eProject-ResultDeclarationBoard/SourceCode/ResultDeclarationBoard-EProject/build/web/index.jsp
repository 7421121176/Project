<!DOCTYPE html>
<html>
    <head>
        <title>Kingstone Academic</title>
        <meta charset="utf-8">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <script type="text/javascript" src="layout/scripts/jquery.min.js"></script>

        <!-- s3slider -->
        <script type="text/javascript" src="layout/scripts/s3slider.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#featured_slide_').s3Slider({
                    timeOut: 5000
                });
            });
        </script>
    </head>
    <body id="top">
        <!-- SITE CONTENT -->
        <jsp:include page="Header.jsp"/>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
<div class="wrapper col2">
  <div id="featured_slide_">
    <ul id="featured_slide_Content">
      <li class="featured_slide_Image"><a href="gallery.jsp"><img src="images/demo/homepage/1st.jpg" alt="" /></a>
        <div class="introtext">
          <h2>A student reading</h2>
          <p>The Institute has successfully trained more than 65 lakh (6.5 million) students through its wide network of education centres located in over 40 countries..</p>
        </div>
      </li>
      <li class="featured_slide_Image"><a href="gallery.jsp"><img src="images/demo/homepage/2nd.jpg" alt="" /></a>
        <div class="introtext">
          <h2>Just a different perspective over this new issue</h2>
          <p>The Institute also provides recruitment assistance to companies. Based on the companies' job requirements, our students are shortlisted to get interviewed & placed with the organization in need</p>
        </div>
      </li>
      <li class="featured_slide_Image"><a href="gallery.jsp"><img src="images/demo/homepage/3rd.jpg" alt="" /></a>
        <div class="introtext">
          <h2>Look at the baloon!</h2>
          <p>World's leading provider of open source solutions, ..</p>
        </div>
      </li>
      <li class="featured_slide_Image"><a href="gallery.jsp"><img src="images/demo/homepage/4th.jpg" alt="" /></a>
        <div class="introtext">
          <h2>90% of the people have back issues</h2>
          <p>Red Hat uses a community powered approach to provide reliable and high-performing cloud, virtualization, storage, linux, and middleware technologies. .</p>
        </div>
      </li>
      <li class="clear featured_slide_Image"> 
        <!-- Leave This Empty --> 
      </li>
    </ul>
  </div>
</div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <div class="wrapper row3">
            <main class="container clear"> 
                <!-- container body -->
                <!-- ################################################################################################ -->
                <div class="group center">
                    <h2 class="font_xxl btmspace-80"></h2>
                    <div class="one_third first">
                        <div class="boxedicon"><a class="circle" href="about.jsp"><i class="fa fa-area-chart fa-2x"></i></a></div>
                        <h2 class="nospace push15">About</h2>
                        <p>Place to checkout everything about us</p>
                    </div>
                    <div class="one_third">
                        <div class="boxedicon"><a class="circle" href="result.jsp"><i class="fa fa-gift fa-2x"></i></a></div>
                        <h2 class="nospace push15">Result</h2>
                        <p>You already make exam?? Check you result right here</p>
                    </div>
                    <div class="one_third">
                        <div class="boxedicon"><a class="circle" href="notification.jsp"><i class="fa fa-history fa-2x"></i></a></div>
                        <h2 class="nospace push15">Notification</h2>
                        <p>Something new right here</p>
                    </div>
                </div>
                <!-- ################################################################################################ -->
                <!-- / container body -->
                <div class="clear"></div>
            </main>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <div class="wrapper">
            <figure class="latest overlay"> 
                <!-- ################################################################################################ -->
                <ul class="clear">
                    <li><a href="gallery.jsp"><img src="images/demo/latest/1st.jpg" alt=""></a></li>
                    <li><a href="gallery.jsp"><img src="images/demo/latest/2nd.jpg" alt=""></a></li>
                    <li><a href="gallery.jsp"><img src="images/demo/latest/3rd.jpg" alt=""></a></li>
                    <li><a href="gallery.jsp"><img src="images/demo/latest/4th.jpg" alt=""></a></li>
                    <li><a href="gallery.jsp"><img src="images/demo/latest/5th.jpg" alt=""></a></li>
                </ul>
                <!-- ################################################################################################ -->
            </figure>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->

        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <jsp:include page="Footer.jsp"/>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
        <!--<script src="layout/scripts/jquery.min.js"></script>-->
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script>
            
        </script>
    </body>
</html>