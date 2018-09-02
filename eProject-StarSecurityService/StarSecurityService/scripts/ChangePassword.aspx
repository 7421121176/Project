<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 


    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 168px;
        }
        .style2
        {
            width: 159px;
        }
        .style3
        {
            width: 168px;
            height: 24px;
        }
        .style4
        {
            width: 159px;
            height: 24px;
        }
        .style5
        {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="18pt" 
            Text="Change Password :"></asp:Label>
        <br />
        <br />
        <br />
        <table style="width:100%; height: 116px;">
            <tr>
                <td class="style1">
                    ID :</td>
                <td class="style2">
                    <asp:TextBox ID="txtID" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Old Password :</td>
                <td class="style4">
                    <asp:TextBox ID="txtOldpass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    runat="server" 
                    ControlToValidate="txtOldpass"
                    Display ="Dynamic"
                    Font-Size="12pt">
                    <br/>* Old Password is not empty !</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    New Password :</td>
                <td class="style2">
                    <asp:TextBox ID="txtNewpass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtNewpass" 
                        Display ="Dynamic"
                    Font-Size="12pt">
                    <br/>* New password is not empty !</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Confirm New Password :</td>
                <td class="style2">
                    <asp:TextBox ID="txtComfirm" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtComfirm" 
                        Display ="Dynamic"
                    Font-Size="12pt"
                        >* Confirm pass must be similar password !</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    
    
    </div>
    <asp:Button ID="btChange" runat="server" onclick="btChange_Click" 
        Text="Change Password" Width="170px" />
&nbsp;
    </form>
    </body>
</html>
</asp:Content>