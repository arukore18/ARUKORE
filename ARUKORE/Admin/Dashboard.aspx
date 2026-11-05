
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="ARUKORE.Admin.Dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>ARU KORE | Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #101014;
            color: #f5f5f5;
        }

        .layout {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 235px;
            flex-shrink: 0;
            background: #191920;
            padding: 28px 18px;
            border-right: 1px solid #30303a;
        }

        .brand {
            font-size: 23px;
            font-weight: bold;
            letter-spacing: 1px;
            margin: 0 0 8px;
        }

        .brand span { color: #e879a9; }

        .side-caption {
            color: #888894;
            font-size: 12px;
            margin-bottom: 38px;
        }

        .nav-link {
            display: block;
            padding: 13px 14px;
            margin: 8px 0;
            border-radius: 8px;
            color: #c5c5ce;
            text-decoration: none;
        }

        .nav-link:hover, .nav-link.active {
            background: #30232d;
            color: #f29ac0;
        }

        .main {
            flex: 1;
            min-width: 0;
            padding: 32px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .topbar h1 {
            margin: 0 0 8px;
            font-size: 27px;
        }

        .muted { color: #9999a5; }

        .logout {
            background: #e879a9;
            color: #171019;
            border: 0;
            border-radius: 7px;
            padding: 11px 19px;
            font-weight: bold;
            cursor: pointer;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 18px;
            margin: 30px 0;
        }

        .stat-card, .panel {
            background: #1c1c24;
            border: 1px solid #30303a;
            border-radius: 12px;
            padding: 22px;
        }

        .stat-card p {
            color: #a5a5b0;
            margin: 0 0 14px;
        }

        .count {
            display: block;
            font-size: 32px;
            font-weight: bold;
            color: #e879a9;
        }

        .stat-card:nth-child(2) .count { color: #f5bd75; }
        .stat-card:nth-child(3) .count { color: #7bd6a5; }

        .panel { margin-bottom: 24px; }

        .panel h2 {
            font-size: 19px;
            margin: 0 0 20px;
        }

        .search-row {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 18px;
        }

        .search-box {
            flex: 1;
            min-width: 200px;
            padding: 12px 14px;
            border: 1px solid #41414d;
            border-radius: 7px;
            background: #121218;
            color: white;
        }

        .search-btn, .clear-btn {
            padding: 11px 17px;
            border: 0;
            border-radius: 7px;
            cursor: pointer;
            font-weight: bold;
        }

        .search-btn {
            background: #e879a9;
            color: #171019;
        }

        .clear-btn {
            background: #34343e;
            color: white;
        }

        .table-wrap { overflow-x: auto; }

        .grid {
            width: 100%;
            min-width: 850px;
            border-collapse: collapse;
        }

        .grid th {
            color: #e879a9;
            background: #25252e;
            font-size: 13px;
        }

        .grid th, .grid td {
            padding: 14px 12px;
            border-bottom: 1px solid #353540;
            text-align: left;
        }

        .grid td { color: #ddddE5; }

        .action {
            color: #e879a9;
            background: none;
            border: 0;
            cursor: pointer;
            margin: 3px 5px 3px 0;
            text-decoration: none;
        }

        .delete { color: #ff8585; }

        .status {
            display: block;
            margin-top: 14px;
            color: #e879a9;
        }

        .detail {
            line-height: 1.8;
            overflow-wrap: anywhere;
        }

        .detail-message { white-space: pre-wrap; }

        @media (max-width: 800px) {
            .layout { display: block; }
            .sidebar {
                width: 100%;
                padding: 18px;
                border-right: 0;
                border-bottom: 1px solid #30303a;
            }
            .side-caption { margin-bottom: 12px; }
            .nav-link {
                display: inline-block;
                margin: 3px;
            }
            .main { padding: 20px; }
        }

        @media (max-width: 560px) {
            .stats { grid-template-columns: 1fr; }
            .topbar h1 { font-size: 23px; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="layout">

    <aside class="sidebar">
        <div class="brand">ARU<span>KORE.</span></div>
        <div class="side-caption">ADMIN PANEL</div>

        <a class="nav-link active" href="#overview">Dashboard</a>
        <a class="nav-link" href="#messages">Contact Messages</a>
        <a class="nav-link" href="#details">Message Details</a>
        <a class="nav-link" href="../Default.aspx" target="_blank">View Website ↗</a>
    </aside>

    <main class="main">

        <div class="topbar" id="overview">
            <div>
                <h1>Dashboard Overview</h1>
                <div class="muted">
                    Welcome back,
                    <asp:Label ID="lblAdmin" runat="server" />
                </div>
            </div>

            <asp:Button ID="btnLogout" runat="server"
                Text="Logout"
                CssClass="logout"
                OnClick="btnLogout_Click" />
        </div>

        <div class="stats">
            <div class="stat-card">
                <p>Total Contact Messages</p>
                <asp:Label ID="lblTotalMessages" runat="server"
                    CssClass="count" Text="0" />
            </div>

            <div class="stat-card">
                <p>Unread Messages</p>
                <asp:Label ID="lblUnreadMessages" runat="server"
                    CssClass="count" Text="0" />
            </div>

            <div class="stat-card">
                <p>Read Messages</p>
                <asp:Label ID="lblReadMessages" runat="server"
                    CssClass="count" Text="0" />
            </div>
        </div>

        <section class="panel" id="messages">
            <h2>Contact Messages</h2>

            <div class="search-row">
                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="search-box"
                    placeholder="Search name, email or subject..." />

                <asp:Button ID="btnSearch" runat="server"
                    Text="Search"
                    CssClass="search-btn"
                    OnClick="btnSearch_Click" />

                <asp:Button ID="btnClearSearch" runat="server"
                    Text="Clear"
                    CssClass="clear-btn"
                    OnClick="btnClearSearch_Click"
                    CausesValidation="false" />
            </div>

            <div class="table-wrap">
                <asp:GridView ID="gvMessages" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="grid"
                    GridLines="None"
                    DataKeyNames="MessageId"
                    EmptyDataText="No contact messages found."
                    OnRowCommand="gvMessages_RowCommand">

                    <Columns>
                        <asp:BoundField DataField="MessageId" HeaderText="ID" />
                        <asp:BoundField DataField="SenderName" HeaderText="Name" />
                        <asp:BoundField DataField="SenderEmail" HeaderText="Email" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" />

                        <asp:BoundField DataField="CreatedAt"
                            HeaderText="Date"
                            DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" />

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <%#: Convert.ToBoolean(Eval("IsRead"))
                                    ? "Read" : "Unread" %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton runat="server"
                                    Text="View"
                                    CssClass="action"
                                    CommandName="ViewMessage"
                                    CommandArgument='<%# Eval("MessageId") %>' />

                                <asp:LinkButton runat="server"
                                    Text='<%# Convert.ToBoolean(Eval("IsRead"))
                                        ? "Mark Unread" : "Mark Read" %>'
                                    CssClass="action"
                                    CommandName="ToggleRead"
                                    CommandArgument='<%# Eval("MessageId") %>' />

                                <asp:LinkButton runat="server"
                                    Text="Delete"
                                    CssClass="action delete"
                                    CommandName="DeleteMessage"
                                    CommandArgument='<%# Eval("MessageId") %>'
                                    OnClientClick="return confirm('Delete this message permanently?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <asp:Label ID="lblStatus" runat="server"
                CssClass="status" />
        </section>

        <section class="panel" id="details">
            <asp:Panel ID="pnlMessage" runat="server" Visible="false">
                <h2>Message Details</h2>

                <div class="detail">
                    <p><strong>Name:</strong>
                        <asp:Literal ID="litName" runat="server" Mode="Encode" /></p>

                    <p><strong>Email:</strong>
                        <asp:Literal ID="litEmail" runat="server" Mode="Encode" /></p>

                    <p><strong>Subject:</strong>
                        <asp:Literal ID="litSubject" runat="server" Mode="Encode" /></p>

                    <p><strong>Date:</strong>
                        <asp:Literal ID="litDate" runat="server" Mode="Encode" /></p>

                    <p><strong>Message:</strong></p>
                    <div class="detail-message">
                        <asp:Literal ID="litMessage" runat="server" Mode="Encode" />
                    </div>
                </div>
            </asp:Panel>
        </section>

    </main>
</div>

</form>
</body>
</html>
