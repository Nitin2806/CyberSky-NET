using System;
using System.Diagnostics;


namespace CyberSky
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["LoggedIn"] = false;
            Session["userId"] = null;
            Session["userType"] = null;
            Session["Username"] = null;
            Session["Email"] = null;
            Session["Address1"] = null;
            Debug.WriteLine("/n Logging out/n");

            Response.Redirect("~/Login.aspx");

        }
        protected void logout_button(object sender, EventArgs e)
        {
            Debug.WriteLine("/n Logging out before postback/n");
        
               

                Session["LoggedIn"] = false;
                Session["userId"] = null;
                Session["userType"] = null;
                Session["Username"] = null;
                Session["Email"] = null;
                Session["Address1"] = null;
            Debug.WriteLine("/n Logging out/n");

            Response.Redirect("~/Login.aspx");

            
        }

    }
}