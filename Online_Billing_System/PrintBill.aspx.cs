

using System;
using System.Data;  // For DataTable
using System.Data.SqlClient;
using System.Web.UI.WebControls;  // For GridView

namespace online_billing_system
{
    public partial class PrintBill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set the current date in the lblDate label
                lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");

                // Check if there's BillData in the session
                if (Session["BillData"] != null)
                {
                    DataTable billData = (DataTable)Session["BillData"];
                    GridBillPrint.DataSource = billData;
                    GridBillPrint.DataBind();

					lblTotalAmountPaid.Text = Session["TotalAmount"] != null ? Session["TotalAmount"].ToString() : "0.00";
					lblAmountToBeReturned.Text = Session["AmountToBeReturned"] != null ? Session["AmountToBeReturned"].ToString() : "0.00";
				}
            }
        }

        private string FetchBillId(string billNumber)
        {
            string billId = string.Empty;

            // Connection string for your database
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Vidhi\\OneDrive\\Desktop\\online_billing_system\\online_billing_system\\online_billing_system\\AppData\\mydb.mdf;Integrated Security=True;Encrypt=False";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = "SELECT BillID FROM Bill WHERE BillNumber = @BillNumber";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@BillNumber", billNumber);

                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            billId = result.ToString();
                        }
                        else
                        {
                            billId = "Bill ID not found";
                        }
                    }
                }
                catch (Exception ex)
                {
                    billId = "Error: " + ex.Message;
                }
            }

            return billId;
        }

    }
}

