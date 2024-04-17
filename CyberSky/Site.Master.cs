using System;
using System.Web.UI;


namespace CyberSky
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {
                LoginLink.Visible = false;
                RegisterLink.Visible = false;
                LogoutLink.Visible = true;
                if (Session["userType"].ToString() == "Admin" && Session["userType"] != null)
                {
                    
                    AdminLink.Visible = true;
                }
                else
                {
                    AdminLink.Visible = false;
                }
               

            }
            else
            {
                
                LoginLink.Visible = true;
                RegisterLink.Visible = true;
                AdminLink.Visible = false;
                LogoutLink.Visible= false;
                CartLink.Visible = false;
                

            }

        }
    }
}