using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

using System.Web.UI;

namespace online_billing_system
{
    public partial class ViewBills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBillData();
            }
        }

        private void LoadBillData()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    string name = Session["Username"].ToString();
                    int userId = 0;

                    // Open the connection only once here
                    conn.Open();

                    // Fetch the Employee ID
                    string query1 = "SELECT id FROM users WHERE Username = @Username";
                    using (SqlCommand cmd1 = new SqlCommand(query1, conn))
                    {
                        cmd1.Parameters.AddWithValue("@Username", name);
                        object result = cmd1.ExecuteScalar();
                        if (result != null)
                        {
                            userId = Convert.ToInt32(result);
                        }
                    }

                    // Fetch Bill data
                    string query = "SELECT * FROM Bill WHERE EmployeeID = @EmployeeID ORDER BY BillDate DESC";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", userId);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridBill.DataSource = dt;
                        GridBill.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    LblErrorMessage.Text = ex.Message;
                }
            }
        }

        protected void btnPrintBill_Click(object sender, GridViewCommandEventArgs e)
        {
			// Code for printing the bill
			if (e.CommandName == "Print")
			{
				string billId = e.CommandArgument.ToString();
				// Redirect to PrintBill page with the BillId in query string
				Response.Redirect("PrintBill.aspx?BillId=" + billId);
			}

		}
    }
}