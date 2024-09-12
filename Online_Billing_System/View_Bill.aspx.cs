using System;
using System.Web.UI;

namespace online_billing_system
{
    public partial class View_Bill : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve bill details from the session or database and display them
            }
        }

        protected void btnPrintBill_Click(object sender, EventArgs e)
        {
            // Implement print functionality
            // You can use JavaScript to trigger the print dialog
            ClientScript.RegisterStartupScript(this.GetType(), "print", "window.print();", true);
        }
    }
}
