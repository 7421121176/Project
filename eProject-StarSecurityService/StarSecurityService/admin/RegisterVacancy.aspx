<%@ Page Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="RegisterVacancy.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <span id="tabid" style="display:none">menu7</span>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <fieldset style="width:515px;">
            <legend> <asp:GridView ID="grEmp" runat="server" HeaderStyle-BackColor = "green" 
                    AllowPaging ="True" AutoGenerateColumns="False"
                   DataKeyNames="RegisID" Width="955px" CellPadding="4" 
                    OnPageIndexChanging = "OnPaging" BorderColor="#5F870E" BorderStyle="Groove" 
                    ForeColor="White">
                   
                    <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black" />
                   
                    <Columns>
                        <asp:BoundField DataField="RegisID" HeaderText="RegisID" Visible="False" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fullname" HeaderText="Fullname"  >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                            DataFormatString="{0:d}"  >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Phone" HeaderText="Phone"  >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" >                                          
                     
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                     
                     <asp:TemplateField HeaderText="CheckAll">
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkSelectAll" runat="server"
                                      AutoPostBack="true"
                                      OnCheckedChanged="chkSelectAll_CheckedChanged"/>Send Mail To All ?
                    </HeaderTemplate>
                        <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server"/>
                        </ItemTemplate>
                     </asp:TemplateField>
                    </Columns>                  
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5F870E" Font-Bold="True" ForeColor="White" 
                        BorderColor="#5F870E" BorderStyle="Ridge" BorderWidth="4px" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle Font-Bold="False" />
                </asp:GridView>
                    </legend>
            <table>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                </table>
            <asp:Button ID="btnSendMail" runat="server" Text="Send Email" OnClick="btnSendMail_Click" /> 
        </fieldset>
    </div>
    </form>
</body>
</html>
</asp:Content>