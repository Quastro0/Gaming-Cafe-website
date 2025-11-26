using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Gaming_Cafe
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // ✅ Ensures data loads only once
            {
                if (Session["UserEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                LoadUserName(); // ✅ Load the user's name
                LoadBookings();
            }
        }

        private void LoadUserName()
        {
            string userEmail = Session["UserEmail"].ToString();
            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT TOP 1 Name FROM Bookings WHERE UserEmail = @UserEmail";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserEmail", userEmail);
                    object result = cmd.ExecuteScalar(); // ✅ Get the first matching name

                    if (result != null)
                    {
                        lblWelcome.Text = "Welcome, " + result.ToString() + "!"; // ✅ Set welcome message
                    }
                    else
                    {
                        lblWelcome.Text = "Welcome!";
                    }
                }
            }
        }

        private void LoadBookings()
        {
            string userEmail = Session["UserEmail"].ToString();
            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT Name, GamingType, CONVERT(VARCHAR, Date, 105) AS Date,  FORMAT(CAST([Time] AS DATETIME), 'hh:mm tt') AS BookingTime, Hours, Players FROM Bookings WHERE UserEmail = @UserEmail";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserEmail", userEmail);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            gvBookings.DataSource = dt;
                            gvBookings.DataBind();
                            lblNoBookings.Visible = false; // ✅ Hide "No Bookings" label if data exists
                        }
                        else
                        {
                            gvBookings.DataSource = null;
                            gvBookings.DataBind();
                            lblNoBookings.Visible = true; // ✅ Show label when no data
                        }
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // ✅ Logs the user out
            Response.Redirect("Login.aspx");
        }
    }
}
