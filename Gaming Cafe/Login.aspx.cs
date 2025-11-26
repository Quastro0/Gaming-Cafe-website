using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace Gaming_Cafe
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                Response.Redirect("BookNow.aspx");
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtRegisterName.Text.Trim();
            string email = txtRegisterEmail.Text.Trim();
            string password = txtRegisterPassword.Text.Trim();

            // Reset error messages
            lblRegisterNameError.Visible = false;
            lblRegisterEmailError.Visible = false;
            lblRegisterPasswordError.Visible = false;

            bool isValid = true;

            // Validate Name
            if (string.IsNullOrEmpty(name) || name.Length < 3)
            {
                lblRegisterNameError.Text = "Name must be at least 3 characters.";
                lblRegisterNameError.Visible = true;
                isValid = false;
            }

            // Validate Email
            if (string.IsNullOrEmpty(email) || !Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblRegisterEmailError.Text = "Please enter a valid email.";
                lblRegisterEmailError.Visible = true;
                isValid = false;
            }

            // Validate Password
            if (string.IsNullOrEmpty(password) || password.Length < 6)
            {
                lblRegisterPasswordError.Text = "Password must be at least 6 characters.";
                lblRegisterPasswordError.Visible = true;
                isValid = false;
            }

            if (!isValid)
            {
                return;
            }

            // Database Connection
            string connectionString = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Check if the email already exists
                string checkQuery = "SELECT COUNT(*) FROM [User] WHERE Email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        lblRegisterEmailError.Text = "Email is already registered.";
                        lblRegisterEmailError.Visible = true;
                        return;
                    }
                }

                // Insert new user
                string insertQuery = "INSERT INTO [User] (Full_Name, Email, Password) VALUES (@Name, @Email, @Password)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Redirect("Login.aspx"); // Redirect to login page after successful registration
                    }
                    else
                    {
                        lblRegisterPasswordError.Text = "Registration failed. Please try again.";
                        lblRegisterPasswordError.Visible = true;
                    }
                }
            }
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtLoginEmail.Text.Trim();
            string password = txtLoginPassword.Text.Trim();

            // Reset error messages
            lblLoginEmailError.Visible = false;
            lblLoginPasswordError.Visible = false;

            bool isValid = true;

            // Validate email
            if (string.IsNullOrEmpty(email) || !Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblLoginEmailError.Text = "Please enter a valid email.";
                lblLoginEmailError.Visible = true;
                isValid = false;
            }

            // Validate password length
            if (string.IsNullOrEmpty(password) || password.Length < 6)
            {
                lblLoginPasswordError.Text = "Password must be at least 6 characters.";
                lblLoginPasswordError.Visible = true;
                isValid = false;
            }

            if (!isValid)
            {
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["Gamercafe"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Id, Full_Name, Email FROM [User] WHERE Email = @Email AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["UserID"] = reader["Id"].ToString();
                        Session["UserName"] = reader["Full_Name"].ToString();
                        Session["UserEmail"] = reader["Email"].ToString();
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        lblLoginPasswordError.Text = "Invalid email or password.";
                        lblLoginPasswordError.Visible = true;
                    }
                }
            }
        }
    }
}
