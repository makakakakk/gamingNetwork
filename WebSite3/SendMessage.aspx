<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="DB.SendMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Message"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="message" runat="server" Height="52px" Width="201px"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Reciever&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="receiver" runat="server" Width="190px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send" Width="93px" />
    
    </div>
    </form>
</body>
</html>
