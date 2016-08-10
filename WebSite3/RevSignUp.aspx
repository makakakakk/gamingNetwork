<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RevSignUp.aspx.cs" Inherits="DB1.RevSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="email" runat="server">Email</asp:TextBox>
        <br />
        <asp:TextBox ID="password" runat="server">Password</asp:TextBox>
        <br />
        <asp:TextBox ID="fname" runat="server">First Name</asp:TextBox>
        <br />
        <asp:TextBox ID="lname" runat="server">Last Name</asp:TextBox>
        <br />
        <asp:TextBox ID="yox" runat="server">Years of Exp</asp:TextBox>
    
        <br />
        <asp:TextBox ID="favgenre" runat="server">Fav Genre</asp:TextBox>
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sign Up" />
    </form>
</body>
</html>
