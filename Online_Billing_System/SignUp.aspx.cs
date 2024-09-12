using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using BCrypt.Net;


namespace online_billing_system
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
                string gender = RadioButtonListGender.SelectedValue;
                string passwordHash = BCrypt.Net.BCrypt.HashPassword(TxtSignupPassword.Text.Trim());

                try
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Users (Username, Contact, Email, Gender, Password) VALUES (@Username,@Contact, @Email , @Gender, @Password)";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@Username", TxtSignupUsername.Text.Trim());
                            cmd.Parameters.AddWithValue("@Contact", TxtSignupContact.Text.Trim());
                            cmd.Parameters.AddWithValue("@Email", TxtSignupEmail.Text.Trim());
                            
                            cmd.Parameters.AddWithValue("@Gender", gender);
                            cmd.Parameters.AddWithValue("@Password", passwordHash);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    Session["Username"] = TxtSignupUsername.Text.Trim();
                    Response.Redirect("Deshboard.aspx");
                }
                catch (Exception ex)
                {
                    LblErrorMessage.Text = "An error occurred: " + ex.Message;
                }
            }
        }
    }
}