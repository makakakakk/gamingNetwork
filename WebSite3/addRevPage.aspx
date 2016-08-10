<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addRevPage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Label ID="Label1" runat="server" Text="Content of review:"></asp:Label>
        <asp:TextBox ID="meme" runat="server" OnTextChanged="weee"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="b" Text="Submit" />
        <asp:Button ID="Button2" runat="server" Text="Return to main page" PostBackUrl='mainpage.aspx' />
    </form>
</body>
</html>
