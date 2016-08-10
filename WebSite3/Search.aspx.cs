using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB1
{
    public partial class Search : Application
    {
        String link;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SetStoredProcedure("NameSearch");
            parameters.Add("gamename", Search1.Text);
            parameters.Add("conName", Search1.Text);
            parameters.Add("commName", Search1.Text);
            parameters.Add("reviewerFName", Search1.Text);
            parameters.Add("reviewerLName", Search1.Text);
            parameters.Add("devName", Search1.Text);
            parameters.Add("NormalFName", Search1.Text);
            parameters.Add("NormalLName", Search1.Text);
            SetOutputParameter("type");
            SetParameters();
            String id = Execute(true, new List<string> { "ID" })[0];
            String type = getOutputValue("type");
            if (type == "NORMAL")
            {
                link = "~/user.aspx?email=" + id;

            }
            else if (type == "GAME")
            {
                Session["id"] = id;
                link = "~/GameMainPage.aspx";
            }
            else if (type == "CONFERENCE")
            {
                ;
            }
            else if (type == "COMMUNITY")
            {
                ;
            }
            else if (type == "REVIWER")
            {
                link = "~/reviewer.aspx?email=" + id;
            }
            else if (type == "DEVELOPMENT")
            {
                link = "~/developer.aspx?email=" + id;
            }
            LinkButton1.Text = id;
            LinkButton1.PostBackUrl = link;

        }
    }
}