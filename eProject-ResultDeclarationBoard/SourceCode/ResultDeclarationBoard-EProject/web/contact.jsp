<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script language="javascript" type="text/javascript" src="../layout/scripts/validate.js"></script>
<script language="javascript">
    function kiemtra() {
        var contname = document.form1.contname;
        var contemail = document.form1.contemail;

        if (laChuoiRong(contname.value))
        {
            alert('Please enter your name!');
            contname.focus();
            return false;
        }

        if (laChuoiRong(contemail.value))
        {
            alert('Please enter your email!');
            contemail.focus();
            return false;
        }

        if (!laEmail(contemail.value))
        {
            alert('Email invalid!, Ex: jhon@gmail.com');
            contemail.focus();
            return false;
        }

        return true;
    }
</script>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>

        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

        <!--[if lt IE 9]>
         <script src="js/html5shiv.js"></script>
        <![endif]-->


    </head>
    <body>

        <!-- SITE CONTENT -->
        <jsp:include page="Header.jsp"/>

        <!-- CONTENT -->
        <div id="contentBkcontentBk" class="clearfix">
            <div id="contentcontent">
                <div class="wrapper">
                    <div class="column c-6767 clearfix">                        
                        <div class="box">
                            <div class="boxInfo"><iframe class="fwidth" width="425" height="350" frameborder="1" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=ro&amp;geocode=&amp;q=india&amp;aq=&amp;sll=17.978733,85.253906&amp;sspn=33.781446,31.772461&amp;ie=UTF8&amp;hq=&amp;hnear=India&amp;ll=20.593684,78.96288&amp;spn=33.164285,31.772461&amp;t=m&amp;z=5&amp;output=embed"></iframe>
                            </div>
                              <h2>We are here</h2>
                                    <header>
                                        <address>
                                            <a href="http://www.cuscsoft.com/index.php?outsource/EN">CanTho University Software Center</a>
                                        </address>
                                        <time datetime="2045-04-06T08:15+00:00">Ly Tu Trong - Ninh Kieu - Can Tho</time>
                                    </header>
                                    <div class="comcont">
                                        <span class="fa fa-phone"></span> +(84)906 332 018
                                        <span class="fa fa-envelope-o"></span> ttanh022@cusc.ctu.edu.vn</div>
                
                        </div>

                    </div>
                    <div class="clear"></div>
                    <div id="comments">
                        <h2>Write A Comment</h2>
                        <form action="CContact" method="post" name="form1" id="form1" onsubmit="return kiemtra()">
                            <div class="one_third first">
                                <label >Name <span>*</span></label>
                                <input type="text" name="contname" value="" size="22">
                            </div>
                            <div class="one_third">
                                <label >Mail <span>*</span></label>
                                <input type="text" name="contemail" value="" size="22">
                            </div>
                            <div class="block clear">
                                <label >Your Comment</label>
                                <textarea name="contcomment" cols="25" rows="10"></textarea>
                            </div>
                            <div>
                                <input type="submit" name="btn" value="Submit" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- FOOTER -->

        <jsp:include page="Footer.jsp"/>

        <!-- END SITE CONTENT -->
        <script src="../../ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <script src="layout/scripts/jquery.flexslider-min.js"></script>
        <script src="layout/scripts/lightbox.js"></script>
        <script src="layout/scripts/scripts.js"></script> 

    </body>
</html>
