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
    //TextBox waaa = new TextBox();

    protected void Page_Load(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("revPage", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string s = Session["id"].ToString();
        string y = Session["review"].ToString();

        int r = Int32.Parse(y);
        int g = Int32.Parse(s);
        //int r = 1;
        //int g = 1;
        cmd.Parameters.Add(new SqlParameter("@gameID", g));
        cmd.Parameters.Add(new SqlParameter("@revID", r));

        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr.Read())
        {

            Label revvv = new Label();
            revvv.Text = r + " ";
            form1.Controls.Add(revvv);

            String reveecon = rdr.GetString(rdr.GetOrdinal("content"));
            String reewr = rdr.GetString(rdr.GetOrdinal("verified_reviewer"));

            Label recon = new Label();
            revvv.Text = "Content of review: " + reveecon;
            form1.Controls.Add(recon);

            Label rewrite = new Label();
            rewrite.Text = "<br/> Review written by:  " + reewr;
            form1.Controls.Add(rewrite);

            //////////////////////////////////////////////

            SqlCommand cmd2 = new SqlCommand("revpage2", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Connection = conn;


            cmd2.Parameters.Add(new SqlParameter("@gameID", g));
            cmd2.Parameters.Add(new SqlParameter("@revID", r));
            // conn.Open();
            SqlDataReader rdr2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);

            Label lbl_com = new Label();
            lbl_com.Text = "<br/> Comments on this review: " + "<br/> <br/>";
            form1.Controls.Add(lbl_com);

            while (rdr2.Read())
            {
                Int32 cid = rdr2.GetInt32(rdr2.GetOrdinal("comment_ID"));
                String mem = rdr2.GetString(rdr2.GetOrdinal("member"));
                String mcon = rdr2.GetString(rdr2.GetOrdinal("comcon"));

                Label num = new Label();
                num.Text = cid + "<br/>";
                Label cont = new Label();
                cont.Text = "content: " + mcon + "<br/>";
                Label memm = new Label();
                memm.Text = "written by: " + mem + "<br/><br/>";

                form1.Controls.Add(num);
                form1.Controls.Add(cont);
                form1.Controls.Add(memm);
                /*Int32 gamenumber = rdr.GetInt32(rdr.GetOrdinal("game"));
                Label lbl_num = new Label();
                lbl_num.Text = "Review number: " + revnumber + "  for game number: " + gamenumber + " <br/> ";
                form1.Controls.Add(lbl_num);

                string revname = rdr.GetString(rdr.GetOrdinal("verified_reviewer"));
                LinkButton lbl_namee = new LinkButton();
                lbl_namee.Text = "Review written by: " + revname + "  <br/> ";
                lbl_namee.Click += new EventHandler(LinkButton3_Click);
                form1.Controls.Add(lbl_namee);

                string revitself = rdr.GetString(rdr.GetOrdinal("content"));
                Label lbl_revit = new Label();
                lbl_revit.Text = "The review: " + revitself + "  <br/> ";
                form1.Controls.Add(lbl_revit);

                //momken hena a3mel proc bygeeb el comments bas w a7oto? bas ba7oto ezay?

                while (rdr.Read())
            {
                string con = rdr.GetString(rdr.GetOrdinal("content"));
                Label lbl_con = new Label();
                lbl_con.Text = "Comment: " + con + "  <br/> ";
                form1.Controls.Add(lbl_con);

                string writenby = rdr.GetString(rdr.GetOrdinal("member"));
                LinkButton lbl_writ = new LinkButton();
                lbl_writ.Text = "Written by: " + writenby + "  <br/> ";
                lbl_writ.Click += new EventHandler(LinkButton3_Click);

                form1.Controls.Add(lbl_writ);
                }
                        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string id = ((LinkButton)sender).ID;
            Session["bleh"] = id;
          //  Response.Redirect("userwatever.aspx")
        }
                */


            }

        }
        Button add = new Button();
        add.Text = "Add comment";
        add.Click += addComment;
        form1.Controls.Add(add);



    }

    protected void addComment(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("AddGameReviewComment", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        //string s = Session["id"].ToString();
        string y = Session["review"].ToString();
        //string z = Session["user"].ToString();
        //int r = Int32.Parse(y);
        //int g = Int32.Parse(s);
        int r = Int32.Parse(y);
        string u = "toota@gmail.com";
        //  cmd.Parameters.Add(new SqlParameter("@content"));

        //SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        //        while (rdr.Read())
        //      {
        cmd.Parameters.Add(new SqlParameter("@memberid", u));
        cmd.Parameters.Add(new SqlParameter("@reviewid", r));
        waaa.Visible = true;
        string cont = waaa.Text;
        cmd.Parameters.Add(new SqlParameter("@content", cont));
        //form1.Controls.Add(waaa);

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        Button sub = new Button();
        sub.Text = "Submit!";
        sub.Click += sasa;
        //Button sub = new Button();
        // sub.Text = "Submit!";
        // sub.Click += sasa;
        //return sub;
        form1.Controls.Add(sub);

    }

    protected void sasa(object sender, EventArgs e)
    {
        Response.Write("yay you!");
        waaa.Visible = false;

        Button del = new Button();
        del.Text = "Delete comment :(";
       // del.Click += dell;
        form1.Controls.Add(del);
    }

    /*protected void dell(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["mena"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("DeleteGameReviewComment", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@grcid", cid));


    }
*/ 
}
//  String reveecon = rdr.GetString(rdr.GetOrdinal("content"));

//    }



