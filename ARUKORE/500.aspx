
<%@ Page Language="C#" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>500 | ARU KORE</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 25px;
            background:
                radial-gradient(circle at 50% 35%,
                rgba(255, 79, 154, .13), transparent 40%),
                #08090d;
            color: #f5f5f7;
            font-family: Arial, sans-serif;
        }

        .error-card {
            width: 100%;
            max-width: 650px;
            padding: 65px 30px;
            text-align: center;
            background: #151720;
            border: 1px solid #292b37;
            border-radius: 25px;
            box-shadow: 0 25px 80px rgba(0, 0, 0, .4);
        }

        .brand {
            color: #ff4f9a;
            font-size: 15px;
            font-weight: 800;
            letter-spacing: 5px;
            margin-bottom: 35px;
        }

        .error-number {
            font-size: clamp(90px, 20vw, 160px);
            line-height: 1;
            font-weight: 900;
            letter-spacing: -8px;
            background: linear-gradient(135deg, #fff, #ff4f9a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        h1 {
            font-size: clamp(24px, 5vw, 35px);
            margin: 20px 0 12px;
        }

        p {
            color: #999ba8;
            font-size: 15px;
            line-height: 1.8;
            max-width: 430px;
            margin: 0 auto 30px;
        }

        .home-btn {
            display: inline-block;
            padding: 15px 30px;
            color: white;
            background: #ff4f9a;
            border-radius: 50px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 800;
            letter-spacing: 1px;
            transition: .3s ease;
        }

        .home-btn:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 30px rgba(255, 79, 154, .3);
        }

        .footer {
            margin-top: 45px;
            color: #666875;
            font-size: 11px;
            letter-spacing: 2px;
        }
    </style>
</head>

<body>

    <main class="error-card">

        <div class="brand">ARU KORE</div>

        <div class="error-number">500</div>

        <h1>Something went wrong!</h1>

        <p>
            Our server encountered an unexpected issue.
            Don't worry, your journey doesn't end here.
            Please try again later.
        </p>

        <a href="<%= ResolveUrl("~/Default.aspx") %>" class="home-btn">
            BACK TO HOMEPAGE ↗
        </a>

        <div class="footer">
            © <%= DateTime.Now.Year %> ARU KORE · KEEP MOVING FORWARD
        </div>

    </main>

</body>
</html>
