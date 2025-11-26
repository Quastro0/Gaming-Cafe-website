using System;
using System.Web.UI;

namespace Gaming_Cafe
{
    public partial class AdminLogin : Page
    {
        // ✅ Hardcoded admin credentials
        private const string AdminID = "shanks";
        private const string AdminPassword = "godiswatching";

        protected void Page_Load(object sender, EventArgs e)
        {
            // No need to do anything on page load
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string inputID = txtAdminID.Text.Trim();
            string inputPassword = txtAdminPassword.Text.Trim();

            if (inputID == AdminID && inputPassword == AdminPassword)
            {
                // ✅ Admin authentication successful
                Session["AdminLoggedIn"] = true;
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                // ❌ Invalid credentials
                lblMessage.Text = "Invalid Admin ID or Password!";
            }
        }
    }
}
