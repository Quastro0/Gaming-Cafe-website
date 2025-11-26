using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gaming_Cafe
{
    public partial class AdminContactUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadContactMessages();
            }
        }

        private void LoadContactMessages()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = @"
                SELECT 
                    Id, 
                    Name, 
                    Email, 
                    Message
                FROM Contacts
                ORDER BY Id DESC";  // 🔥 Show latest messages first

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvContactUs.DataSource = dt;
                    gvContactUs.DataBind();
                }
            }
        }

        protected void gvContactUs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvContactUs.PageIndex = e.NewPageIndex;
            LoadContactMessages();
        }
    }
}
