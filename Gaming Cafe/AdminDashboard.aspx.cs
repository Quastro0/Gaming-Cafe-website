using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Gaming_Cafe
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTodayBookings();
            }
        }

        private void LoadTodayBookings()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = @"
                SELECT 
                    BookingID, 
                    Name, 
                    UserEmail, 
                    GamingType, 
                    CONVERT(VARCHAR, Date, 23) AS BookingDate, 
                    FORMAT(CAST([Time] AS DATETIME), 'hh:mm tt') AS BookingTime,  
                    Hours, 
                    Players 
                FROM Bookings 
                WHERE Date = CAST(GETDATE() AS DATE)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Debugging: Print retrieved data
                    foreach (DataRow row in dt.Rows)
                    {
                        Console.WriteLine($"ID: {row["BookingID"]}, Time: {row["BookingTime"]}");
                    }

                    gvTodayBookings.DataSource = dt;
                    gvTodayBookings.DataBind();
                }
            }
        }
    }
}
