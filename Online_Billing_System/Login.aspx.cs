using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using BCrypt.Net;
using System.Web.UI.WebControls;

namespace online_billing_system
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            string username = TxtLoginUsername.Text.Trim();
            string password = TxtLoginPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                LblErrorMessage.Text = "Username and Password are required.";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT Password FROM Users WHERE Username = @Username";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        conn.Open();

                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            string storedHash = result.ToString();
                            if (BCrypt.Net.BCrypt.Verify(password, storedHash))
                            {
                                // Successful login
                                Session["Username"] = username;
                                Response.Redirect("Deshboard.aspx");
                            }
                            else
                            {
                                // Invalid password
                                LblErrorMessage.Text = "Invalid username or password.";
                            }
                        }
                        else
                        {
                            // User not found
                            LblErrorMessage.Text = "User not found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception or display an error message
                LblErrorMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}