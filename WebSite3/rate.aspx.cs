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

    protected void Raaate(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("RateGame", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = conn;
       string s = Session["id"].ToString();
       // string s = "1"; 
       // string u = Session["user"].ToString();
        String u = "ma7shy@yahoo.com";
        cmd.Parameters.Add(new SqlParameter("@game", s));
        cmd.Parameters.Add(new SqlParameter("@mememail", u));

        string uniqueee = uni.Text;
        string graph = gra.Text;
        string interactt = inter.Text;
        string lvldev = lvl.Text;

        if (int.Parse(uniqueee) > 10)
        {
            Response.Write("Pls enter a rating less than 10 for Uniqueness");
            return;
        }
        else
        {
            if (int.Parse(graph) > 10)
            {
                Response.Write("Pls enter a rating less than 10 for Graphics");
                return; 
            }
            else
            {
                if (int.Parse(interactt) > 10)
                {
                    Response.Write("Pls enter a rating less than 10 for Interactivity");
                    return; 
                }
                else
                {
                    if (int.Parse(lvldev) > 10)
                    {
                        Response.Write("Pls enter a rating less than 10 for Level design");
                        return; 
                    }

                }
            }
        }
        cmd.Parameters.Add(new SqlParameter("@gfx", graph));
        cmd.Parameters.Add(new SqlParameter("@lvldes", lvldev));
        cmd.Parameters.Add(new SqlParameter("@interact", interactt));
        cmd.Parameters.Add(new SqlParameter("@unique", uniqueee));
        
        Response.Write("Thank you, your response has been recorded!");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        // conn.Open();
        //SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        //while (rdr.Read())
        //{
        /*
     @gfx int, haydakhalo xD
     @lvldes int, haydakhalo xD
     @interact int,
     @unique int
     AS
     INSERT INTO Rate(game, member_email, graphics, level_design, interactivity, uniqueness)
     GO */

    }

}