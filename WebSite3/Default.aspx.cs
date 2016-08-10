using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB1
{
    public partial class _Default : Application
    {
        public static List<string> attributes = new List<string> { "email", "pass", "preferred_game_genre" };
        List<string> data;
        String link;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void processData()
        {
            string[] info = Regex.Split(data[0], special);
            for (int i = 0; i < info.Length; i++)
            {
                String adeek = info[i];
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SetStoredProcedure("login");
            parameters.Add("email", email.Text);
            parameters.Add("password", password.Text);
            SetParameters(true);
            data = Execute(true, attributes);
            if (Success())
            {
                Session["email"] = data[0];
                Response.Write("ya 100 alf Welcome");
            }
        }
    }
}