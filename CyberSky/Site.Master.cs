using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

            }
            else
            {
                LoginLink.Visible = true;
                RegisterLink.Visible = true;
                AdminLink.Visible = false;
                CartLink.Visible = false;

            }

        }
    }
}