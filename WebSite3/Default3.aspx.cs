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
        int a =(int) Session["id"];
        SqlCommand cmd = new SqlCommand("getuser", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        string username = rdr.GetString(rdr.GetOrdinal("e_mail"));
        string content = rdr.GetString(rdr.GetOrdinal("content"));
        string content1 = rdr.GetString(rdr.GetOrdinal("content"));
        conn.Close();
                string connStr1 = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn1 = new SqlConnection(connStr);
        SqlCommand cmd1 = new SqlCommand("DeleteConReview", conn1);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        SqlDataReader rdr1 = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        string x = TextBox1.Text;
        conn.Close();
        string connStr5 = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn5 = new SqlConnection(connStr);
        SqlCommand cmd5 = new SqlCommand("AddGameReview", conn5);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        SqlDataReader rdr5 = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        String review=rdr5.GetString(rdr5.GetOrdinal("content");






    }
}