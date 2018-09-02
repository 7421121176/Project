$(document).ready(function () {
	
	// ================
	// loader for begin preloader
	// ================
    $("body").queryLoader2({
        barColor: "#1a7ca7",
        backgroundColor: "#000",
        percentage: true,
        barHeight: 1,
        completeAnimation: "grow",
        minimumTime: 100
    });
	
	// ================
	// init 
	// ================
	init = function(){
		
		<!-- disbale right click -->
		$(document).bind("contextmenu",function(e){
              return false;
       }); 
		<!-- disable right click -->
		
		
		$("#nav").find("a").each(function(index, element) {
			$(element).wrap('<div class="nav-item"></div>');
            $(element).before('<span class="nav-bg"><span class="nav-bg-left"></span><span class="nav-bg-right"></span></span>');
        });
		
		var $divId = $('nav#nav a:first').attr('href');
		
		$('nav#nav a:first').addClass("navActv");
		
		if(window.location.hash){
		var $hashval = window.location.hash.substring();
		
		$('nav#nav a[href="'+$hashval+'"]').addClass("navActv");
		
			$('nav#nav a[href="'+$hashval+'"]').siblings('a').removeClass("navActv");
			$divId = $hashval;
		}
		
		$('nav#nav a').bind('click',function(event){
		
		var $anchor = $(this);
		
		if($(this).hasClass('navActv')){
			return false;
		}
		else{
			var items = $('nav#nav a');
			
			for(var i=0;i<items.length;i++){
				if($(items[i]).hasClass('navActv')) {
					$(items[i]).removeClass("navActv");
					$(items[i]).parent().find(".nav-bg").animate({top:'-38px'},"fast");
				}
			}
			
			$(this).addClass("navActv");
			
			$('div'+$divId).animate({opacity:0, marginTop:($(window).height())/2-100},1000,'easeInExpo' , function() {
					$('div'+$divId).css({'display':'none'});
					
					$divId = $anchor.attr('href');
					$('div'+$divId).css({'display':'block', 'marginTop':'-360px','opacity':'0'}).delay(400)
					  .animate({opacity:1,marginTop:($(window).height()-120-390)/2},{ duration: 1500, easing: "easeOutExpo" });

					});
							
		}
		
		});
   //  Initialize Backgound Stretcher	   
		$('body').bgStretcher({
			images: ['images/bg/bg1.jpg', 'images/bg/bg2.jpg', 'images/bg/bg3.jpg', 'images/bg/bg4.jpg'],
			imageWidth: 1600, 
			imageHeight: 1067, 
			slideDirection: 'N',
			slideShowSpeed: 800,
			transitionEffect: 'fade',
			sequenceMode: 'normal',
			buttonPrev: '#prev',
			buttonNext: '#next',
			pagination: '#paging',
			anchoring: 'center',
			anchoringImg: 'center'
		});
	}
	init();
	
	// ================
	// Scroll Pane
	// ================
	$('.scroll-pane').jScrollPane();
	
	// ================
	// Nav Menu
	// ================
	nav = {
		init:function(){
			
			$('.nav-item').each(function(index, element) {
                $(element).hover(function(e){
					$(this).find(".nav-bg").animate({top:'0px'},"fast");
				},function(e){
					if($(this).find("a").hasClass("navActv")) return false;
					$(this).find(".nav-bg").animate({top:'-38px'},"fast");
				});
				if($(element).find("a").hasClass("navActv")) $(this).find(".nav-bg").animate({top:'0px'},0);
				
            });
			
			$('#nav').css("margin-left",($(window).width() - 25 - $('#nav').width())/2);
			$("body").css("min-width",$('#nav').width() + 30);
			var marTop = ($(window).height()-120-390)/2;
			
			$('.contBg').css({'marginTop':marTop, 'display':'none'});
			
			$(window).resize(function(){
				$('.contBg').animate({marginTop:($(window).height()-120-390)/2},300);
				$('#nav').css("margin-left",($(window).width() - 25 - $('#nav').width())/2);
			});
		}
	}
	
	nav.init();
	
	// ================
	// Gallery Scroll
	// ================
	gallery = {
		init:function(){
			var positions 	= {0 : '0px', 1 : '218px', 2 	: '436px', 3 	: '658px' }
			
			var items = $("#ps_slider").find(".ps_album");
			var nowInt	= 0;
			var maxNum = items.length;
			var enable = true;
			var isPrev	= true;
			
			function enabledNavBtn(bool){
				
				if(bool == null) nowInt = (isPrev == true) ? (nowInt-1) : (nowInt + 1);
				
				if(nowInt > 0)
				{
					 $("#ps_slider").find(".prev").removeClass("disabled");
				}
				else
				{
					$("#ps_slider").find(".prev").addClass("disabled");
				}
				
				if(nowInt + 4 < maxNum)
				{
					 $("#ps_slider").find(".next").removeClass("disabled");
				}
				else
				{
					$("#ps_slider").find(".next").addClass("disabled");
				}

				enable = false;
			}
			
			items.each(function(index, element) {
                if(index >=4)
				{
					$(element).fadeOut(0);
				}
				else
				{
					$(element).css("left" , positions[index]);
				}
            });
			
			$("#ps_slider").find(".prev").click(function(e) {
				if(enable == true || $(this).hasClass("disabled")) return;
				enable = true;
                isPrev = true;
				moveRight(items[nowInt+3]);
				
            });
			
			$("#ps_slider").find(".next").click(function(e) {
                if(enable == true || $(this).hasClass("disabled")) return;
				enable = true;
				isPrev = false;
				moveLeft(items[nowInt]);
            });
			
			enabledNavBtn(true);
			
			function moveLeft(item){
				$(item).animate({left:'-200px',opacity:0},800,"",moveOther);
			}
			
			function moveRight(item){
				$(item).animate({left:'858px',opacity:0},800,"",moveOther);
			}
			
			function moveOther(params){
				if(isPrev)
					$(items[nowInt+3]).css("display","none");
				else
					$(items[nowInt]).css("display","none");
				
				var j = 0;
				for(var k=0; k<maxNum; k++)
				{
					if(isPrev)
					{
						if(k == nowInt-1)
						{
							$(items[k]).css("left",'-200px');
							$(items[k]).css("display",'block');
							$(items[k]).animate({left:positions[j],opacity:1},800);
							j++;
						}
						else if(j>0 && j<3)
						{
							$(items[k]).animate({left:positions[j],opacity:1},800);
							j++;
						}
						else if(j == 3)
						{
							$(items[k]).animate({left:positions[j],opacity:1},800,"",enabledNavBtn);
							j++;
						}
					}
					else
					{
						if(k == nowInt+1)
						{
							$(items[k]).animate({left:positions[j],opacity:1},800);
							j++;
						}
						else if(j >0 && j<3)
						{
							$(items[k]).animate({left:positions[j],opacity:1},800);
							j++;
						}
						else if(j == 3)
						{
							$(items[k]).css("left",'858px');
							$(items[k]).css("display",'block');
							$(items[k]).animate({left:positions[j],opacity:1},800,"",enabledNavBtn).fadeIn(800);
							j++;
						}
						
					}
					
				}
				
			}
			
			// add prettyPhoto
			
			var items = $(".ps_album");
			for(var k=0;k<items.length; k++){
				$(items[k]).find("a").attr("rel",'prettyPhoto[gallery'+(k+1)+']');
			}
			
			// prettyPhoto			
			$(".ps_slider:first a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'facebook',slideshow:3000, autoplay_slideshow: true});
			
			//$(".ps_slider:gt(0) a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});
		}
	}

	gallery.init();
	
	// ================
	// News,Services
	// ================
	$('#slider1, #slider2').jcarousel({
        wrap: 'circular',
		vertical: true
    });
	
	$('#slider3').jcarousel({
        wrap: 'circular',
    });

	// ================
	// Contact
	// ================
	$("#contact-clear").click(function(){
			$("#contact-name").attr("value","");
			$("#contact-email").attr("value","");
			$("#contact-message").attr("value","");
	});
	
});

$(window).bind('load',function() {
		
		// ================
		// Home slide
		// ================
		$('#slider').nivoSlider({
			captionOpacity: 1,
			controlNav: true
		});
		
		// ================
		// Page div
		// ================
		var $divId = $('nav#nav a:first').attr('href');
		
		if(window.location.hash)
		{
			var $hashval = window.location.hash.substring();
			
			$('nav#nav a[href="'+$hashval+'"]').addClass("navActv");
			
				$('nav#nav a[href="'+$hashval+'"]').siblings('a').removeClass("navActv");
				$divId = $hashval;
		}//end if
			
		$($divId).css({'display':'block', 'marginTop':'-360px','opacity':'0'})
				  .animate({opacity:1,marginTop:($(window).height()-120-390)/2},{ duration: 1500, easing: "easeOutExpo" });

		// ================
		// Footer Setting
		// ================
		var footerHeight = 0,
		footerTop = 0,
		$footer = $("#logoNnav");
		
		positionFooter();
		
		function positionFooter() {
		
			footerHeight = $footer.height();
			footerTop = ($(window).scrollTop()+$(window).height()-footerHeight)+"px";
		
		   if ( ($(document.body).height()+footerHeight) < $(window).height()) {
			   $footer.css({
					position: "absolute"
			   }).css({
					top: footerTop
			   })
		   } else {
			   $footer.css({
					position: "static"
			   })
		   }
		}
		
		$(window)
		   .scroll(positionFooter)
		   .resize(positionFooter)

});