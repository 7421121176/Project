<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true"  CodeFile="AdminVacancy.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <span id="tabid" style="display:none">menu7</span>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html >
<head>
    <title>Vacancy</title>
    <link href="css/CSSVacancy.css" rel="stylesheet" type="text/css" /> 
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
        &nbsp;
        <br />
            <asp:GridView ID="GridView1" runat="server"  Width = "955px"
        AutoGenerateColumns = "False"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="True"
        OnPageIndexChanging = "OnPaging" BorderColor="#5F870E" BorderStyle="Groove" 
            ForeColor="White" PageSize="4" onrowcommand="GridView1_RowCommand" >
    <Columns>
        <asp:BoundField DataField = "VacancyID" HeaderText = "Vacancy ID" 
            HtmlEncode = "true" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "ExprirationDate" HeaderText = "Expriration Date"  
            HtmlEncode = "true" DataFormatString="{0:d}" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "Description" HeaderText = "Description"  
            HtmlEncode = "true"> 
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="EduQual" HeaderText="EduQual" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Salary" HeaderText="Salary" 
            DataFormatString="{0:N2}" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Title" HeaderText="Title " >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkView" runat="server" CausesValidation="False" 
                    OnClick="View" Text="View Register"></asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" 
                    OnClick="Edit" Text="Edit"></asp:LinkButton>
                &nbsp;<br />
                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                    OnClick="Delete" Text="Delete" OnClientClick="javascript:return confirm('You really want delete this vacancy???');"></asp:LinkButton>
            </ItemTemplate>
            <ItemStyle Width="100px" />
        </asp:TemplateField>
    </Columns> 
    
    <HeaderStyle BackColor="Green" />
        <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black"  />
    </asp:GridView>
    <asp:ImageButton ID="btnAdd" runat="server" OnClick = "Add" 
            CausesValidation="False" Height="32px" ToolTip="Add" ImageUrl="~/images/add.png"/>

    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
    <asp:Label Font-Bold = "true" ID = "Label4" runat = "server" Text = "Vacancy Details" ></asp:Label>
    
<br />
<table align = "center">
    <tr>
        <td class="style1">
            <asp:Label ID = "Label11" runat = "server" Text = "Quantity" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtQuantity" runat="server" Width="222px" BorderColor="Black" 
                BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtQuantity" ErrorMessage="Please input Quantity"></asp:RequiredFieldValidator>
                        <br />
            <asp:CompareValidator ID="rfvali" runat="server" 
                ControlToValidate="txtQuantity" ErrorMessage="Quantity must greater than 0" 
                Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label2" runat = "server" Text = "Time" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtExprirationDate" runat="server" Width="222px" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtExprirationDate" 
                ErrorMessage="Please input Time (months)"></asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ControlToValidate="txtExprirationDate" ErrorMessage="Time must greater than or equal 0" 
                        Operator="GreaterThan" ValueToCompare="-1" Type="Integer"></asp:CompareValidator>
            <br />
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label3" runat = "server" Text = "Description" 
                ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtDescription" runat="server" Height="53px" 
                TextMode="MultiLine" Width="222px" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px"></asp:TextBox>
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtDescription" 
                ErrorMessage="Please input Description of Vacancy"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label12" runat = "server" Text = "EduQual" ForeColor="Black" ></asp:Label>
        </td>
        <td class="style4">
            <asp:DropDownList ID="ddlEduQual" runat="server" Width="222px">
            </asp:DropDownList>
        </td>
        <td class="style5">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label13" runat = "server" Text = "Salary" ></asp:Label>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtSalary" runat="server" Width="222px" BorderColor="Black" 
                BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtSalary" ErrorMessage="Please input Salary"></asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                ControlToValidate="txtSalary" ErrorMessage="Salary must greater than 0" 
                Operator="GreaterThan" Type="Double" ValueToCompare="0"></asp:CompareValidator>
            <br />
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID = "Label6" runat = "server" Text = "Title" ></asp:Label>
        </td>
        <td class="style4">
            <asp:DropDownList ID="ddlTitle" runat="server" Width="222px">
            </asp:DropDownList>
        </td>
        <td class="style5">
            <asp:HiddenField ID="txtVacancyID" runat="server" />
            <br />
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
                    <asp:ImageButton ID="btnSave" runat="server" OnClick="Save" Height="32px" ToolTip="Save" ImageUrl="~/images/save.png"/>
                    &nbsp;<asp:ImageButton ID="btnCancel" runat="server" CausesValidation="False" 
                        OnClientClick="return Hidepopup()" Height="32px" ToolTip="Cancel" ImageUrl="~/images/cancle.png"/>
                </td>
    </tr>
</table>
</asp:Panel>

    <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
    <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false"
        PopupControlID="pnlAddEdit" TargetControlID = "lnkFake"
        BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
        &nbsp;<br />
        
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