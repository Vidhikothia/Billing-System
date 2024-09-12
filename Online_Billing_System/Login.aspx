<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="online_billing_system.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Zudio</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #343a40;
            padding: 15px;
            color: white;
            text-align: center;
        }

        .navbar h1 {
            margin: 0;
            font-size: 2.5rem;
            font-weight: bold;
        }

        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.8rem;
            font-weight: bold;
            color: #343a40;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-custom {
            width: 100%;
            padding: 10px;
            font-size: 1.2rem;
            font-weight: bold;
            background-color: #007bff;
            border: none;
            color: white;
            border-radius: 5px;
            margin-top: 10px;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <h1>Zudio</h1>
        </div>

        <div class="login-container">
            <h2>Login</h2>
            <asp:Label ID="LblErrorMessage" runat="server" CssClass="error-message"></asp:Label>
            <div class="form-group">
                <label for="TxtLoginUsername">Username:</label>
                <asp:TextBox ID="TxtLoginUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TxtLoginPassword">Password:</label>
                <asp:TextBox ID="TxtLoginPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="btn btn-custom" OnClick="BtnLogin_Click" />
        </div>
    </form>
</body>
</html>