using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB1
{
    public partial class SendMessage : Application
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SetStoredProcedure("sendMessage");
            parameters.Add("sender", Session["email"].ToString());
            parameters.Add("receiver", receiver.Text);
            parameters.Add("content", message.Text);
            SetParameters();
            Execute();
            Response.Write("Message sent successfully");
        }
    }
}