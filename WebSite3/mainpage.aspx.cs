using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("gameNameandID", conn);
        cmd.CommandType = CommandType.StoredProcedure;

       conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        Label listety = new Label();
        listety.Text = "List of games:";
        form1.Controls.Add(listety);

        while (rdr.Read()) {
            string bageebelname = rdr.GetString(rdr.GetOrdinal("name"));
            Int32 bageebelid = rdr.GetInt32(rdr.GetOrdinal("game_ID"));
            form1.Controls.Add(new LiteralControl("<br/><br/>"));


            LinkButton gameidlb = new LinkButton();
            gameidlb.Text = bageebelid.ToString();
            gameidlb.Click += LinkButton1_Click;
            form1.Controls.Add(gameidlb);


            Label gamenamelb = new Label();
            gamenamelb.Text = " " + bageebelname;
            form1.Controls.Add(gamenamelb);

           

        }
    }

     protected void LinkButton1_Click(object sender, EventArgs e){
        LinkButton b = (LinkButton)sender;
        Session["id"] = b.Text;

      //  int id = Int32.Parse(b.Text);
        Response.Write(b.Text);
        //Session["id"] = id;
        Response.Redirect("GameMainPage.aspx");
        
    }
}