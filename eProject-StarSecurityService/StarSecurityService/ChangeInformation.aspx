<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeInformation.aspx.cs" Inherits="ChangePassword" %>
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
   
        &nbsp;
    <br />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
        
          <table align = "center">
        <tr>
            <td class="style1">
                <asp:Label ID="Label6" runat="server" Text="Fullname"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtFullname" runat="server" Width="164px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px" ForeColor="Black"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtFullname" ErrorMessage="Please input Fullname"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label8" runat="server" Text="Gender"></asp:Label>
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
                <asp:Label ID="Label9" runat="server" Text="Address"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtAddress" runat="server" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px" Width="164px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Please input Address"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label10" runat="server" Text="City"></asp:Label>
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
                <asp:Label ID="Label11" runat="server" Text="BirthDate"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtBirthDate" runat="server" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px" Width="164px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
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
                <asp:Label ID="Label13" runat="server" Text="Phone"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtPhone" runat="server" Width="164px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Please input your Phone number"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Phone: 10-11 Numbers" 
                    ValidationExpression="^[0-9]{10,11}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="Email""></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtEmail" runat="server" Width="164px" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please input your Email"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Exam: ttanh022@gmail.com" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label14" runat="server" Text="EduQual"></asp:Label>
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
                <asp:Label ID="Label15" runat="server" Text="Achievements"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtAchievements" runat="server" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px" TextMode="MultiLine" Width="164px"></asp:TextBox>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
</table>  
    
    </div>
            &nbsp;
        </asp:View>
        <asp:View ID="View2" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="18pt" 
            Text="Change Password :"></asp:Label>
        <br />
        <br />
        <br />
        <table align = "center" style="width:100%; height: 116px;">
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
        </asp:View>
        <br />
        <br />
    </asp:MultiView>
    <br />
        <asp:Button ID="Button2" runat="server" onclick="btChange_Click" 
        Text="Save" Width="170px" />
        <br />
        <br />
    <asp:Button ID="Button3" runat="server" onclick="ChangeInfor" 
                Text="Change Information" Width="170px" CausesValidation="False" />
            &nbsp;<asp:Button ID="btChange" runat="server" onclick="ChangePass" 
        Text="Change Password" Width="170px" CausesValidation="False" />
    </form>
    </body>
</html>
</asp:Content>