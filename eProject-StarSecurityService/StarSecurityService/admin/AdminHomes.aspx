<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminHomes.aspx.cs" Inherits="Default2" Title="Untitled Page" %>

<%-- Add content controls here --%><asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1"> 
    <span id="tabid" style="display:none">menu1</span>
    <form id="form1"  style="width: 947px" title="" runat ="server">
               
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
        <!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Interactive tooltips using CSS3 and jQuery</title>
    <script src="../sricp/jquery-1.js"></script>
    <script>
        $(document).ready(function() {

            // set the wrapper width and height to match the img size
            $('#wrapper').css({ 'width': $('#wrapper img').width(),
                'height': $('#wrapper img').height()
            })

            //tooltip direction
            var tooltipDirection;

            for (i = 0; i < $(".pin").length; i++) {
                // set tooltip direction type - up or down             
                if ($(".pin").eq(i).hasClass('pin-down')) {
                    tooltipDirection = 'tooltip-down';
                } else {
                    tooltipDirection = 'tooltip-up';
                }

                // append the tooltip
                $("#wrapper").append("<div style='left:" + $(".pin").eq(i).data('xpos') + "px;top:" + $(".pin").eq(i).data('ypos') + "px' class='" + tooltipDirection + "'>\
													<div class='tooltip'>" + $(".pin").eq(i).html() + "</div>\
											</div>");
            }

            // show/hide the tooltip
            $('.tooltip-up, .tooltip-down').mouseenter(function() {
                $(this).children('.tooltip').fadeIn(100);
            }).mouseleave(function() {
                $(this).children('.tooltip').fadeOut(100);
            })
        });
    </script>
	<style>
	    
		body {
			text-align: center;
			font: 13px Arial,Helvetica;		
		}
		
		/* Relative positioning*/
		#wrapper {
			position: relative;
			margin: 50px auto 20px auto;
			border: 1px solid #fafafa;
			-moz-box-shadow: 0 3px 3px rgba(0,0,0,.5);
			-webkit-box-shadow: 0 3px 3px rgba(0,0,0,.5);
			box-shadow: 0 3px 3px rgba(0,0,0,.5);
		}
		
		/* Hide the original tooltips contents */
		.pin {
			display: none;
		}
		
		/* Begin styling the tooltips and pins */
		.tooltip-up, .tooltip-down {
			position: absolute;
			background: url(./images/arrow-up-down.png);
			width: 36px;
			height: 52px;
		}
		
		.tooltip-down {
			background-position: 0 -52px;
		}
		
		.tooltip {
			display: none;
			width: 200px;
			cursor: help;
			text-shadow: 0 1px 0 #fff;
			position: absolute;
			top: 10px;
			left: 50%;
			z-index: 999;
			margin-left: -115px;
			padding:15px;
			color: #222;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			border-radius: 5px;
			-moz-box-shadow: 0 3px 0 rgba(0,0,0,.7);
			-webkit-box-shadow: 0 3px 0 rgba(0,0,0,.7);
			box-shadow: 0 3px 0 rgba(0,0,0,.7);
			background: #fff1d3;
			background: -webkit-gradient(linear, left top, left bottom, from(#fff1d3), to(#ffdb90));
			background: -webkit-linear-gradient(top, #fff1d3, #ffdb90);
			background: -moz-linear-gradient(top, #fff1d3, #ffdb90);
			background: -ms-linear-gradient(top, #fff1d3, #ffdb90);
			background: -o-linear-gradient(top, #fff1d3, #ffdb90);
			background: linear-gradient(top, #fff1d3, #ffdb90);			
		}
		
		.tooltip::after {
			content: '';
			position: absolute;
			top: -10px;
			left: 50%;
			margin-left: -10px;
			border-bottom: 10px solid #fff1d3;
			border-left: 10px solid transparent;
			border-right :10px solid transparent;
		}
		
		.tooltip-down .tooltip {
			bottom: 12px;
			top: auto;
		}
		
		.tooltip-down .tooltip::after {
			bottom: -10px;
			top: auto;
			border-bottom: 0;
			border-top: 10px solid #ffdb90;
		}
		
		.tooltip h2 {
			font: bold 1.3em 'Trebuchet MS', Tahoma, Arial,;
			margin: 0 0 10px;
			color:Black;
		}
		
		.tooltip ul {
			margin: 0;
			padding: 0;
			list-style: none;
		}		
	</style>

<body>


   
<div style="left:216px; top:153px" class="tooltip-down">													
<div class="tooltip">	  
	  <h2>
          <asp:Label ID="lbWestern" runat="server" Text="Western" Font-Bold="True"></asp:Label></h2>	  
	  <ul>
		<li>Address:<b>:
            <asp:Label ID="lbWestern2" runat="server" Text="Label"></asp:Label></b> 
            </li>
        <li>Details:<b>:
            <asp:Label ID="lbWestern3" runat="server" Text="Label"></asp:Label></b> 
            </li>    
		<li>Person contact:<b>:
            <asp:Label ID="lbWestern4" runat="server" Text="Label"></asp:Label></b> 
            </li>

	  </ul>
   </div>											</div>
    <div style="left:566px; top:135px" class="tooltip-down">													
    <div style="display: none;" class="tooltip">	  
	  <h2>
          <asp:Label ID="lbEastern" runat="server" Text="Eastern" Font-Bold="True"></asp:Label></h2>	  
	  <ul>
		<li>Address:<b>:
            <asp:Label ID="lbEastern2" runat="server" Text="Label"></asp:Label></b> 
            </li>
        <li>Details:<b>:
            <asp:Label ID="lbEastern3" runat="server" Text="Label"></asp:Label></b> 
            </li>    
		<li>Person contact:<b>:
            <asp:Label ID="lbEastern4" runat="server" Text="Label"></asp:Label></b> 
            </li>
	  </ul>
   </div>											
   </div>
    <div style="left:483px; top:240px" class="tooltip-up">													
        <br />
    <div style="display: none;" class="tooltip">	  
	  <h2>
          <asp:Label ID="lbSouthern" runat="server" Text="Southern" Font-Bold="True"></asp:Label></h2>	  
	  <ul>
		<li>Address:<b>:
            <asp:Label ID="lbSouthern2" runat="server" Text="Label"></asp:Label></b> 
            </li>
        <li>Details:<b>:
            <asp:Label ID="lbSouthern3" runat="server" Text="Label"></asp:Label></b> 
            </li>    
		<li>Person contact:<b>:
            <asp:Label ID="lbSouthern4" runat="server" Text="Label"></asp:Label></b> 
            </li>
	  </ul>

	  </ul __designer:mapid="afd"> 
   </div>											
   </div>
    <div style="left:672px; top:115px" class="tooltip-down">													
    <div style="display: none;" class="tooltip">	  
	  <h2>
          <asp:Label ID="lbNorthern" runat="server" Text="Northern" Font-Bold="True"></asp:Label></h2>	  
	  <ul>
		<li>Address:<b>:
            <asp:Label ID="lbNorthern2" runat="server" Text="Label"></asp:Label></b> 
            </li>
        <li>Details:<b>:
            <asp:Label ID="lbNorthern3" runat="server" Text="Label"></asp:Label></b> 
            </li>    
		<li>Person contact:<b>:
            <asp:Label ID="lbNorthern4" runat="server" Text="Label"></asp:Label></b> 
            </li>
	  </ul>

	  </ul __designer:mapid="afe">
   </div>											
   </div>
   


    <asp:Image ID="Image1" runat="server" Height="440px" 
        ImageUrl="~/images/img1.jpg" Width="1066px" />
   


    <br />
        <asp:ImageButton ID="btnEdit" runat="server" onclick="btnEdit_Click" 
        Height="32px" ToolTip="Edit" ImageUrl="~/images/add.png" />
        </asp:View>
        <br />
        <asp:View ID="View2" runat="server">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                Width="157px">
            </asp:DropDownList>
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Width="188px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Details"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDetail" runat="server" TextMode="MultiLine" Width="188px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Person"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPerson" runat="server" Width="188px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:ImageButton ID="btnSave" runat="server" onclick="btnSave_Click" 
                ToolTip="Save" Height="32px" ImageUrl="~/images/save.png"/>
            &nbsp;&nbsp;
            <asp:ImageButton ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                ToolTip="Cancel" Height="32px" ImageUrl="~/images/cancle.png"/>
        </asp:View>
    </asp:MultiView>
   


</body></html>
</form>
</asp:Content>

