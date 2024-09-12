<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_bill.aspx.cs" Inherits="online_billing_system.view_bill" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Bill</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .bill-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            margin: auto;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .GridViewBill {
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
    <div class="bill-container">
        <h1>Your Bill</h1>
        <asp:GridView ID="GridViewBill" runat="server" CssClass="GridViewBill" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />
            </Columns>
        </asp:GridView>
    </div>
</body>
</html>
