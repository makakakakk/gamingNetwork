<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Button2_Click(object sender, EventArgs e)
    {

    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form3" runat="server">
   <p>
       <asp:Button ID="Button1" runat="server" Text="Add Game" />
   </p>
    </form>
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
       Text="Delete the Review" />
    </body>
</html>
