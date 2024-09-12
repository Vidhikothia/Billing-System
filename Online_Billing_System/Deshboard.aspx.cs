using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace online_billing_system
{
    public partial class Deshboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Username"] == null)
            {
               
                Response.Redirect("Login.aspx");
            }
            else
            {
               
                string username = Session["Username"].ToString();
                LblWelcomeMessage.Text = $"Welcome, {username}!";
            }
        }
    }
}