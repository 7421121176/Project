<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="Companyt" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <form id="form1" runat="server">
    <span id="tabid" style="display:none">menu2</span>
    <p>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:Label ID="Label1" runat="server" 
            
            Text="We are a professional agency providing customized security arrangements to the industrial, commercial, and business houses" 
            ForeColor="White"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" 
            
            Text="Star securities has been one of the pioneers in the Private Security Industry. Set up in 2000, the company has been a thought and knowledge leader since its inception. Through the decade of its existence, Star has endeavored to provide the best security solutions to its customers through innovation, commitment to quality, training and strict compliance to international standards." 
            ForeColor="White"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:image runat="server" Height="200px" ImageUrl="~/images/main.png" 
            Width="800px"></asp:image>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" 
            
            Text="Setup as Investigation firm almost 10 years ago, today the company has grown into a &quot;Total Security Solutions Provider&quot; offering manned guarding (MG), investigations (C&amp;I), electronic security systems (ESS) and cash services (CS) to over 250 corporate customers across 24 states. " 
            ForeColor="White"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" 
            
            Text="Star is an ISO 9001:2000 certified public limited company. Backed by a trained workforce of over 2800 men &amp; supervisors and 100 banded managers, Star delivers premium services with high quality and absolute integrity. " 
            ForeColor="White"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label14" runat="server" 
            
            Text="Star believes in continuously upgrading the quality of our resources and infrastructure to support the ever-changing customer requirements. In pursuance to this, Star wants the security business to implement a state-of-the-art ERP Solution to manage the day-to-day operations of the company. " 
            ForeColor="White"></asp:Label>
             <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="o Chairman of company:" 
            ForeColor="White"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblChairman" runat="server" 
            ForeColor="White"></asp:Label>
        <asp:TextBox ID="txtChairman" runat="server"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Text="o Directors of Company:" ForeColor="White"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblDirectors" runat="server" 
            ForeColor="White"></asp:Label>
    
        <asp:TextBox ID="txtDirectors" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
&nbsp;<asp:ImageButton ID="btnSave" runat="server"  
            onclick="btnSave_Click" Height="32px" ToolTip="Save" ImageUrl="~/images/save.png" />
&nbsp;<asp:ImageButton ID="btnCancel" runat="server" Height="32px" 
            onclick="btnCancel_Click" ToolTip="Cancel" 
            ImageUrl="~/images/cancle.png" />
&nbsp;
        <asp:ImageButton ID="btnEdit" runat="server" Height="32px" 
            onclick="btnEdit_Click" ToolTip="Edit" ImageUrl="~/images/edit.png" Visible="false" />
    
    </p>
    <p>   
    </p>
    <p>
        &nbsp;</p>
    </form>
   </asp:Content>
