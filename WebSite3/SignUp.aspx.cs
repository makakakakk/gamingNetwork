using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB1
{
    public partial class SignUp : Application
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SetStoredProcedure("NormalSignUp");
            parameters.Add("email", email.Text);
            parameters.Add("password", password.Text);
            parameters.Add("first_name", fname.Text);
            parameters.Add("last_name", lname.Text);
            parameters.Add("date_of_birth", dob.Text);
            parameters.Add("preferred_game_genre", favgenre.Text);
            SetParameters();
            Execute();
            if (Success())
            {
                Response.Redirect("~/Default.aspx");
            }
        }
}
}