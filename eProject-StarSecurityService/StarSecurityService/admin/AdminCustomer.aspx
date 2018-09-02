<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="~/admin/AdminCustomer.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <span id="tabid" style="display:none">menu3</span>
<html >
<head>
    <title>Customer</title>
    <link href="../css/CSSCustomer.css" rel="stylesheet" type="text/css" /> 
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
            width: 35%;
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
    <ContentTemplate>
        <asp:Label ID="Label10" runat="server" Text="Customer Name: " ForeColor="White"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        &nbsp;&nbsp;<asp:ImageButton ID="btnSearch" runat="server" CausesValidation="False" 
            onclick="Search" Text="Search" Height="32px" ToolTip="Search" ImageUrl="~/images/search.png"/>
&nbsp;<asp:GridView ID="GridView1" runat="server"  Width = "955px"
        AutoGenerateColumns = "False"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="True"
        OnPageIndexChanging = "OnPaging" BorderColor="#5F870E" 
            BorderStyle="Groove" 
            ForeColor="White" PageSize="4" onrowcommand="GridView1_RowCommand" >
    <Columns>
        <asp:BoundField DataField = "CustomerID" HeaderText = "Customer ID" 
            HtmlEncode = "true" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "CustomerName" HeaderText = "Customer Name"  
            HtmlEncode = "true" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "CompanyName" HeaderText = "Company Name"  
            HtmlEncode = "true"> 
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Title" HeaderText="Title" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Address" HeaderText="Address" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="City" HeaderText="City" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Phone" HeaderText="Phone" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:CheckBoxField DataField="Gender" HeaderText="Gender" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:CheckBoxField>
        <asp:TemplateField ItemStyle-Width = "30px">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="sua" Text = "Edit" OnClick = "Edit" 
                    CausesValidation="False"  CommandArgument = "<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="lnkDelete" runat="server" Text = "Delete" 
                    OnClientClick="javascript:return confirm('You really want delete this customer???');" OnClick = "Delete" CausesValidation="False"></asp:LinkButton>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="30px" />
        </asp:TemplateField>
    </Columns> 
    
        <SelectedRowStyle Font-Bold="False" />
    
    <HeaderStyle BackColor="#5F870E" Font-Bold="True" ForeColor="White" 
            BorderColor="#5F870E" BorderStyle="Groove" BorderWidth="4px" />
        <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black" />
    </asp:GridView>
        <br />
        <br />
    <asp:ImageButton ID="btnAdd" runat="server" Text="Add" OnClick = "Add" 
            CausesValidation="False" Height="32px" ToolTip="Add" ImageUrl="~/images/add.png"/>

    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
    <asp:Label Font-Bold = "True" ID = "Label4" runat = "server" 
            Text = "Customer Details" ForeColor="Black" ></asp:Label>
    
<br />
        <table align = "center">
    <tr>
        <td class="style1">
            <asp:Label ID = "Label2" runat = "server" Text = "Customer Name" 
                ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtCustomerName" runat="server" Width="164px" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>    
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtCustomerName" ErrorMessage="Please input Customer Name"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label3" runat = "server" Text = "Company Name" 
                ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtCompanyName" runat="server" Width="164px" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtCompanyName" ErrorMessage="Please input Company"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label5" runat = "server" Text = "Title" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:DropDownList ID="ddlTitle" runat="server" Width="164px"></asp:DropDownList>
        </td>
        <td class="style5">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label6" runat = "server" Text = "Address" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtAddress" runat="server" Width="164px" BorderColor="Black" 
                BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtAddress" ErrorMessage="Please input Address"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label7" runat = "server" Text = "City" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:DropDownList ID="ddlCity" runat="server" Width="164px"></asp:DropDownList>
        </td>
        <td class="style5">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label8" runat = "server" Text = "Phone" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtPhone" runat="server" Width="164px" BorderColor="Black" 
                BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtPhone" ErrorMessage="Please input Phone Number"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtPhone" ErrorMessage="Phone: 10 - 11 Numbers" 
                ValidationExpression="^[0-9]{10,11}$"></asp:RegularExpressionValidator>
            <br />
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label9" runat = "server" Text = "Gender" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:RadioButtonList ID="rblGender" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
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
        </td>
        <td colspan="2">
            <asp:ImageButton ID="btnSave" runat="server" Text="Save" OnClick = "Save" Height="32px" ToolTip="Save" ImageUrl="~/images/save.png"/>
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
    </ContentTemplate> 
    
<Triggers>
    <asp:AsyncPostBackTrigger ControlID = "GridView1" />
    <asp:AsyncPostBackTrigger ControlID = "btnSave" />
</Triggers> 

</asp:UpdatePanel> 
    </form>
</body>
</html>
</asp:Content>