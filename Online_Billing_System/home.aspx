<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="online_billing_system.home" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage - Zudio</title>
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

        .container {
            margin-top: 50px;
            text-align: center;
        }

        .container p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .btn-custom {
            width: 150px;
            margin: 10px;
            padding: 10px 20px;
            font-size: 1.2rem;
            font-weight: bold;
            background-color: #007bff;
            border: none;
            color: white;
            border-radius: 5px;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <h1>Zudio</h1>
        </div>
        
        <div class="container">
            <p>Welcome to Zudio. Please login or sign up to continue.</p>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-custom" OnClick="btnLogin_Click" />
            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-custom" OnClick="ButtonSignUp_Click" />
        </div>
    </form>
</body>
</html>