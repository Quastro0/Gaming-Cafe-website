using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gaming_Cafe
{
    public partial class AdminUserData : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Id, Full_Name, Email, Password FROM [User] ORDER BY Id DESC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvUsers.DataSource = dt;
                    gvUsers.DataBind();
                }
            }
        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            LoadUsers();
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO [User] (Full_Name, Email, Password) VALUES (@FullName, @Email, @Password)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            // Clear input fields after insertion
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";

            LoadUsers();
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            LoadUsers();
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            LoadUsers();
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvUsers.Rows[e.RowIndex];
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            string fullName = ((TextBox)row.Cells[1].Controls[0]).Text;
            string email = ((TextBox)row.Cells[2].Controls[0]).Text;
            string password = ((TextBox)row.Cells[3].Controls[0]).Text;

            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE [User] SET Full_Name=@FullName, Email=@Email, Password=@Password WHERE Id=@Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Id", userId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            gvUsers.EditIndex = -1;
            LoadUsers();
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM [User] WHERE Id=@Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", userId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            LoadUsers();
        }
    }
}
