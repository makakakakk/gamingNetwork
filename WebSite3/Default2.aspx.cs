using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class conferences : System.Web.UI.Page
{
    
public  string Button1 { get; set; }private object gamenamelb;
protected void Page_Load(object sender, EventArgs e)
{
    string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
    SqlConnection conn = new SqlConnection(connStr);
    SqlCommand cmd = new SqlCommand("getDvp", conn);
    cmd.CommandType = CommandType.StoredProcedure;
    conn.Open();
    SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

    string conferencesName = rdr.GetString(rdr.GetOrdinal("cnfname"));
    string conferencesPlace = rdr.GetString(rdr.GetOrdinal("cnfplace"));
    DateTime conferencesDate = rdr.GetDateTime(rdr.GetOrdinal("cnfdate"));

    while (rdr.Read())
    {
        String dvpName = rdr.GetString(rdr.GetOrdinal("devolepment_team_name"));
        String gameName = rdr.GetString(rdr.GetOrdinal("game_name"));
        Int32 gameID = rdr.GetInt32(rdr.GetOrdinal("game_id"));
        LinkButton gameIDlb = new LinkButton();
        gameIDlb.Text = " " + " " + conferencesPlace + " ";
        form3.Controls.Add(gameIDlb);
    }
    Session["id2"] = gamenamelb;

    conn.Close();



    string connStr1 = ConfigurationManager.ConnectionStrings["mena"].ToString();
    SqlConnection conn1 = new SqlConnection(connStr1);
    SqlCommand cmd1 = new SqlCommand("getReviewsname", conn1);
    cmd1.CommandType = CommandType.StoredProcedure;
    conn.Open();
    int reviewID;
    while (rdr.Read())
    {
        reviewID = rdr.GetInt32(rdr.GetOrdinal("review_conferece_ID"));


    }
    form3.Controls.Add(gamenamelb);
    conn.Close();
    Session["id"] = reviewID;
    Response.Redirect("Default3.aspx.cs");
    string connStr3 = ConfigurationManager.ConnectionStrings["mena"].ToString();
    SqlConnection conn3 = new SqlConnection(connStr);
    SqlCommand cmd3 = new SqlCommand("spADDgame", conn1);
    cmd.CommandType = CommandType.StoredProcedure;
    conn.Open();
    SqlDataReader rdr1 = cmd.ExecuteReader(CommandBehavior.CloseConnection);
    string x = Button1;
    String gamename = rdr1.GetString(rdr1.GetOrdinal("gamename"));
    Int32 gameID1 = rdr1.GetInt32(rdr1.GetOrdinal("game_ID"));
    DateTime releaseDate = rdr1.GetDateTime(rdr1.GetOrdinal("realease_Date"));
    Int32 agelimit = rdr1.GetInt32(rdr1.GetOrdinal("age"));
    conn.Close();


}
    }


