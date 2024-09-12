<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="online_billing_system.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - Zudio</title>
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

        .signup-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .signup-container h2 {
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

        .radio-list {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .radio-list label {
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <h1>Zudio</h1>
        </div>

        <div class="signup-container">
            <h2>Sign Up</h2>
            <asp:Label ID="LblErrorMessage" runat="server" CssClass="error-message"></asp:Label>

            <div class="form-group">
                <label for="TxtSignupUsername">Username:</label>
                <asp:TextBox ID="TxtSignupUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TxtSignupEmail">Email:</label>
                <asp:TextBox ID="TxtSignupEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TxtSignupContact">Contact:</label>
                <asp:TextBox ID="TxtSignupContact" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="RadioButtonListGender">Gender:</label>
                <asp:RadioButtonList ID="RadioButtonListGender" runat="server" CssClass="radio-list">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="RadioButtonListGender" InitialValue="" ErrorMessage="Gender is required." ForeColor="Red" CssClass="error-message" />
            </div>

            <div class="form-group">
                <label for="TxtSignupPassword">Create Password:</label>
                <asp:TextBox ID="TxtSignupPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TxtSignupCnfPassword">Confirm Password:</label>
                <asp:TextBox ID="TxtSignupCnfPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button ID="BtnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-custom" OnClick="BtnSignUp_Click" />
        </div>
    </form>
</body>
</html>
