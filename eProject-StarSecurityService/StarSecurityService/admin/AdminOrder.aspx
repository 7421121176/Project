<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true"  CodeFile="AdminOrder.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span id="tabid" style="display:none">menu5</span> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html >
<head>
    <title>Service</title>
    <link href="../css/CSSOrder.css" rel="stylesheet" type="text/css" /> 
    <script src="../scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script type = "text/javascript">
    
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function() {
            $("#" + elementID).block({ message: '<table align = "center"><tr><td>' +
     '<img src="images/loadingAnim.gif"/></td></tr></table>',
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
            width: 112px;
        }
        .style4
        {
            width: 164px;
        }
        .style5
        {
            width: 42%;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
        <asp:PostBackTrigger ControlID = "btnSave" />
    </Triggers>
    <ContentTemplate>
        <br />
    <asp:GridView ID="GridView1" runat="server"  Width = "955px"
        AutoGenerateColumns = "False"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="True"
        OnPageIndexChanging = "OnPaging" BorderColor="#5F870E" BorderStyle="Groove" 
            ForeColor="White" PageSize="4" >
    <Columns>
        <asp:BoundField DataField = "OrderID" HeaderText = "OrderID" 
            HtmlEncode = "true" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="CustomerName" HeaderText="Customer" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "Sum" HeaderText = "Sum"  
            HtmlEncode = "true" DataFormatString="{0:N2}" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Date" DataFormatString="{0:d}" 
            HeaderText="Date Contract">
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" 
                    OnClick="Edit" Text="Order Service"></asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                    OnClick="Delete" Text="Delete" OnClientClick="javascript:return confirm('You really want delete this order???');"></asp:LinkButton>
            </ItemTemplate>
            <ItemStyle Width="100px" />
        </asp:TemplateField>
    </Columns> 
    
    <HeaderStyle BackColor="Green" />
        <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black"  />
    </asp:GridView>
    <asp:ImageButton ID="btnAdd" runat="server" Text="Add" OnClick = "Add" 
            CausesValidation="False" Height="32px" ToolTip="Add" ImageUrl="~/images/add.png"/>

    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
    <asp:Label Font-Bold = "true" ID = "Label4" runat = "server" Text = "Select Customer to Order Service" ></asp:Label>
    
<br />
<table align = "center">
    <tr>
        <td class="style1">
            <asp:Label ID = "Label11" runat = "server" Text = "CustomerID" 
                ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:DropDownList ID="ddlCustomer" runat="server" Width="150px">
            </asp:DropDownList>
        </td>
                <td class="style5">
                    <asp:HiddenField ID="HiddenField1" runat="server" />
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
            &nbsp;</td>
        <td colspan="2">
            <asp:ImageButton ID="btnSave" runat="server" OnClick="Save" Text="Save" Height="32px" ToolTip="Save" ImageUrl="~/images/save.png"/>
            <asp:ImageButton ID="btnCancel" runat="server" Text="Cancel" 
                OnClientClick = "return Hidepopup()" CausesValidation="False" Height="32px" ToolTip="Cancel" ImageUrl="~/images/cancle.png"/>
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
        <br />
        
        <br />
    </ContentTemplate> 
    


</asp:UpdatePanel> 
    </form>
</body>
</html>
</asp:Content>