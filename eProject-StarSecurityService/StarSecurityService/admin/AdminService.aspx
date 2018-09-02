<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true"  CodeFile="AdminService.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <span id="tabid" style="display:none">menu6</span>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html >
<head>
    <title>Service</title>
    <link href="../css/CSSService.css" rel="stylesheet" type="text/css" /> 
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
        .style8
        {
            width: 125px;
        }
        .style10
        {
            width: 222px;
        }
        .style11
        {
            width: 183px;
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
        <asp:Label ID="Label10" runat="server" Text="Search"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:ImageButton ID="btnSearch" runat="server" CausesValidation="False" 
            Text="Search" onclick="Search" Height="32px" ToolTip="Search" ImageUrl="~/images/search.png"/>
        <br />
        <br />
        &nbsp;
        <br />
    <asp:GridView ID="GridView1" runat="server"  Width = "955px"
        AutoGenerateColumns = "False"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="True"
        OnPageIndexChanging = "OnPaging" BorderColor="#5F870E" BorderStyle="Groove" 
            ForeColor="White" PageSize="2" onrowcommand="GridView1_RowCommand" >
    <Columns>
        <asp:BoundField DataField = "ServiceID" HeaderText = "Service ID" 
            HtmlEncode = "true" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="FunctionName" HeaderText="Function Name" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "ServiceName" HeaderText = "Service Name"  
            HtmlEncode = "true" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "Information" HeaderText = "Information"  
            HtmlEncode = "true"> 
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:N2}" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:TemplateField ItemStyle-Width = "30px" HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="79px" 
                    ImageUrl='<%# Eval("PhotoPath") %>' Width="96px" />
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="sua" CausesValidation="False" 
                    OnClick="Edit" Text="Edit" CommandArgument = "<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                    OnClientClick="javascript:return confirm('You really want delete this service???');" OnClick="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
            <ItemStyle Width="30px" />
        </asp:TemplateField>
    </Columns> 
    
    <HeaderStyle BackColor="Green" />
        <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black"  />
    </asp:GridView>
    <asp:ImageButton ID="btnAdd" runat="server" Text="Add" OnClick = "Add" 
            CausesValidation="False" Height="32px" ToolTip="Add" ImageUrl="~/images/add.png"/>

    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
    <asp:Label Font-Bold = "true" ID = "Label4" runat = "server" Text = "Service Details" ></asp:Label>
    
<br />
        <table align = "center">
    <tr>
        <td class="style8">
            <asp:Label ID = "Label11" runat = "server" Text = "Function" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style10">
            <asp:DropDownList ID="ddlFunction" runat="server" Width="222px">
            </asp:DropDownList>
        </td>
                <td class="style11">
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            <asp:Label ID = "Label2" runat = "server" Text = "Service Name" 
                ForeColor="Black" ></asp:Label>
        </td>
        <td class="style10">
            <asp:TextBox ID="txtServiceName" runat="server" Width="222px" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>    
        </td>
        <td class="style11">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtServiceName" 
                ErrorMessage="Please input Service Name"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style8">
            <asp:Label ID = "Label3" runat = "server" Text = "Information" 
                ForeColor="Black" ></asp:Label>
        </td>
        <td class="style10">
            <asp:TextBox ID="txtInformation" runat="server" Width="222px" Height="80px" 
                style="height: 36px" TextMode="MultiLine" BorderColor="Black" 
                BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
        <td class="style11">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtInformation" 
                ErrorMessage="Please input Information of Service"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style8">
            <asp:Label ID = "Label12" runat = "server" Text = "Price" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style10">
            <asp:TextBox ID="txtPrice" runat="server" Width="222px" BorderColor="Black" 
                BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
        <td class="style11">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtPrice" ErrorMessage="Please input Price"></asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToValidate="txtPrice" ErrorMessage="Price must greater than 0" 
                Operator="GreaterThan" Type="Double" ValueToCompare="0"></asp:CompareValidator>
            <br />
        </td>
    </tr>
    <tr>
        <td class="style8">
            <asp:Label ID = "Label6" runat = "server" Text = "Photo Path" 
                ForeColor="Black" ></asp:Label>
        </td>
        <td class="style10">
            <asp:FileUpload ID="FileUpload1" runat="server" Width="222px" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
        </td>
        <td class="style11">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Only gif, jpeg, png files are allowed!" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.gif|.jpeg|.jpg|.png)$" ControlToValidate="FileUpload1">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;
        </td>
        <td class="style10">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="HiddenField2" runat="server" />
        </td>
        <td class="style11">
        </td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style10">
            <asp:ImageButton ID="btnSave" runat="server" OnClick="Save" Text="Save" Height="32px" ToolTip="Save" ImageUrl="~/images/save.png"/>
            <asp:ImageButton ID="btnCancel" runat="server" Text="Cancel" 
                OnClientClick = "return Hidepopup()" CausesValidation="False" Height="32px" ToolTip="Cancel" ImageUrl="~/images/cancle.png"/>
        </td>
        <td class="style11">
            &nbsp;</td>
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
    </ContentTemplate> 
    


</asp:UpdatePanel> 
    </form>
</body>
</html>
</asp:Content>