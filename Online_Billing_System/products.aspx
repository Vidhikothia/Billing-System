<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="online_billing_system.products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Products</title>
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

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="number"], .aspNetTextBox {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .btn-update {
            background-color: #ffd800;
        }

        .btn-update:hover {
            background-color: #f3d525;
        }

        .grid-container {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .info-label {
            margin-top: 20px;
            color: #333;
            font-weight: bold;
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
        <div class="container">
            <h1>Manage Products</h1>

            <label for="tbpname">Product Name</label>
            <asp:TextBox ID="tbpname" runat="server" CssClass="aspNetTextBox"></asp:TextBox>

            <label for="tbpprice">Product Price</label>
            <asp:TextBox ID="tbpprice" runat="server" TextMode="Number" CssClass="aspNetTextBox"></asp:TextBox>

            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" OnClick="btnSave_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-delete" OnClick="btnDelete_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-update" OnClick="btnUpdate_Click" />

            <div class="grid-container">
                <asp:GridView ID="gridp" runat="server" AutoGenerateSelectButton="true" OnSelectedIndexChanged="selectdata"
                    CssClass="table table-striped">
                </asp:GridView>
            </div>

            <asp:Label ID="lblInfo" runat="server" Text="" CssClass="info-label"></asp:Label>
        </div>
    </form>
</body>
</html>
