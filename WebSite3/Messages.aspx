<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="DB.Messages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="sender" HeaderText="sender" SortExpression="sender" />
                <asp:BoundField DataField="date_of_messages" HeaderText="date_of_messages" SortExpression="date_of_messages" />
                <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [sender], [date_of_messages], [content] FROM [Messages] WHERE ([reciever] = @reciever)">
            <SelectParameters>
                <asp:SessionParameter Name="reciever" SessionField="email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
