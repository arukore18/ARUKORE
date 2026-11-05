
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="CreateAdmin.aspx.cs"
    Inherits="ARUKORE.Admin.CreateAdmin" %>
<%-- We'll use PBKDF2 password hashing with a random salt. --%>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Create Admin | ARU KORE</title>
</head>
<body style="font-family:Arial;background:#17171d;color:white;padding:40px;">
    <form id="form1" runat="server">
        <h2>Create First Admin Account</h2>

        <p>Username</p>
        <asp:TextBox ID="txtUsername" runat="server" />

        <p>Password (minimum 12 characters)</p>
        <asp:TextBox ID="txtPassword" runat="server"
            TextMode="Password" />

        <p>
            <asp:Button ID="btnCreate" runat="server"
                Text="Create Admin"
                OnClick="btnCreate_Click" />
        </p>

        <asp:Label ID="lblStatus" runat="server" />
    </form>
</body>
</html>
