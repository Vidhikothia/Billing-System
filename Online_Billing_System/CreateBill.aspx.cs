using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace online_billing_system
{
    public partial class CreateBill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                LoadProducts();
                ViewState["BillTable"] = CreateDataTable();
                BindGrid();
            }
        }

        private DataTable CreateDataTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ProductName", typeof(string));
            dt.Columns.Add("Quantity", typeof(int));
            dt.Columns.Add("Price", typeof(decimal));
            dt.Columns.Add("TotalPrice", typeof(decimal));
            return dt;
        }

        private void BindGrid()
        {
            GridViewBill.DataSource = ViewState["BillTable"] as DataTable;
            GridViewBill.DataBind();
            CalculateTotalAmount(); // Update the total amount when the grid is bound
        }

        private void LoadProducts()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ProductID, ProductName FROM Product";
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                ddlProduct.DataSource = reader;
                ddlProduct.DataTextField = "ProductName";
                ddlProduct.DataValueField = "ProductID";
                ddlProduct.DataBind();
            }

            ddlProduct.Items.Insert(0, new ListItem("--Select Product--", "0"));
        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProduct.SelectedIndex == 0)
            {
                txtPricePerUnit.Text = "";
                return;
            }

            int productId = Convert.ToInt32(ddlProduct.SelectedValue);
            string connectionString = ConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ProductPrice FROM Product WHERE ProductID=@ProductID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProductID", productId);

                con.Open();
                object price = cmd.ExecuteScalar();
                if (price != null)
                {
                    txtPricePerUnit.Text = price.ToString();
                }
            }

            // Calculate and update the total amount for the selected product

        }

        protected void txtAmount_Changed(object sender, EventArgs e)
        {
            if (decimal.TryParse(txtAmountPaid.Text, out decimal amountPaid) && decimal.TryParse(txtTotalAmount.Text, out decimal totalAmount))
            {
                decimal balance = amountPaid - totalAmount;
                txtAmountr.Text = balance.ToString("F2");
            }
            else
            {
                txtAmountr.Text = "0.00";
            }
        }

        protected void btnAddToBill_Click(object sender, EventArgs e)
        {
            DataTable dt = ViewState["BillTable"] as DataTable;

            // Validate input fields
            if (ddlProduct.SelectedIndex > 0 && int.TryParse(TxtQuantity.Text, out int quantity) && decimal.TryParse(txtPricePerUnit.Text, out decimal pricePerUnit))
            {
                DataRow dr = dt.NewRow();
                dr["ProductName"] = ddlProduct.SelectedItem.Text;
                dr["Quantity"] = quantity;
                dr["Price"] = pricePerUnit;
                dr["TotalPrice"] = quantity * pricePerUnit;
                dt.Rows.Add(dr);

                ViewState["BillTable"] = dt;
                BindGrid(); // Rebind the grid after adding the new row

                // Insert into the database
                string connectionString = ConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO BillDetails (ProductID, Quantity, PricePerUnit, TotalPrice) VALUES (@ProductID, @Quantity, @PricePerUnit, @TotalPrice)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ProductID", ddlProduct.SelectedValue);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@PricePerUnit", pricePerUnit);
                    cmd.Parameters.AddWithValue("@TotalPrice", quantity * pricePerUnit);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Clear the input fields after adding
                ddlProduct.SelectedIndex = 0;
                TxtQuantity.Text = "";
                txtPricePerUnit.Text = "";
            }
            else
            {
                LblErrorMessage.Text = "Please select a valid product and enter a valid quantity.";
            }
        }

        private void CalculateTotalAmount()
        {
            DataTable dt = ViewState["BillTable"] as DataTable;
            decimal totalAmount = 0;
            int totalItem = 0;
            // Calculate the sum of all TotalPrice values in the DataTable
            foreach (DataRow row in dt.Rows)
            {
                totalAmount += (decimal)row["TotalPrice"];
                totalItem += (int)row["Quantity"];
            }

            txtTotalAmount.Text = totalAmount.ToString("F2");
            txttotalitems.Text = totalItem.ToString();
        }
        protected void GridViewBill_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Populate the dropdown, quantity, and price based on the selected row in the grid
            GridViewRow row = GridViewBill.SelectedRow;

            if (row != null)
            {
                string productName = row.Cells[0].Text;
                ListItem selectedItem = ddlProduct.Items.FindByText(productName);
                if (selectedItem != null)
                {
                    ddlProduct.ClearSelection(); // Clear previous selection
                    selectedItem.Selected = true; // Set the found item as selected
                }
                TxtQuantity.Text = row.Cells[2].Text;
                txtPricePerUnit.Text = row.Cells[3].Text;
            }
        }


        protected void btnDeleteFromBill_Click(object sender, EventArgs e)
        {
            DataTable dt = ViewState["BillTable"] as DataTable;

            // Find the selected row to delete
            GridViewRow row = GridViewBill.SelectedRow;

            if (row != null)
            {
                string productName = row.Cells[0].Text;


                DataRow[] rows = dt.Select($"ProductName = '{productName}'");
                if (rows.Length > 0)
                {
                    dt.Rows.Remove(rows[0]); // Remove the matched row from the DataTable
                    ViewState["BillTable"] = dt;
                    BindGrid(); // Rebind the grid after deletion
                }
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
                conn.Open();
                string query = "DELETE FROM BillDetails where Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", ddlProduct.SelectedValue);
                cmd.ExecuteNonQuery();


                ddlProduct.SelectedIndex = 0;
                TxtQuantity.Text = "";
                txtPricePerUnit.Text = "";
            }
            else
            {
                LblErrorMessage.Text = "Please select a product from the grid to delete.";
            }
        }
        protected void btnSaveBill_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string name = Session["Username"].ToString();
                int userId = 0;
                using (conn)
                {
                    string query1 = "SELECT id FROM users WHERE Username= @Username";
                    SqlCommand cmd1 = new SqlCommand(query1, conn);
                    cmd1.Parameters.AddWithValue("@Username", name);

                    conn.Open();
                    object result = cmd1.ExecuteScalar();
                    if (result != null)
                    {
                        userId = Convert.ToInt32(result);
                    }
                    string query = "INSERT INTO Bill(EmployeeID, Totalitem, TotalAmount, AmountPaid,ChangeToReturn) VALUES (@EmployeeID, @Totalitem, @TotalAmount, @AmountPaid,@ChangeToReturn)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@EmployeeID", userId);
                    cmd.Parameters.AddWithValue("@Totalitem", txttotalitems.Text);
                    cmd.Parameters.AddWithValue("@TotalAmount", txtTotalAmount.Text);
                    cmd.Parameters.AddWithValue("@AmountPaid", txtAmountPaid.Text);
                    cmd.Parameters.AddWithValue("@ChangeToReturn", txtAmountr.Text);


                    cmd.ExecuteNonQuery();
                }
            }
            ClearControls();

        }
        private void ClearControls()
        {

            ddlProduct.SelectedIndex = 0;


            TxtQuantity.Text = string.Empty;
            txtPricePerUnit.Text = string.Empty;
            txtTotalAmount.Text = "0.00";
            txtAmountPaid.Text = string.Empty;
            txtAmountr.Text = string.Empty;

            GridViewBill.DataSource = null;
            GridViewBill.DataBind();

            ViewState["ProductTable"] = null;
        }
        protected void btnPrintBill_Click(object sender, EventArgs e)
        {
            DataTable dt = ViewState["BillTable"] as DataTable;
            Session["BillData"] = dt;
			Session["TotalAmount"] = txtTotalAmount.Text;
			Session["AmountToBeReturned"] = txtAmountr.Text;
			// Redirect to PrintBill page
			Response.Redirect("PrintBill.aspx");
        }

        protected void btnViewBill_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBills.aspx");
        }

        protected void SaveBillData(object sender, EventArgs e)
        {
            DataTable billData = GetBillData(); // Replace with your method to get the data from the GridView
            Session["BillData"] = billData;
            Response.Redirect("PrintBill.aspx");
        }

        private DataTable GetBillData()
        {
            // Assuming you have a method that returns a DataTable with the bill data
            DataTable dt = new DataTable();
            dt.Columns.Add("ProductName");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("Price");
            dt.Columns.Add("TotalPrice");

            foreach (GridViewRow row in GridViewBill.Rows)
            {
                DataRow dr = dt.NewRow();
                dr["ProductName"] = row.Cells[0].Text;
                dr["Quantity"] = row.Cells[1].Text;
                dr["Price"] = row.Cells[2].Text;
                dr["TotalPrice"] = row.Cells[3].Text;
                dt.Rows.Add(dr);
            }

            return dt;
        }

    }
}