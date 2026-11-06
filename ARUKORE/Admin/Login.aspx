
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="ARUKORE.Admin.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#08090d" />

    <title>Admin Login | ARU KORE</title>

    <style>
        :root {
            --bg: #08090d;
            --card: #151720;
            --border: #292c38;
            --text: #f5f5f7;
            --muted: #999cac;
            --pink: #ff4f9a;
        }

        * {
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            margin: 0;
            padding: 25px;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow-x: hidden;
            font-family: Arial, sans-serif;
            color: var(--text);
            background:
                radial-gradient(circle at 15% 15%, rgba(255,79,154,.12), transparent 35%),
                radial-gradient(circle at 85% 85%, rgba(115,75,255,.09), transparent 35%),
                var(--bg);
        }

        .background-text {
            position: fixed;
            top: 50%;
            left: 50%;
            z-index: -1;
            transform: translate(-50%, -50%);
            color: rgba(255,255,255,.018);
            font-size: clamp(90px, 18vw, 230px);
            font-weight: 900;
            white-space: nowrap;
            letter-spacing: -10px;
            pointer-events: none;
        }

        .login-wrapper {
            width: 100%;
            max-width: 440px;
        }

        .top-brand {
            margin-bottom: 25px;
            text-align: center;
        }

        .brand {
            font-size: 30px;
            font-weight: 900;
            letter-spacing: 2px;
        }

        .brand span {
            color: var(--pink);
        }

        .brand-caption {
            margin-top: 9px;
            color: var(--muted);
            font-size: 10px;
            letter-spacing: 4px;
        }

        .login-box {
            padding: 42px;
            border: 1px solid var(--border);
            border-radius: 18px;
            background: rgba(21,23,32,.94);
            box-shadow:
                0 25px 80px rgba(0,0,0,.55),
                0 0 45px rgba(255,79,154,.045);
            backdrop-filter: blur(15px);
        }

        .login-index {
            color: var(--pink);
            font-size: 10px;
            font-weight: bold;
            letter-spacing: 3px;
        }

        .login-box h1 {
            margin: 18px 0 10px;
            font-size: 30px;
            letter-spacing: -1px;
        }

        .login-description {
            margin: 0 0 34px;
            color: var(--muted);
            font-size: 13px;
            line-height: 1.8;
        }

        .field-label {
            display: block;
            margin-bottom: 10px;
            color: #d8d9e0;
            font-size: 10px;
            font-weight: bold;
            letter-spacing: 1.7px;
        }

        .field {
            display: block;
            width: 100%;
            height: 53px;
            margin-bottom: 23px;
            padding: 0 16px;
            border: 1px solid var(--border);
            border-radius: 8px;
            outline: none;
            background: #0d0f15;
            color: white;
            font-size: 14px;
            transition: .25s ease;
        }

        .field::placeholder {
            color: #686b79;
        }

        .field:focus {
            border-color: var(--pink);
            box-shadow: 0 0 0 3px rgba(255,79,154,.09);
        }

        .password-wrapper {
            position: relative;
        }

        .password-wrapper .field {
            padding-right: 75px;
        }

        .toggle-password {
            position: absolute;
            top: 0;
            right: 0;
            height: 53px;
            padding: 0 14px;
            border: 0;
            background: transparent;
            color: var(--pink);
            font-size: 11px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-btn {
            width: 100%;
            min-height: 53px;
            margin-top: 7px;
            border: 0;
            border-radius: 8px;
            background: var(--pink);
            color: #08090d;
            font-size: 12px;
            font-weight: 900;
            letter-spacing: 2px;
            cursor: pointer;
            transition: .25s ease;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            background: #ff79b1;
            box-shadow: 0 10px 30px rgba(255,79,154,.2);
        }

        .status {
            display: block;
            margin-top: 18px;
            color: #ff8585;
            font-size: 12px;
            line-height: 1.7;
            text-align: center;
        }

        .login-footer {
            margin-top: 25px;
            color: var(--muted);
            font-size: 10px;
            letter-spacing: 1px;
            text-align: center;
        }

        .login-footer span {
            color: var(--pink);
        }

        .back-link {
            display: block;
            margin-top: 22px;
            color: var(--muted);
            font-size: 12px;
            text-align: center;
            text-decoration: none;
            transition: .2s ease;
        }

        .back-link:hover {
            color: var(--pink);
        }

        @media (max-width: 480px) {
            body {
                padding: 17px;
            }

            .login-box {
                padding: 30px 22px;
            }

            .login-box h1 {
                font-size: 26px;
            }

            .brand {
                font-size: 26px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                transition: none !important;
            }
        }
    </style>
</head>

<body>

    <div class="background-text">ARUKORE</div>

    <form id="form1" runat="server">

        <div class="login-wrapper">

            <div class="top-brand">
                <div class="brand">ARU<span>KORE.</span></div>
                <div class="brand-caption">PRIVATE CONTROL CENTER</div>
            </div>

            <div class="login-box">

                <span class="login-index">ADMIN ACCESS / 01</span>

                <h1>Welcome back.</h1>

                <p class="login-description">
                    Sign in to access your portfolio dashboard
                    and manage your messages.
                </p>

                <label class="field-label" for="<%= txtUsername.ClientID %>">
                    USERNAME
                </label>

                <asp:TextBox ID="txtUsername" runat="server"
                    CssClass="field"
                    placeholder="Enter your username"
                    MaxLength="100"
                    autocomplete="username" />

                <label class="field-label" for="<%= txtPassword.ClientID %>">
                    PASSWORD
                </label>

                <div class="password-wrapper">

                    <asp:TextBox ID="txtPassword" runat="server"
                        CssClass="field"
                        TextMode="Password"
                        placeholder="Enter your password"
                        autocomplete="current-password" />

                    <button type="button"
                        class="toggle-password"
                        id="togglePassword"
                        aria-label="Show password">
                        SHOW
                    </button>

                </div>

                <asp:Button ID="btnLogin" runat="server"
                    Text="SIGN IN  →"
                    CssClass="login-btn"
                    OnClick="btnLogin_Click" />

                <asp:Label ID="lblStatus" runat="server"
                    CssClass="status" />

            </div>

            <a href="../Default.aspx" class="back-link">
                ← Back to ARU KORE website
            </a>

            <div class="login-footer">
                © <%: DateTime.Now.Year %> ARU KORE
                <span>•</span> PRIVATE ADMIN
            </div>

        </div>

    </form>

    <script>
        document.addEventListener("DOMContentLoaded", function () {

            const password = document.getElementById(
                "<%= txtPassword.ClientID %>"
            );

            const toggle = document.getElementById("togglePassword");

            if (!password || !toggle) return;

            toggle.addEventListener("click", function () {

                const isHidden = password.type === "password";

                password.type = isHidden ? "text" : "password";

                toggle.textContent = isHidden ? "HIDE" : "SHOW";

                toggle.setAttribute(
                    "aria-label",
                    isHidden ? "Hide password" : "Show password"
                );

            });

        });
    </script>

</body>
</html>
