<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true"  CodeFile="AdminOrderDetails.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <span id="tabid" style="display:none">menu5</span>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html >
<head>
    <title>Service</title>
    <link href="../css/CSSOrderDetail.css" rel="stylesheet" type="text/css" /> 
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
            width: 85px;
        }
        .style4
        {
            width: 164px;
        }
        .style5
        {
            width: 167px;
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
        &nbsp;
        <asp:GridView ID="GridView1" runat="server"  Width = "955px"
        AutoGenerateColumns = "False"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="True"
        OnPageIndexChanging = "OnPaging" BorderColor="#5F870E" BorderStyle="Groove" 
            ForeColor="White" PageSize="4" onrowcommand="GridView1_RowCommand" >
    <Columns>
        <asp:BoundField DataField = "OrderDetailID" HeaderText = "OrderDetail ID" 
            HtmlEncode = "true" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="ServiceName" HeaderText="Service" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "Quantity" HeaderText = "Quantity"  
            HtmlEncode = "true" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField = "Total" HeaderText = "Total"  
            HtmlEncode = "true" DataFormatString="{0:N2}"> 
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
            DataFormatString="{0:d}" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" 
            DataFormatString="{0:d}" >
            <HeaderStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="sua" CausesValidation="False" 
                    OnClick="Edit" Text="Edit" CommandArgument = "<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                    OnClick="Delete" Text="Delete" OnClientClick="javascript:return confirm('You really want delete this order???');"></asp:LinkButton>
            </ItemTemplate>
            <ItemStyle Width="30px" />
        </asp:TemplateField>
    </Columns> 
    
    <HeaderStyle BackColor="Green" />
        <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black"  />
    </asp:GridView>
        <br />
    <asp:ImageButton ID="btnAdd" runat="server" OnClick = "Add" 
            CausesValidation="False" Height="32px" ToolTip="Add" ImageUrl="~/images/add.png"/>

    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
    <asp:Label Font-Bold = "true" ID = "Label4" runat = "server" Text = "Order Details" ></asp:Label>
    
<br />
        <table align="center">
            <tr>
                <td class="style1">
                    <asp:Label ID="Label11" runat="server" Text="Service" ForeColor="Black"></asp:Label>
                </td>
                <td class="style4">
                    <asp:DropDownList ID="ddlService" runat="server" Width="222px">
                    </asp:DropDownList>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label2" runat="server" Text="Quantity" ForeColor="Black"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtQuantity" runat="server" Width="222px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtQuantity" ErrorMessage="Please input Quantity"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="txtQuantity" ErrorMessage="Quantity must greater than 0" 
                        Operator="GreaterThan" ValueToCompare="0" Type="Integer"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="Time (datetime)" ForeColor="Black"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtTimeOrder" runat="server" Width="222px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1"></asp:TextBox>
                    </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtTimeOrder" ErrorMessage="Please input Time"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="txtTimeOrder" ErrorMessage="Please input Date" 
                    Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label6" runat="server" Text="Time (months)" ForeColor="Black"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtTime" runat="server" Width="222px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1"></asp:TextBox>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtTime" ErrorMessage="Please input Time"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ControlToValidate="txtTime" ErrorMessage="Time must greater than 0" 
                        Operator="GreaterThan" ValueToCompare="0" Type="Integer"></asp:CompareValidator>
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
        <asp:ImageButton ID="btnBack" runat="server" CausesValidation="False" OnClick="Back" 
             Height="32px" ToolTip="Back to Order table" ImageUrl="~/images/cancle.png"/>
        <br />
        <br />
    </ContentTemplate> 
    


</asp:UpdatePanel> 
    </form>
</body>
</html>
</asp:Content>