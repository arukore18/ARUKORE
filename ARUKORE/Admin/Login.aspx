
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="ARUKORE.Admin.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Login | ARU KORE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #101014;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-box {
            width: 340px;
            padding: 35px;
            background: #1c1c24;
            border-radius: 14px;
            box-shadow: 0 10px 35px #000;
        }

        h2 { margin-top: 0; }

        .field {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            margin: 10px 0 18px;
            background: #292933;
            border: 1px solid #444;
            border-radius: 6px;
            color: white;
        }

        .login-btn {
            width: 100%;
            padding: 13px;
            background: #e879a9;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        .status {
            display: block;
            margin-top: 15px;
            color: #ff8585;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <h2>ARU KORE Admin</h2>
            <p>Sign in to manage your portfolio.</p>

            <asp:TextBox ID="txtUsername" runat="server"
                CssClass="field"
                placeholder="Username" />

            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="field"
                TextMode="Password"
                placeholder="Password" />

            <asp:Button ID="btnLogin" runat="server"
                Text="LOGIN"
                CssClass="login-btn"
                OnClick="btnLogin_Click" />

            <asp:Label ID="lblStatus" runat="server"
                CssClass="status" />
        </div>
    </form>
</body>
</html>
