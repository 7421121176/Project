<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" Title="Untitled Page" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <form id="form1" runat="server">
    <span id="tabid" style="display:none">menu5</span>
    <p>
        <table style="width:100%;" align="center">
            <tr>
                <td style="width: 89px; height: 24px">
                    <asp:Label ID="Label1" runat="server" Text="Name" ForeColor="White"></asp:Label>
                </td>
                <td style="height: 24px; width: 293px">
                    <asp:TextBox ID="txtName" runat="server" Width="224px"></asp:TextBox>
                </td>
                <td style="height: 24px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="Please input your name"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 89px; height: 24px">
                    <asp:Label ID="Label2" runat="server" Text="Email" ForeColor="White"></asp:Label>
                </td>
                <td style="height: 24px; width: 293px">
                    <asp:TextBox ID="txtEmail" runat="server" Width="224px"></asp:TextBox>
                </td>
                <td style="height: 24px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Please input Email"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Exam: ttanh022@gmail.com" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 89px">
                    <asp:Label ID="Label3" runat="server" Text="Comment" ForeColor="White"></asp:Label>
                </td>
                <td style="width: 293px">
                    <asp:TextBox ID="txtComment" runat="server" Height="102px" TextMode="MultiLine" 
                        Width="224px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 89px">
                    &nbsp;
                </td>
                <td style="width: 293px">
                    <asp:ImageButton ID="btnSend" runat="server" Text="Send" onclick="Send" Height="32px" ToolTip="Send" ImageUrl="~/images/add.png"/></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
    </form>
</asp:Content>

