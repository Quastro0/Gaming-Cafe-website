using System;
using System.Web;

namespace Gaming_Cafe
{
    public partial class MainTemplate : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Ensure the code runs only once on page load
            {
                if (Session["UserID"] != null) // User is logged in
                {
                    lnkDashboard.Visible = true; // Show Dashboard link
                }
                else
                {
                    lnkDashboard.Visible = false; // Hide Dashboard link
                }
            }
        }
    }
}
