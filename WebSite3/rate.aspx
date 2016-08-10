<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rate.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Label ID="Label1" runat="server" Text="To rate this game, please enter a value from 0 to 10 :) "></asp:Label>
        <p>
            <asp:Label ID="unique" runat="server" Text="Uniqueness:"></asp:Label>
            <asp:TextBox ID="uni" runat="server" Height="16px"  Width="54px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="graphics" runat="server" Text="Graphics:"></asp:Label>
            <asp:TextBox ID="gra" runat="server"  Height="16px" Width="45px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Interactvtiy" runat="server" Text="Interactivity:"></asp:Label>
            <asp:TextBox ID="inter" runat="server"  Height="16px" Width="52px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Leveldes" runat="server" Text="Level design:"></asp:Label>
            <asp:TextBox ID="lvl" runat="server" Height="16px" Width="45px"></asp:TextBox>
        </p>
        <asp:Button ID="sub" runat="server" Text="Submit rating" OnClick="Raaate" />
        <p>
            <asp:Button ID="Button1" runat="server" Text ="Back to main page" PostBackUrl="mainpage.aspx" />
        </p>
    </form>
</body>
</html>
