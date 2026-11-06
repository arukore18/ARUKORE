
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="ARUKORE.Admin.Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard | ARU KORE</title>

    <style>
        :root {
            --bg: #08090d;
            --card: #14151e;
            --line: #292b38;
            --text: #f5f5f7;
            --muted: #a0a2b0;
            --accent: #ff4f9a;
            --accent-soft: rgba(255,79,154,.12);
            --green: #35d49a;
            --red: #ff6578;
            --blue: #70aaff;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            padding: 30px;
            min-height: 100vh;
            background:
                radial-gradient(circle at 10% 0%, rgba(255,79,154,.10), transparent 35%),
                var(--bg);
            color: var(--text);
            font-family: Arial, sans-serif;
        }

        .dashboard {
            max-width: 1250px;
            margin: auto;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 35px;
        }

        .brand {
            font-size: 23px;
            font-weight: 900;
            letter-spacing: 2px;
        }

        .brand span { color: var(--accent); }

        .admin-info {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .welcome {
            color: var(--muted);
            font-size: 13px;
        }

        .welcome strong { color: white; }

        .logout-btn {
            background: transparent;
            border: 1px solid rgba(255,79,154,.4);
            color: var(--accent);
            padding: 10px 17px;
            border-radius: 9px;
            cursor: pointer;
            font-weight: 700;
            transition: .25s;
        }

        .logout-btn:hover {
            background: var(--accent);
            color: white;
        }

        /* NEW: VIEW WEBSITE BUTTON */

        .website-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            padding: 10px 16px;
            border: 1px solid rgba(53,212,154,.4);
            border-radius: 9px;
            color: var(--green);
            background: rgba(53,212,154,.07);
            text-decoration: none;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: .5px;
            transition: .25s ease;
        }

        .website-btn:hover {
            background: var(--green);
            color: #08090d;
            border-color: var(--green);
            transform: translateY(-2px);
            box-shadow: 0 7px 20px rgba(53,212,154,.15);
        }

        .hero { margin-bottom: 28px; }

        .hero h1 {
            font-size: clamp(30px, 5vw, 46px);
            margin: 0 0 10px;
            font-weight: 900;
            letter-spacing: -1px;
        }

        .hero h1 span { color: var(--accent); }

        .hero p {
            color: var(--muted);
            margin: 0;
            line-height: 1.6;
        }

        .section-title {
            font-size: 17px;
            margin: 32px 0 16px;
            font-weight: 800;
        }

        .section-title span { color: var(--accent); }

        .management-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px;
        }

        .management-card {
            display: flex;
            align-items: center;
            gap: 18px;
            padding: 23px;
            text-decoration: none;
            color: white;
            background: linear-gradient(145deg, #191a25, #11121a);
            border: 1px solid var(--line);
            border-radius: 17px;
            transition: .3s;
            position: relative;
            overflow: hidden;
        }

        .management-card::after {
            content: "";
            position: absolute;
            width: 130px;
            height: 130px;
            right: -55px;
            bottom: -75px;
            border-radius: 50%;
            background: var(--accent-soft);
            transition: .3s;
        }

        .management-card:hover {
            transform: translateY(-5px);
            border-color: var(--accent);
            box-shadow: 0 12px 35px rgba(255,79,154,.10);
        }

        .management-card:hover::after { transform: scale(1.5); }

        .card-icon {
            width: 55px;
            height: 55px;
            flex-shrink: 0;
            display: grid;
            place-items: center;
            border-radius: 14px;
            background: var(--accent-soft);
            color: var(--accent);
            font-size: 25px;
        }

        .card-content { flex: 1; }

        .card-content h3 {
            margin: 0 0 7px;
            font-size: 17px;
        }

        .card-content p {
            margin: 0;
            font-size: 12px;
            color: var(--muted);
            line-height: 1.5;
        }

        .card-arrow {
            color: var(--accent);
            font-size: 24px;
            font-weight: bold;
            z-index: 1;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-top: 18px;
        }

        .stat-card {
            padding: 23px;
            border: 1px solid var(--line);
            background: var(--card);
            border-radius: 16px;
            transition: .3s;
        }

        .stat-card:hover {
            transform: translateY(-4px);
            border-color: rgba(255,79,154,.5);
        }

        .stat-label {
            color: var(--muted);
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 12px;
        }

        .stat-number {
            font-size: 34px;
            font-weight: 900;
        }

        .total-number { color: var(--accent); }
        .unread-number { color: var(--red); }
        .read-number { color: var(--green); }

        .message-section {
            margin-top: 30px;
            padding: 24px;
            background: var(--card);
            border: 1px solid var(--line);
            border-radius: 18px;
        }

        .message-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        .message-heading h2 {
            margin: 0;
            font-size: 20px;
        }

        .search-area {
            display: flex;
            gap: 9px;
            flex-wrap: wrap;
        }

        .search-input {
            min-width: 220px;
            padding: 11px 13px;
            background: #0b0c12;
            color: white;
            border: 1px solid var(--line);
            border-radius: 9px;
            outline: none;
        }

        .search-input:focus { border-color: var(--accent); }

        .action-button {
            padding: 11px 15px;
            border: none;
            border-radius: 9px;
            background: var(--accent);
            color: white;
            font-weight: 700;
            cursor: pointer;
            transition: .25s;
        }

        .action-button:hover {
            background: #e93686;
            transform: translateY(-2px);
        }

        .secondary-button {
            padding: 11px 15px;
            border: 1px solid var(--line);
            border-radius: 9px;
            background: transparent;
            color: var(--muted);
            font-weight: 700;
            cursor: pointer;
        }

        .secondary-button:hover {
            border-color: var(--accent);
            color: white;
        }

        .refresh-button {
            color: var(--green);
            border-color: rgba(53,212,154,.35);
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .messages-table {
            width: 100%;
            min-width: 700px;
            border-collapse: collapse;
        }

        .messages-table th {
            text-align: left;
            color: var(--muted);
            font-size: 11px;
            letter-spacing: 1px;
            text-transform: uppercase;
            padding: 15px 12px;
            border-bottom: 1px solid var(--line);
        }

        .messages-table td {
            padding: 16px 12px;
            border-bottom: 1px solid var(--line);
            font-size: 13px;
            color: #dedee7;
        }

        .messages-table tr:last-child td { border-bottom: none; }

        .grid-action {
            display: inline-block;
            padding: 7px 9px;
            margin: 2px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 11px;
            font-weight: 700;
            border: 1px solid var(--line);
            background: transparent;
        }

        .view-action {
            color: var(--blue);
            border-color: rgba(112,170,255,.35);
        }

        .read-action {
            color: var(--green);
            border-color: rgba(53,212,154,.35);
        }

        .delete-action {
            color: var(--red);
            border-color: rgba(255,101,120,.35);
        }

        .grid-action:hover { background: rgba(255,255,255,.06); }

        .status {
            display: block;
            margin-top: 15px;
            color: var(--accent);
            font-size: 13px;
        }

        .message-details {
            margin-top: 25px;
            padding: 23px;
            border: 1px solid rgba(255,79,154,.3);
            border-radius: 15px;
            background: #101119;
        }

        .message-details h3 {
            margin: 0 0 20px;
            color: var(--accent);
        }

        .detail-row {
            margin-bottom: 13px;
            font-size: 13px;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .detail-row strong {
            color: var(--muted);
            display: inline-block;
            min-width: 95px;
        }

        .detail-message {
            white-space: pre-wrap;
            color: #e4e4ec;
            margin-top: 8px;
            line-height: 1.7;
            overflow-wrap: anywhere;
        }

        .footer {
            text-align: center;
            color: #777987;
            font-size: 12px;
            padding: 30px 0 10px;
        }

        @media (max-width: 750px) {
            body { padding: 20px; }
            .management-grid { grid-template-columns: 1fr; }
            .stats-grid { grid-template-columns: 1fr; }

            .stat-card { padding: 19px; }
            .message-section { padding: 17px; }

            .message-heading { align-items: flex-start; }
            .search-area { width: 100%; }
            .search-input {
                flex: 1;
                min-width: 100%;
            }
        }

        @media (max-width: 480px) {
            body { padding: 14px; }
            .brand { font-size: 19px; }

            .management-card {
                padding: 17px;
                gap: 12px;
            }

            .card-icon {
                width: 46px;
                height: 46px;
                font-size: 21px;
            }

            .card-content h3 { font-size: 15px; }
            .card-content p { font-size: 11px; }
            .message-section { padding: 14px; }
            .message-details { padding: 17px; }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <main class="dashboard">

            <!-- TOP BAR -->
            <header class="topbar">

                <div class="brand">
                    ARU <span>KORE.</span>
                </div>

                <div class="admin-info">

                    <div class="welcome">
                        Welcome back,
                        <strong>
                            <asp:Label ID="lblAdmin" runat="server"></asp:Label>
                        </strong>
                    </div>

                    <!-- NEW: VIEW PUBLIC WEBSITE -->
                    <a href="<%= ResolveUrl("~/Default.aspx") %>"
                       target="_blank"
                       rel="noopener noreferrer"
                       class="website-btn">
                        VIEW WEBSITE ↗
                    </a>

                    <asp:Button ID="btnLogout"
                        runat="server"
                        Text="LOGOUT"
                        CssClass="logout-btn"
                        CausesValidation="false"
                        OnClick="btnLogout_Click" />

                </div>

            </header>

            <!-- HERO -->
            <section class="hero">
                <h1>ADMIN <span>DASHBOARD.</span></h1>
                <p>Manage your portfolio, projects, skills and visitor messages from one place.</p>
            </section>

            <!-- MANAGEMENT MODULES -->
            <h2 class="section-title">
                PORTFOLIO <span>MANAGEMENT</span>
            </h2>

            <section class="management-grid">

                <a href="ManageSkills.aspx" class="management-card">
                    <div class="card-icon">✦</div>
                    <div class="card-content">
                        <h3>Skills Management</h3>
                        <p>Add, edit, activate or remove your technical skills.</p>
                    </div>
                    <div class="card-arrow">→</div>
                </a>

                <a href="ManageProjects.aspx" class="management-card">
                    <div class="card-icon">▣</div>
                    <div class="card-content">
                        <h3>Projects Management</h3>
                        <p>Manage project details, technologies and homepage visibility.</p>
                    </div>
                    <div class="card-arrow">→</div>
                </a>

            </section>

            <!-- MESSAGE STATISTICS -->
            <h2 class="section-title">
                MESSAGE <span>OVERVIEW</span>
            </h2>

            <section class="stats-grid">

                <div class="stat-card">
                    <div class="stat-label">Total Messages</div>
                    <div class="stat-number total-number">
                        <asp:Label ID="lblTotalMessages" runat="server" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-label">Unread Messages</div>
                    <div class="stat-number unread-number">
                        <asp:Label ID="lblUnreadMessages" runat="server" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-label">Read Messages</div>
                    <div class="stat-number read-number">
                        <asp:Label ID="lblReadMessages" runat="server" Text="0"></asp:Label>
                    </div>
                </div>

            </section>

            <!-- CONTACT MESSAGES -->
            <section class="message-section">

                <div class="message-heading">
                    <h2>Visitor Messages</h2>

                    <div class="search-area">

                        <asp:TextBox ID="txtSearch"
                            runat="server"
                            CssClass="search-input"
                            placeholder="Search name, email or subject...">
                        </asp:TextBox>

                        <asp:Button ID="btnSearch"
                            runat="server"
                            Text="SEARCH"
                            CssClass="action-button"
                            CausesValidation="false"
                            OnClick="btnSearch_Click" />

                        <asp:Button ID="btnClearSearch"
                            runat="server"
                            Text="CLEAR"
                            CssClass="secondary-button"
                            CausesValidation="false"
                            OnClick="btnClearSearch_Click" />

                        <asp:Button ID="btnRefresh"
                            runat="server"
                            Text="↻ REFRESH"
                            CssClass="secondary-button refresh-button"
                            CausesValidation="false"
                            OnClick="btnRefresh_Click" />

                    </div>
                </div>

                <div class="table-wrap">

                    <asp:GridView ID="gvMessages"
                        runat="server"
                        AutoGenerateColumns="false"
                        CssClass="messages-table"
                        GridLines="None"
                        DataKeyNames="MessageId"
                        EmptyDataText="No messages found."
                        OnRowCommand="gvMessages_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="SenderName" HeaderText="Name" />
                            <asp:BoundField DataField="SenderEmail" HeaderText="Email" />
                            <asp:BoundField DataField="Subject" HeaderText="Subject" />

                            <asp:BoundField
                                DataField="CreatedAt"
                                HeaderText="Date"
                                DataFormatString="{0:dd MMM yyyy}" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span style='<%# Convert.ToBoolean(Eval("IsRead")) ? "color:#35d49a;font-weight:bold;" : "color:#ff6578;font-weight:bold;" %>'>
                                        <%# Convert.ToBoolean(Eval("IsRead")) ? "Read" : "Unread" %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>

                                    <asp:LinkButton
                                        ID="btnView"
                                        runat="server"
                                        Text="VIEW"
                                        CssClass="grid-action view-action"
                                        CommandName="ViewMessage"
                                        CommandArgument='<%# Eval("MessageId") %>'
                                        CausesValidation="false" />

                                    <asp:LinkButton
                                        ID="btnToggleRead"
                                        runat="server"
                                        Text='<%# Convert.ToBoolean(Eval("IsRead")) ? "MARK UNREAD" : "MARK READ" %>'
                                        CssClass="grid-action read-action"
                                        CommandName="ToggleRead"
                                        CommandArgument='<%# Eval("MessageId") %>'
                                        CausesValidation="false" />

                                    <asp:LinkButton
                                        ID="btnDelete"
                                        runat="server"
                                        Text="DELETE"
                                        CssClass="grid-action delete-action"
                                        CommandName="DeleteMessage"
                                        CommandArgument='<%# Eval("MessageId") %>'
                                        CausesValidation="false"
                                        OnClientClick="return confirm('Are you sure you want to delete this message?');" />

                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

                <asp:Label ID="lblStatus"
                    runat="server"
                    CssClass="status">
                </asp:Label>

                <!-- SELECTED MESSAGE DETAILS -->
                <asp:Panel ID="pnlMessage"
                    runat="server"
                    CssClass="message-details"
                    Visible="false">

                    <h3>Message Details</h3>

                    <div class="detail-row">
                        <strong>Name:</strong>
                        <asp:Literal ID="litName" runat="server"></asp:Literal>
                    </div>

                    <div class="detail-row">
                        <strong>Email:</strong>
                        <asp:Literal ID="litEmail" runat="server"></asp:Literal>
                    </div>

                    <div class="detail-row">
                        <strong>Subject:</strong>
                        <asp:Literal ID="litSubject" runat="server"></asp:Literal>
                    </div>

                    <div class="detail-row">
                        <strong>Date:</strong>
                        <asp:Literal ID="litDate" runat="server"></asp:Literal>
                    </div>

                    <div class="detail-row">
                        <strong>Message:</strong>
                        <div class="detail-message">
                            <asp:Literal ID="litMessage" runat="server"></asp:Literal>
                        </div>
                    </div>

                </asp:Panel>

            </section>

            <footer class="footer">
                © 2026 ARU KORE. Admin Control Center.
            </footer>

        </main>

    </form>
</body>
</html>
