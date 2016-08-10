using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void weee(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        //dool always tehre, conenct to your db...function login on click y3mel keda  


        SqlCommand cmd = new SqlCommand("AddGameReview", conn);
        cmd.CommandType = CommandType.StoredProcedure;
       
        string contentbta3o = meme.Text;
        string s = Session["id"].ToString();
        int x = Int32.Parse(s);

        //string acuser = Session["user"];
        //int x = 1;
        string acuser = "toota@gmail.com";

        cmd.Parameters.Add(new SqlParameter("@gid", x));
        cmd.Parameters.Add(new SqlParameter("@vrid", acuser));
        cmd.Parameters.Add(new SqlParameter("@date", System.DateTime.Now));
        cmd.Parameters.Add(new SqlParameter("@content", contentbta3o));


        conn.Open();
        cmd.Connection = conn;
        cmd.ExecuteNonQuery();
        conn.Close();


    }
    protected void b(object sender, EventArgs e)
    {
        Response.Write("Your review had been submitted.");
        
    }

    

}
