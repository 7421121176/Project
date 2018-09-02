<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true"  CodeFile="AdminEmployee.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <span id="tabid" style="display:none">menu4</span>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html >
<head>
    <title>Employee</title>
    <link href="../css/CSSEmployee.css" rel="stylesheet" type="text/css" /> 
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
            width: 100px;
        }
        .style2
        {
            width: 100px;
            height: 22px;
        }
        .style3
        {
            height: 22px;
            width: 195px;
        }
        .style7
        {
            width: 191px;
        }
        .style8
        {
            height: 22px;
            width: 191px;
        }
        .style9
        {
            width: 195px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Label ID="Label17" runat="server" Text="Search"></asp:Label>
        &nbsp;<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:ImageButton ID="btnSearch" runat="server" CausesValidation="False" 
            onclick="Search" Text="Search" Height="32px" ToolTip="Search" ImageUrl="~/images/search.png"/>
        <br />
        <br />
    <asp:GridView ID="GridView1" runat="server"  Width = "955px"
        AutoGenerateColumns = "False"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="True"
        OnPageIndexChanging = "OnPaging" BorderColor="#5F870E" BorderStyle="Groove" 
            ForeColor="White" PageSize="4" onrowcommand="GridView1_RowCommand" >
    <Columns>
        <asp:BoundField DataField = "EmployeeID" HeaderText = "Employee ID" 
            HtmlEncode = "true" />
        <asp:BoundField DataField = "Fullname" HeaderText = "Full name"  
            HtmlEncode = "true" />
        <asp:BoundField DataField="Title" HeaderText="Title" />
        <asp:CheckBoxField DataField="Gender" HeaderText="Gender" />
        <asp:BoundField DataField="Address" HeaderText="Address" />
        <asp:BoundField DataField="City" HeaderText="City" />
        <asp:BoundField DataField = "BirthDate" HeaderText = "Birth Date"  
            HtmlEncode = "true" DataFormatString="{0:d}"/> 
        <asp:BoundField DataField="HireDate" HeaderText="Hire Date" 
            DataFormatString="{0:d}" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" />
        <asp:BoundField DataField="Email" HeaderText="Email">
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="EduQual" HeaderText="EduQual" />
        <asp:BoundField DataField="Achievements" HeaderText="Achievements" />
        <asp:TemplateField ItemStyle-Width = "30px">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="sua" Text = "Edit" OnClick = "Edit" 
                    CausesValidation="False" CommandArgument = "<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                    OnClientClick="javascript:return confirm('You really want delete this employee???');" onclick="Delete">Delete</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle Width="30px" />
        </asp:TemplateField>
    </Columns> 
    
    <HeaderStyle BackColor="#5F870E" BorderColor="#5F870E" BorderStyle="Groove" 
            BorderWidth="4px" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black"  />
    </asp:GridView>
    <asp:ImageButton ID="btnAdd" runat="server" Text="Add" OnClick = "Add" 
            CausesValidation="False" Height="32px" ToolTip="Add" ImageUrl="~/images/add.png"/>

    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
    <asp:Label Font-Bold = "true" ID = "Label4" runat = "server" Text = "Employee Details" ></asp:Label>
    
<br />
        <table align = "center">
        <tr>
            <td class="style1">
                <asp:Label ID="Label6" runat="server" Text="Fullname" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtFullname" runat="server" Width="164px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px" ForeColor="Black"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtFullname" ErrorMessage="Please input Fullname"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label7" runat="server" Text="Title" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:DropDownList ID="ddlTitle" runat="server" Width="164px">
                </asp:DropDownList>
            </td>
            <td class="style9">
                </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label8" runat="server" Text="Gender" ForeColor="Black"></asp:Label>
            </td>
            <td class="style8">
                <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label9" runat="server" Text="Address" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtAddress" runat="server" Width="164px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Please input Address"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label10" runat="server" Text="City" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:DropDownList ID="ddlCity" runat="server" Width="164px">
                </asp:DropDownList>
            </td>
            <td class="style9">
                </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label11" runat="server" Text="BirthDate" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtBirthDate" runat="server" Width="164px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtBirthDate" ErrorMessage="Please input your BirthDay"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtBirthDate" ErrorMessage="Please input Date" 
                    Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label13" runat="server" Text="Phone" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtPhone" runat="server" Width="164px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Please input your Phone number"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Phone: 10-11 Numbers" 
                    ValidationExpression="^[0-9]{10,11}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label1" runat="server" Text="Email" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtEmail" runat="server" Width="164px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please input your Email"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Exam: ttanh022@gmail.com" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label14" runat="server" Text="EduQual" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:DropDownList ID="ddlEduQual" runat="server" Width="164px">
                </asp:DropDownList>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label15" runat="server" Text="Achievements" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtAchievements" runat="server" Width="164px" 
                    TextMode="MultiLine" BorderColor="Black" BorderStyle="Solid" 
                    BorderWidth="1px"></asp:TextBox>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label16" runat="server" Text="Role" ForeColor="Black"></asp:Label>
            </td>
            <td class="style7">
                <asp:DropDownList ID="ddlRole" runat="server" Width="164px">
                </asp:DropDownList>
            </td>
            <td class="style9">
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
    <td>
        &nbsp;</td>
    <td class="style7">
        <asp:ImageButton ID="btnSave" runat="server" OnClick="Save" Text="Save" Height="32px" ToolTip="Save" ImageUrl="~/images/save.png"/>
        <asp:ImageButton ID="btnCancel" runat="server" CausesValidation="False" 
            OnClientClick="return Hidepopup()" Text="Cancel" Height="32px" ToolTip="Cancel" ImageUrl="~/images/cancle.png"/>
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