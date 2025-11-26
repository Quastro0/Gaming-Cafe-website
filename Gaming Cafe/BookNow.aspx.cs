using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Gaming_Cafe
{
    public partial class BookNow : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // ✅ Prevents resetting data on postback
            {
                if (Session["UserEmail"] == null)
                {
                    pnlLoginPrompt.Visible = true;
                    pnlBookingForm.Visible = false;
                }
                else
                {
                    pnlLoginPrompt.Visible = false;
                    pnlBookingForm.Visible = true;
                }
            }
        }

        protected void calDatePicker_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = calDatePicker.SelectedDate.ToString("dd-MM-yyyy"); // ✅ Formats properly
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=BookNow.aspx");
                return;
            }

            string userEmail = Session["UserEmail"].ToString();
            string name = txtName.Text.Trim();
            string gamingType = ddlGamingType.SelectedValue;
            int players;
            int hours;

            // ✅ Validate input fields
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(txtDate.Text) || string.IsNullOrEmpty(txtTime.Text) ||
                !int.TryParse(txtPlayers.Text, out players) || !int.TryParse(ddlHours.SelectedValue, out hours))
            {
                return; // Stop execution if input is invalid
            }

            // ✅ Convert Date Format (From dd-MM-yyyy to yyyy-MM-dd for SQL)
            DateTime selectedDate = DateTime.ParseExact(txtDate.Text, "dd-MM-yyyy", null);
            string date = selectedDate.ToString("yyyy-MM-dd"); // Format properly for SQL

            // ✅ Convert Time Format
            string time = txtTime.Text.Trim(); // Keep as string if DB column is VARCHAR
                                               // string time = DateTime.Parse(txtTime.Text).ToString("HH:mm:ss"); // Use this if Time column is DATETIME

            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "INSERT INTO Bookings (Name, UserEmail, GamingType, Date, Time, Hours, Players) " +
                               "VALUES (@Name, @UserEmail, @GamingType, @Date, @Time, @Hours, @Players)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@UserEmail", userEmail);
                    cmd.Parameters.AddWithValue("@GamingType", gamingType);
                    cmd.Parameters.AddWithValue("@Date", date);
                    cmd.Parameters.AddWithValue("@Time", time);
                    cmd.Parameters.AddWithValue("@Hours", hours);
                    cmd.Parameters.AddWithValue("@Players", players);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                }
            }
        }

    }
}
