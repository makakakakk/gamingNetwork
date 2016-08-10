<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Your app description page.</h2>
    </hgroup>

    <article>
        <p>        
            Use this area to provide additional information.
        </p>

        <p>        
            Use this area to provide additional information.
        </p>

        <p>        
            Use this area to provide additional information.
        </p>
    </article>

    <aside>
        <h3>Aside Title</h3>
        <p>        
            Use this area to provide additional information.
        </p>
        <ul>
            <li><a runat="server" href="~/">Home</a></li>
            <li>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="game_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="game_ID" HeaderText="game_ID" InsertVisible="False" ReadOnly="True" SortExpression="game_ID" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="release_date" HeaderText="release_date" SortExpression="release_date" />
                        <asp:BoundField DataField="rating" HeaderText="rating" SortExpression="rating" />
                        <asp:BoundField DataField="age_limit" HeaderText="age_limit" SortExpression="age_limit" />
                        <asp:BoundField DataField="development_team_email" HeaderText="development_team_email" SortExpression="development_team_email" />
                        <asp:BoundField DataField="release_conference" HeaderText="release_conference" SortExpression="release_conference" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hahaConnectionString %>" SelectCommand="SELECT * FROM [Games]"></asp:SqlDataSource>
                <a runat="server" href="~/About">About</a></li>
            <li><a runat="server" href="~/Contact">Contact</a></li>
        </ul>
    </aside>
</asp:Content>