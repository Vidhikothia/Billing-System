<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deshboard.aspx.cs" Inherits="online_billing_system.Deshboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Zudio Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
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

        .content {
            margin-left: 220px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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

        <div class="content">
            <asp:Label ID="LblWelcomeMessage" runat="server" CssClass="welcome-message"></asp:Label>
        </div>
    </form>
</body>
</html>
