<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateBill.aspx.cs" Inherits="online_billing_system.CreateBill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Bill</title>
    <style type="text/css">
        body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color:#f4f4f4;
}

.navbar {
    background-color: #343a40;
    color: white;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar a {
    color: white;
    text-decoration: none;
    margin-right: 20px;
}

.navbar .btn-logout {
    background-color: #dc3545;
    border: none;
    color: white;
    padding: 10px 20px;
    cursor: pointer;
}

.navbar .btn-logout:hover {
    background-color: #c82333;
}

.sidebar {
    width: 200px;
    position: fixed;
    height: 100%;
    background-color: #f8f9fa;
    padding-top: 20px;
}

.sidebar a {
    padding: 10px;
    text-decoration: none;
    display: block;
    color: #343a40;
    margin-bottom: 10px;
}

.sidebar a:hover {
    background-color: #007bff;
    color: white;
}

form {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 900px;
    margin-left: 220px; /* Adds space to avoid overlap with the sidebar */
    margin-top: 100px;
    width: calc(100% - 220px); /* Adjusts the form width to fit within the available space */
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

.form-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 15px;
}

.form-group {
    flex: 1;
    display: flex;
    align-items: center;
    margin-right: 15px;
}

.form-group:last-child {
    margin-right: 0;
}

.form-group label {
    min-width: 100px;
    font-weight: bold;
    color: #555;
}

.form-group input[type="text"], .form-group select {
    flex: 1;
    padding: 8px;
    border-radius: 4px;
    border: 1px solid #ccc;
    font-size: 14px;
}

.form-group input[readonly] {
    background-color: #e9ecef;
}

.btn-container {
    display: flex;
    justify-content: flex-end;
    margin-top: 20px;
}

.btn {
    background-color: #007bff;
    color: white;
    padding: 10px 15px;
    margin-left: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

.btn:hover {
    background-color: #0056b3;
}

.btn-secondary {
    background-color: #6c757d;
}

.btn-secondary:hover {
    background-color: #565e64;
}

.grid-container {
    margin-top: 20px;
}

.grid-container label {
    font-weight: bold;
    color: #333;
}

.grid-container input {
    margin-top: 5px;
    padding: 8px;
    font-size: 14px;
    border-radius: 4px;
    border: 1px solid #ccc;
    text-align: right;
}

.error-message {
    color: red;
    font-weight: bold;
    margin-top: 10px;
    display: block;
}

/* GridView Styling */
.grid-container .GridViewBill {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.GridViewBill th, .GridViewBill td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.GridViewBill th {
    background-color: #007bff;
    color: white;
}

.GridViewBill tr:hover {
    background-color: #f1f1f1;
}

.GridViewBill tr:nth-child(even) {
    background-color: #f9f9f9;
}

        
    </style>
</head>
<body>
    <div class="navbar">
    <h2>Zudio</h2>
    <button type="button" class="btn-logout" onclick="window.location.href='Logout.aspx'">Logout</button>
</div>
    <div class="sidebar">
    <a href="CreateBill.aspx">Create Bills</a>
    <a href="ViewBills.aspx">View Bills</a>
    <a href="products.aspx">Manage Products</a>
    <a href="LogOut.aspx">Log Out</a>
</div>
    <form id="form1" runat="server">
        <h1>Create Bill</h1>

        <div class="form-row">
            <div class="form-group">
                <label for="ddlProduct">Product Name</label>
                <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="TxtQuantity">Quantity</label>
                <asp:TextBox ID="TxtQuantity" runat="server" Placeholder="Enter Quantity"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPricePerUnit">Price Per Unit</label>
                <asp:TextBox ID="txtPricePerUnit" runat="server" />
            </div>
        </div>
        <asp:Label ID="Label1" runat="server" ForeColor="Red" />
        <div class="btn-container">
            <asp:Button ID="btnAddToBill" runat="server" Text="Add to Bill" CssClass="btn" OnClick="btnAddToBill_Click" />        </div>

        <div class="grid-container">
            <asp:GridView ID="GridViewBill" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" 
                CssClass="GridViewBill" OnSelectedIndexChanged="GridViewBill_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />
                </Columns>
            </asp:GridView>
        </div>
       <div class="btn-container"></div>
        <div class="form-row">
            <div class="form-group">
                <label for="txttotalitems">Total Items</label>
                <asp:TextBox ID="txttotalitems" runat="server" ReadOnly="true" Width="67px" />
            </div>
            <div class="form-group">
                <label for="txtTotalAmount">Total Amount</label>
                <asp:TextBox ID="txtTotalAmount" runat="server" Text="0" ReadOnly="true" Width="68px" />
            </div>
          
            <div class="form-group">
                <label for="txtAmountPaid">Amount Paid</label>
                <asp:TextBox ID="txtAmountPaid" runat="server" OnTextChanged="txtAmount_Changed" Width="61px" AutoPostBack="true"/>
            </div>
            <div class="form-group">
                <label for="txtAmountr">Amount to be Returned</label>
                <asp:TextBox ID="txtAmountr" runat="server" ReadOnly="true" Width="72px" />
            </div>
            
        </div>

        <asp:Label ID="LblErrorMessage" runat="server" CssClass="error-message"></asp:Label>

        <div class="btn-container">
            <asp:Button ID="btnSaveBill" runat="server" Text="Save Bill" CssClass="btn" OnClick="btnSaveBill_Click" />
            <asp:Button ID="btnPrintBill" runat="server" Text="Print Bill" CssClass="btn btn-secondary" OnClick="btnPrintBill_Click" />
        </div>
    </form>
    <script type="text/javascript">
    document.getElementById('<%= txtAmountPaid.ClientID %>').onkeypress = function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            __doPostBack('<%= txtAmountPaid.ClientID %>', '');
        }
    };
    </script>

</body>
</html>
