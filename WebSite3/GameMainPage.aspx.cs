using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class GameMainPage : System.Web.UI.Page
{
    DropDownList rec = new DropDownList();
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("viewGame", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = conn;

        //Session["id"] = 1;
        //dah im trying something xD 3shan at2aked enno shaghal xD
        // string s = Session["id"].ToString();
        string s =Session["id"].ToString();
        int ss = Int32.Parse(s);

        cmd.Parameters.Add(new SqlParameter("@gameID", ss));
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (rdr.Read())
        {
            string gamez = rdr.GetString(rdr.GetOrdinal("name"));
            Label lbl_gamez = new Label();
            lbl_gamez.Text = "Game name: " + gamez + "  <br/><br/> ";
            form1.Controls.Add(lbl_gamez);

            DateTime releaseDate = rdr.GetDateTime(rdr.GetOrdinal("release_date"));
            Label lbl_rel = new Label();
            lbl_rel.Text = "Release date: " + releaseDate + "  <br/><br/> ";
            form1.Controls.Add(lbl_rel);

            Int32 age = rdr.GetInt32(rdr.GetOrdinal("age_limit"));
            //String type = rdr.GetString(rdr.GetOrdinal("age_limit"));

            Label lbl_age = new Label();
            lbl_age.Text = "Age limit: " + age + "  <br/><br/> ";
            form1.Controls.Add(lbl_age);

            Int32 rating = rdr.GetInt32(rdr.GetOrdinal("rating"));
            Label lbl_rate = new Label();
            lbl_age.Text = "Overall rating: " + rating + "  <br/><br/> ";
            form1.Controls.Add(lbl_rate);

            String devteamemail = rdr.GetString(rdr.GetOrdinal("development_team_email"));
            Label lbl_dev = new Label();
            lbl_dev.Text = "Development team:" + devteamemail + " <br/> <br/> ";
            form1.Controls.Add(lbl_dev);

            String sshots = rdr.GetString(rdr.GetOrdinal("sslink"));
            Label lbl_ss = new Label();
            lbl_ss.Text = "Screenshot link: " + sshots + " <br/> <br/> ";
            form1.Controls.Add(lbl_ss);

            String videos = rdr.GetString(rdr.GetOrdinal("vidlink"));
            Label lbl_vid = new Label();
            lbl_vid.Text = "Video link: " + videos + "  <br/><br/> ";
            form1.Controls.Add(lbl_vid);
            //conn.Close();

            SqlCommand cmd2 = new SqlCommand("geebelrev", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Connection = conn;

            string y = Session["id"].ToString();

            cmd2.Parameters.Add(new SqlParameter("@gameID", y));
            // conn.Open();
            SqlDataReader rdr2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);

            Label lbl_rev = new Label();
            lbl_rev.Text = "List of reviews: " + "<br/><br/>";
            form1.Controls.Add(lbl_rev);

            while (rdr2.Read())
            {

                Int32 rev = rdr2.GetInt32(rdr2.GetOrdinal("game_review_ID"));
                String cont = rdr2.GetString(rdr2.GetOrdinal("content"));
                LinkButton lbrev = new LinkButton();
                lbrev.Text = rev+"";
                lbrev.Click += LinkButton2_Click;
                form1.Controls.Add(lbrev);

                Label esm = new Label();
                esm.Text = cont + "  <br/> ";
                form1.Controls.Add(esm);

            }
            //conn.Close();
            form1.Controls.Add(new LiteralControl("<br/><br/>"));

            Button bt = new Button();
            bt.Text = "Rate this game";
            //bt.ID = Session[user];
            //bt.Click += new EventHandler(addRate);
            bt.Click += addRate;
            form1.Controls.Add(bt);


            Label reco = new Label();
            reco.Text =  "<br/> <br/>" + "Recommend this game to:";
            form1.Controls.Add(reco);

            //rec.Visible{; true };
            
            
            SqlCommand cmd3 = new SqlCommand("normalEmail", conn);
            cmd3.CommandType = CommandType.StoredProcedure;
            cmd3.Connection = conn;
            
            //string y = Session["id"].ToString();

            //cmd2.Parameters.Add(new SqlParameter("@gameID", y));
            // conn.Open();
            SqlDataReader rdr3 = cmd3.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr3.Read())
            {
                String name = rdr3.GetString(rdr3.GetOrdinal("email"));

                rec.Items.Add(name);
                form1.Controls.Add(rec);
            }

            Session["elekhtarto"] =  rec.SelectedItem.ToString();
            //Response.Write(rec.SelectedItem.ToString());

            Button done = new Button();
            done.Text = "Recommend!";
            done.Click += recFun;
            form1.Controls.Add(done);

            form1.Controls.Add(new LiteralControl("<br/><br/>"));

            Button revadd = new Button();
            revadd.Text = "Add a review";
            revadd.Click += addRev;
            form1.Controls.Add(revadd);
        }
    }

    private void addRev(object sender, EventArgs e)
    {
        Response.Redirect("addRevPage");
        //throw new NotImplementedException();
    }

    private void recFun(object sender, EventArgs e)
    {   //recommend thingy w then 3yza response 
        //spGameRecommended
        string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("spGameRecommended", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = conn;
        string s = Session["id"].ToString();
        string ee = rec.SelectedItem.ToString();    
        //string s = "1";
        //string u = Session["user"].ToString();
        string u = "wednoshaklahawe7esh@hotmail.com";
        cmd.Parameters.Add(new SqlParameter("@myemail", u));
        cmd.Parameters.Add(new SqlParameter("@emailuser", ee));
        cmd.Parameters.Add(new SqlParameter("@game_ID", s));

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("You recommended this game to user " + ee);

    }

      

    /*   if (Session["user"] == "verified rev") {
          
      */

    private void addRate(object sender, EventArgs e)
    {
        // throw new NotImplementedException();
        // String id = ((Button)sender).ID;
        Response.Redirect("rate.aspx");
    }

private void LinkButton2_Click(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
        LinkButton b = (LinkButton)sender;
        Session["review"] = b.Text;
        Response.Redirect("elreviewpage.aspx");
    }



}

  

    /*protected void addRev(object sender, EventArgs e)
    {
        // String id = ((Button)sender).ID;
        Response.Redirect("addRevPage.aspx");
       
        //visable thingy fl html page xD 
    }*/
