<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintBill.aspx.cs" Inherits="online_billing_system.PrintBill" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Bill</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .container {
            width: 20%;
            margin: 0 auto;
            margin-top:10px;
            padding: 30px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height: 100%;
        }
        .header, .footer {
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
        }
        .details {
            margin-bottom: 20px;
        }
        .details th, .details td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .details th {
            background-color: #f4f4f4;
        }
        .summary {
            margin-top: 20px;
            text-align: right;
        }
        .summary label {
            font-weight: bold;
        }
        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>Zudio</h1>
                <p>Date: <asp:Label ID="lblDate" runat="server"></asp:Label>&nbsp;&nbsp;<%-- Bill ID: <asp:Label ID="lblBillId" runat="server"></asp:Label>--%></p>
            </div>

            <asp:GridView ID="GridBillPrint" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />
                </Columns>
            </asp:GridView>

            <div class="summary">
                <p>Total Amount Paid: <asp:Label ID="lblTotalAmountPaid" runat="server"></asp:Label></p>
                <p>Amount to be Returned: <asp:Label ID="lblAmountToBeReturned" runat="server"></asp:Label></p>
            </div>

            <div class="footer">
                <p>Terms and Conditions: All sales are final. No returns or exchanges.</p>
            </div>

        </div>
    </form>
</body>
</html>


