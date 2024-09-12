<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBills.aspx.cs" Inherits="online_billing_system.ViewBills" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Bill</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
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
            margin-left: 220px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            margin-top: 50px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
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
            padding: 10px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
            text-align: right;
        }

        /* GridView Styling */
        .grid-container .GridViewBill,
        form .GridViewBill {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .GridViewBill th,
        .GridViewBill td {
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

        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
            display: block;
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
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h2>Zudio</h2>
        <button type="button" class="btn-logout" onclick="window.location.href='Logout.aspx'">Logout</button>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="CreateBill.aspx">Create Bills</a>
        <a href="ViewBills.aspx">View Bills</a>
        <a href="products.aspx">Manage Products</a>
        <a href="LogOut.aspx">Log Out</a>
    </div>

    <!-- Form to Display Bills -->
    <form id="form1" runat="server">
        <h1>View Bills</h1>
        <div class="grid-container">
            <asp:Label ID="LblErrorMessage" runat="server" CssClass="error-message"></asp:Label>
            <asp:GridView ID="GridBill" runat="server" AutoGenerateColumns="False" CssClass="GridViewBill table table-bordered table-hover">
                <Columns>
                    <asp:BoundField DataField="Billid" HeaderText="Bill ID" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="Cashier ID" />
                    <asp:BoundField DataField="Totalitem" HeaderText="Total Items" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" />
                    <asp:BoundField DataField="AmountPaid" HeaderText="Amount Paid" />
                    <asp:BoundField DataField="ChangeToReturn" HeaderText="Change to Return" />
                    <asp:BoundField DataField="BillDate" HeaderText="Bill Date" />
                   <%-- <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnPrint" runat="server" Text="Print" CommandName="Print" CssClass="btn btn-info btn-sm" CommandArgument='<%# Eval("Billid") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
