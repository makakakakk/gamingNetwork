<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DevSignUp.aspx.cs" Inherits="DB1.DevSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:TextBox ID="email" runat="server">Email</asp:TextBox>
        <br />
        <asp:TextBox ID="password" runat="server" TextMode="Password">Password</asp:TextBox>
        <br />
        <asp:TextBox ID="favgenre" runat="server">Fav genre</asp:TextBox>
        <br />
        <asp:TextBox ID="teamname" runat="server">Team Name</asp:TextBox>
        <br />
        <asp:TextBox ID="company" runat="server">Company</asp:TextBox>
        <br />
        <asp:TextBox ID="fordate" runat="server">Formation date</asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </p>
    </form>
</body>
</html>
