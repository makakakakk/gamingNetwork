using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB1
{
    public partial class DevSignUp : Application
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SetStoredProcedure("DevTeamSignUp");
            parameters.Add("email", email.Text);
            parameters.Add("password", password.Text);
            parameters.Add("Company", company.Text);
            parameters.Add("teamname", teamname.Text);
            parameters.Add("preferred_game_genre", favgenre.Text);
            parameters.Add("formation_date", fordate.Text);
            SetParameters();
            Execute();
            if (Success())
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}