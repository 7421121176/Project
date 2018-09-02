<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="admin_Login" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1"> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 108px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:50%;">
            <tr>
                <td colspan="2">
                    User Name&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtusername" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtusername" ErrorMessage="Username incorrect">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    Password</td>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtpassword" ErrorMessage="Password incorrect">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnlogin" runat="server" onclick="btnlogin_Click" Text="Login" 
                        Width="90px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        DisplayMode="List" ShowMessageBox="True" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
</asp:Content>