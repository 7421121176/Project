<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeFile="Services.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
 <span id="tabid" style="display:none">menu3</span>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<form id="form2" runat="server">
<head>
    <title>Services</title>
    <script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.blockUI.js" type="text/javascript"></script>
</head>

<body>
    
        <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" 
             AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
    <asp:GridView ID="GridView1" runat="server"  Width = "955px"
        AutoGenerateColumns = "False"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="True"
        OnPageIndexChanging = "OnPaging" BorderColor="#5F870E" BorderStyle="Groove" 
            ForeColor="White" PageSize="2" onrowcommand="GridView1_RowCommand" >
    <Columns>
        <asp:TemplateField ItemStyle-Width = "30px">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="98px" 
                    ImageUrl='<%# Eval("PhotoPath") %>' Width="151px" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Left" />
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                &nbsp;<asp:Label ID="lblSName" runat="server" Text='<%# Eval("ServiceName") %>' 
                    Font-Bold="True" Font-Size="Large"></asp:Label>
                <br />
                &nbsp;<asp:Label ID="lblSPrice0" runat="server" Text='<%# Eval("Information") %>'></asp:Label>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Price: "></asp:Label>
                &nbsp;<asp:Label ID="lblSPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                <br />
                <br />
                &nbsp;
            </ItemTemplate>
        </asp:TemplateField>
    </Columns> 
    
    <HeaderStyle BackColor="Green" />
        <AlternatingRowStyle BackColor="#C2D69B" ForeColor="Black"  />
    </asp:GridView>
    </form>
</body>
</html>
</asp:Content>