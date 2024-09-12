using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace online_billing_system
{
	public partial class products : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["Username"] == null)
				{
					Response.Redirect("Login.aspx");
				}


				productload();

			}
		}
		void productload()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
			try
			{
				using (conn)
				{
					string cmd = "Select * from Product";
					SqlCommand sqlCommand = new SqlCommand(cmd, conn);
					conn.Open();
					SqlDataReader reader = sqlCommand.ExecuteReader();
					gridp.DataSource = reader;
					gridp.DataBind();
				}
			}
			catch (Exception ex)
			{
				lblInfo.Text = ex.Message;
			}
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
			conn.Open();
			string query = "INSERT INTO Product (ProductName, ProductPrice) VALUES(@ProductName, @ProductPrice)";
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.AddWithValue("@ProductName", tbpname.Text);
			cmd.Parameters.AddWithValue("@ProductPrice", tbpprice.Text);
			cmd.ExecuteNonQuery();
			productload();
			tbpname.Text = "";
			tbpprice.Text = "";
		}

		protected void btnDelete_Click(object sender, EventArgs e)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
			int pId = 0;
			using (conn)
			{
				string query1 = "SELECT ProductID FROM Product WHERE Productname= @Productname";
				SqlCommand cmd1 = new SqlCommand(query1, conn);
				cmd1.Parameters.AddWithValue("@Productname", tbpname.Text);
				conn.Open();
				object result = cmd1.ExecuteScalar();
				if (result != null)
				{
					pId = Convert.ToInt32(result);
				}
				string query = "DELETE FROM Product where ProductID=@ProductID";
				SqlCommand cmd = new SqlCommand(query, conn);
				cmd.Parameters.AddWithValue("@ProductID", pId);
				cmd.ExecuteNonQuery();
				productload();
				tbpname.Text = "";
				tbpprice.Text = "";

			}
		}

		protected void selectdata(object sender, EventArgs e)
		{
			GridViewRow selectedRow = gridp.SelectedRow;
			if (selectedRow != null)
			{
				tbpname.Text = selectedRow.Cells[2].Text;
				tbpprice.Text = selectedRow.Cells[3].Text;
			}
		}

		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
			int pId = 0;
			using (conn)
			{
				string query1 = "SELECT ProductID FROM Product WHERE Productname= @Productname";
				SqlCommand cmd1 = new SqlCommand(query1, conn);
				cmd1.Parameters.AddWithValue("@Productname", tbpname.Text);
				conn.Open();
				object result = cmd1.ExecuteScalar();
				if (result != null)
				{
					pId = Convert.ToInt32(result);
				}
				string query = "UPDATE Product SET ProductName = @ProductName, ProductPrice = @ProductPrice WHERE ProductID = @ProductID";
				SqlCommand cmd = new SqlCommand(query, conn);
				cmd.Parameters.AddWithValue("@ProductID", pId);
				cmd.Parameters.AddWithValue("@ProductName", tbpname.Text);
				cmd.Parameters.AddWithValue("@ProductPrice", tbpprice.Text);
				cmd.ExecuteNonQuery();
				productload();
				tbpname.Text = "";
				tbpprice.Text = "";
			}

		}
	}
}