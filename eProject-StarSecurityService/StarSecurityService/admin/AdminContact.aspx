<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true"  CodeFile="AdminContact.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content15" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <span id="tabid" style="display:none">menu8</span>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
    <title>Contact</title>
    <link href="../css/CSSContact.css" rel="stylesheet" type="text/css" /> 
    <script src="../scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script type = "text/javascript">

        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function() {
                $("#" + elementID).block({ message: '<table align = "center"><tr><td>' +
     '<img src="../images/loadingAnim.gif"/></td></tr></table>',
                    css: {},
                    overlayCSS: { backgroundColor: '#000000', opacity: 0.6
                    }
                });
            });
            prm.add_endRequest(function() {
                $("#" + elementID).unblock();
            });
        }
        $(document).ready(function() {

            BlockUI("<%=pnlAddEdit.ClientID %>");
            $.blockUI.defaults.css = {};
        });
        function Hidepopup() {
            $find("popup").hide();
            return false;
        }
    </script> 
    <style type="text/css">
        .style1
        {
            width: 100px;
        }
        .style7
        {
            width: 252px;
        }
        </style>
</head>

<body>
   <form id="form1" runat="server" >
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        &nbsp;&nbsp;&nbsp;
        <br />
    <asp:GridView ID="GridView1" runat="server"  Width = "771px"
        AutoGenerateColumns = "False"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="True"
        OnPageIndexChanging = "OnPaging" PageSize="4" BorderColor="#5F870E" 
            BorderStyle="Groove" ForeColor="White" >
    <Columns>
        <asp:BoundField DataField="ContactID" HeaderText="No.">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="150px" />
        </asp:BoundField>
        <asp:BoundField DataField="Fullname" HeaderText="Full name" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="500px" />
        </asp:BoundField>
        <asp:BoundField DataField="Email" HeaderText="Email">
            <HeaderStyle Width="300px" HorizontalAlign="Left" />
            <ItemStyle Width="300px" />
        </asp:BoundField>
        <asp:BoundField DataField="Time" HeaderText="Time" DataFormatString="{0:d}" >
            <HeaderStyle Width="300px" HorizontalAlign="Left" />
            <ItemStyle Width="300px" />
        </asp:BoundField>
        <asp:BoundField DataField="Comment" HeaderText="Comment" >
            <HeaderStyle Width="800px" HorizontalAlign="Left" />
            <ItemStyle Height="80px" Width="800px" />
        </asp:BoundField>
        <asp:CheckBoxField DataField="Status" HeaderText="Reply" >
            <HeaderStyle Width="80px" HorizontalAlign="Left" />
            <ItemStyle Width="80px" />
        </asp:CheckBoxField>
        <asp:TemplateField ItemStyle-Width = "30px">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" Text = "Reply" OnClick = "Edit" 
                    CausesValidation="False"></asp:LinkButton>
                &nbsp;
            </ItemTemplate>
            <HeaderStyle Width="80px" />
            <ItemStyle Width="80px" />
        </asp:TemplateField>
    </Columns> 
    
    <HeaderStyle BackColor="#5F870E" BorderColor="#5F870E" BorderStyle="Groove" 
            BorderWidth="4px" ForeColor="White" />
        <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black"  />
    </asp:GridView>

    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
    <asp:Label Font-Bold = "true" ID = "Label4" runat = "server" Text = "Reply Contact" ></asp:Label>
    
<br />
 
<table align = "center" border="1">
             <tr>
                 <td class="style1">
                     <asp:Label ID="Label16" runat="server" Text="Title" ForeColor="Black"></asp:Label>
                 </td>
                 <td class="style7">
                     <asp:TextBox ID="txtTitle" runat="server" Width="250px" BorderColor="Black" 
                         BorderStyle="Outset" BorderWidth="1px"></asp:TextBox>
                 </td>
                 <td>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                         ControlToValidate="txtTitle" ErrorMessage="Please input Title"></asp:RequiredFieldValidator>
                 </td>
             </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label15" runat="server" Text="Reply" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtReply" runat="server" Width="282px" 
                    TextMode="MultiLine" Height="221px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtReply" ErrorMessage="Please input Reply Comment"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
        <td class="style1">
        &nbsp;
        </td>
        <td colspan="2">
        </td>
    </tr>
         <tr>
                <td class="style1">
                </td>
                <td colspan="2">
                    <asp:ImageButton ID="btnSend" runat="server" Height="32px" OnClick="Send" Text="Send" ToolTip="Send" ImageUrl="~/images/save.png"/>
                    <asp:ImageButton ID="btnCancel" runat="server" CausesValidation="False" Height="32px" ToolTip="Cancel" 
            ImageUrl="~/images/cancle.png" 
                        OnClientClick="return Hidepopup()" Text="Cancel" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HiddenField ID="txtEmail" runat="server" />
                </td>
                <td>
                    <asp:HiddenField ID="txtContactID" runat="server" />
                </td>
            </tr>
</table>
</asp:Panel>

    <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
    <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false"
        PopupControlID="pnlAddEdit" TargetControlID = "lnkFake"
        BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>      
        <br />
         

    </ContentTemplate> 
    
<Triggers>
    <asp:AsyncPostBackTrigger ControlID = "GridView1" />
    <asp:AsyncPostBackTrigger ControlID = "btnSend" />
</Triggers> 

</asp:UpdatePanel> 




    </form>
</body>
</html>
</asp:Content>