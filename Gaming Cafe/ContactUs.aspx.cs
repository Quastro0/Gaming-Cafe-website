using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Gaming_Cafe
{
    public partial class ContactUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = ""; // Clear the label on page load
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            // ✅ Check if all fields are filled
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                lblMessage.Text = "All fields are required!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "INSERT INTO Contacts (Name, Email, Message) VALUES (@Name, @Email, @Message)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Message", message);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Your message has been sent successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        ClearFields();
                    }
                    else
                    {
                        lblMessage.Text = "Failed to send message. Try again!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        private void ClearFields()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }
}
