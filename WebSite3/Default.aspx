<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DB1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:TextBox ID="email" runat="server">Email</asp:TextBox>
    <asp:TextBox ID="password" runat="server" TextMode="Password">Password</asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
</asp:Content>
