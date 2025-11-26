using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gaming_Cafe
{
    public partial class AdminBookings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllBookings();
            }
        }

        protected void gvAllBookings_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAllBookings.PageIndex = e.NewPageIndex;
            LoadAllBookings(); // Reload the data for the new page
        }

        private void LoadAllBookings()
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
        ORDER BY Date DESC, Time DESC";
        
        using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvAllBookings.DataSource = dt;
                    gvAllBookings.DataBind();
                }
            }
        }

    }
}
