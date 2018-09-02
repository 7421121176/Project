<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master"  AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1"> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <span id="tabid" style="display:none">menu9</span>
<html>
<head>
    <title></title>
    <style type="text/css">
        .style3
        {
            width: 102px;
        }
        .style4
        {
        }
        .style5
        {
            width: 100px;
        }
        .style2
        {
            width: 93px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="City" />
                                                        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="EduQual" />
                                                        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Title" />
                                                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="3">
                                                    <asp:View ID="View1" runat="server">
                                                        <div>
                                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="18pt" 
                                                                Text="City :"></asp:Label>
                                                            <br />
                                                            <br />
                                                            <table style="width:100%;">
                                                                <tr>
                                                                    <td class="style2">
                                                                        City ID :</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCityID" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style2">
                                                                        Region ID:</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DDLRegionID" runat="server" Height="16px" Width="126px">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <caption>
                                                                    &nbsp;<tr>
                                                                        <td>
                                                                            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style1" colspan="2">
                                                                            <asp:Button ID="btAddNew" runat="server" onclick="btAddNew_Click" 
                                                                                Text="Add New" />
                                                                            &nbsp;&nbsp;&nbsp;
                                                                            <asp:Button ID="btUpdate" runat="server" onclick="btUpdate_Click" 
                                                                                Text="Update" />
                                                                            &nbsp;&nbsp;&nbsp;
                                                                            <asp:Button ID="btCancel" runat="server" onclick="btCancel_Click" 
                                                                                Text="Cancel" />
                                                                            <br />
                                                                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                                                                            &nbsp;<asp:Button ID="btSearch" runat="server" onclick="btSearch_Click" 
                                                                                Text="Search" />
                                                                            <br />
                                                                            <br />
                                                                            <asp:GridView ID="GVCity" runat="server" AllowPaging="True" 
                                                                                AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" 
                                                                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                                                                DataKeyNames="CityID" onrowdeleting="GVCity_RowDeleting" 
                                                                                onrowediting="GVCity_RowEditing" PageSize="4" Width="525px" 
                                                                                onpageindexchanging="GVCity_PageIndexChanging1">
                                                                                <RowStyle ForeColor="#000066" />
                                                                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                                            </asp:GridView>
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                </caption>
                                                            </table>
                                                        </div>
                                                    </asp:View>
                                                    <asp:View ID="View2" runat="server">
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="18pt" 
                                                            Text="EduQual :"></asp:Label>
                                                        <br />
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td class="style3">
                                                                    EduQual ID :
                                                                    <td class="style3">
                                                                        <asp:TextBox ID="txtEduQualID" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style3">
                                                                    EduQual :</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEduQual" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <asp:Button ID="btAddNew2" runat="server" onclick="btAddNew2_Click" 
                                                                        Text="Add New" />
                                                                    &nbsp;&nbsp;&nbsp;
                                                                    <asp:Button ID="btUpdate2" runat="server" onclick="btUpdate2_Click" 
                                                                        Text="Update" />
                                                                    &nbsp;&nbsp;&nbsp;
                                                                    <asp:Button ID="btCancel2" runat="server" onclick="btCancel2_Click" 
                                                                        style="height: 26px" Text="Cancel" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <asp:TextBox ID="txtSearch2" runat="server"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="btSearch2" runat="server" onclick="btSearch2_Click" 
                                                            Text="Search" />
                                                        <asp:GridView ID="GVEduQual" runat="server" AutoGenerateDeleteButton="True" 
                                                            AutoGenerateEditButton="True" CellPadding="4" DataKeyNames="EduQualID" 
                                                            ForeColor="#333333" GridLines="None" onrowdeleting="GVEduQual_RowDeleting" 
                                                            onrowediting="GVEduQual_RowEditing" Width="522px" 
                                                            onpageindexchanging="GVEduQual_PageIndexChanging1">
                                                            <RowStyle BackColor="#EFF3FB" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditRowStyle BackColor="#2461BF" />
                                                            <AlternatingRowStyle BackColor="White" />
                                                        </asp:GridView>
                                                        <br />
                                                        <br />
                                                    </asp:View>
                                                    <asp:View ID="View3" runat="server">
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="18pt" 
                                                            Text="Title :"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td class="style5">
                                                                    Title ID :</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtTitleID" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style5">
                                                                    Title :</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style4" colspan="2">
                                                                    <asp:Button ID="btAddNew3" runat="server" onclick="btAddNew3_Click" 
                                                                        Text="Add New" />
                                                                    &nbsp;&nbsp;&nbsp;
                                                                    <asp:Button ID="btUpdate3" runat="server" onclick="btUpdate3_Click" 
                                                                        Text="Update" />
                                                                    &nbsp;&nbsp;&nbsp;
                                                                    <asp:Button ID="btCancel3" runat="server" onclick="btCancel3_Click" 
                                                                        Text="Cancel" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:TextBox ID="txtSearch3" runat="server"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="btSearch3" runat="server" onclick="btSearch3_Click" 
                                                            Text="Search" />
                                                        <br />
                                                        <asp:GridView ID="GVTitle" runat="server" AutoGenerateDeleteButton="True" 
                                                            AutoGenerateEditButton="True" CellPadding="4" DataKeyNames="TitleID" 
                                                            ForeColor="#333333" GridLines="None" onrowdeleting="GVTitle_RowDeleting" 
                                                            onrowediting="GVTitle_RowEditing" Width="526px" 
                                                            onpageindexchanging="GVTitle_PageIndexChanging">
                                                            <RowStyle BackColor="#EFF3FB" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditRowStyle BackColor="#2461BF" />
                                                            <AlternatingRowStyle BackColor="White" />
                                                        </asp:GridView>
                                                        <br />
                                                    </asp:View>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <asp:View ID="View4" runat="server">
                                                        
                                                    </asp:View>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                </asp:MultiView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    </form>
</body>
</html>
</asp:Content>