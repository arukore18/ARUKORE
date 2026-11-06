<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ManageSkills.aspx.cs"
    Inherits="ARUKORE.Admin.ManageSkills" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Manage Skills | ARU KORE</title>

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
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 30px;
            background:
                radial-gradient(circle at 10% 0%, rgba(255,79,154,.10), transparent 35%),
                var(--bg);
            color: var(--text);
            font-family: Arial, sans-serif;
            min-height: 100vh;
        }

        .page {
            max-width: 1150px;
            margin: auto;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .brand {
            font-size: 22px;
            font-weight: 900;
            letter-spacing: 2px;
        }

        .brand span {
            color: var(--accent);
        }

        .back-link {
            color: var(--muted);
            text-decoration: none;
            border: 1px solid var(--line);
            padding: 11px 17px;
            border-radius: 10px;
            transition: .25s;
        }

        .back-link:hover {
            color: white;
            border-color: var(--accent);
        }

        .heading {
            margin-bottom: 25px;
        }

        .heading h1 {
            font-size: clamp(28px, 5vw, 42px);
            margin: 0 0 10px;
            font-weight: 900;
        }

        .heading h1 span {
            color: var(--accent);
        }

        .heading p {
            color: var(--muted);
            line-height: 1.6;
            margin: 0;
        }

        .layout {
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: 22px;
            align-items: start;
        }

        .panel {
            background: rgba(20,21,30,.95);
            border: 1px solid var(--line);
            border-radius: 18px;
            padding: 24px;
            box-shadow: 0 15px 45px rgba(0,0,0,.2);
        }

        .panel h2 {
            margin: 0 0 22px;
            font-size: 19px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 9px;
            font-size: 13px;
            font-weight: 700;
            color: #d8d8e1;
        }

        .form-control {
            width: 100%;
            padding: 13px 14px;
            background: #0c0d13;
            color: white;
            border: 1px solid var(--line);
            border-radius: 10px;
            outline: none;
            font-size: 14px;
            transition: .25s;
        }

        .form-control:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px var(--accent-soft);
        }

        .check-row {
            display: flex;
            gap: 10px;
            align-items: center;
            color: var(--muted);
            font-size: 14px;
            margin: 16px 0;
        }

        .check-row input {
            accent-color: var(--accent);
            width: 17px;
            height: 17px;
        }

        .primary-btn {
            width: 100%;
            border: none;
            border-radius: 10px;
            padding: 14px;
            background: linear-gradient(135deg, #ff4f9a, #d92e80);
            color: white;
            font-weight: 800;
            font-size: 14px;
            cursor: pointer;
            transition: .25s;
        }

        .primary-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255,79,154,.25);
        }

        .secondary-btn {
            display: block;
            width: 100%;
            text-align: center;
            margin-top: 10px;
            padding: 12px;
            border-radius: 10px;
            color: var(--muted);
            text-decoration: none;
            border: 1px solid var(--line);
        }

        .status {
            display: block;
            margin-top: 15px;
            color: var(--accent);
            font-size: 13px;
            line-height: 1.5;
        }

        .table-panel {
            overflow: hidden;
        }

        .table-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .table-heading h2 {
            margin: 0;
        }

        .table-count {
            color: var(--accent);
            background: var(--accent-soft);
            padding: 7px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .skills-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 530px;
        }

        .skills-table th {
            text-align: left;
            color: var(--muted);
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 14px 12px;
            border-bottom: 1px solid var(--line);
        }

        .skills-table td {
            padding: 16px 12px;
            border-bottom: 1px solid var(--line);
            font-size: 13px;
        }

        .skills-table tr:last-child td {
            border-bottom: none;
        }

        .skill-name {
            font-weight: 700;
            color: white;
        }

        .active-status {
            color: var(--green);
            font-weight: 700;
        }

        .inactive-status {
            color: var(--red);
            font-weight: 700;
        }

        .action-btn {
            display: inline-block;
            padding: 7px 10px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 11px;
            font-weight: 700;
            margin: 2px;
            border: 1px solid var(--line);
        }

        .edit-btn {
            color: var(--accent);
            border-color: rgba(255,79,154,.35);
        }

        .delete-btn {
            color: var(--red);
            border-color: rgba(255,101,120,.35);
        }

        .action-btn:hover {
            background: rgba(255,255,255,.06);
        }

        .empty-message {
            color: var(--muted);
            text-align: center;
            padding: 30px !important;
        }

        @media (max-width: 850px) {
            body {
                padding: 20px;
            }

            .layout {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 14px;
            }

            .panel {
                padding: 18px;
                border-radius: 14px;
            }

            .brand {
                font-size: 19px;
            }

            .back-link {
                padding: 9px 12px;
                font-size: 12px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="page">

            <div class="topbar">
                <div class="brand">ARU <span>KORE.</span></div>

                <a href="Dashboard.aspx" class="back-link">
                    ← Back to Dashboard
                </a>
            </div>

            <div class="heading">
                <h1>SKILLS <span>MANAGEMENT</span></h1>
                <p>Manage your technical skills and control what appears on your portfolio.</p>
            </div>

            <div class="layout">

                <!-- ADD / EDIT SKILL -->
                <section class="panel">

                    <h2>＋ Add / Edit Skill</h2>

                    <asp:HiddenField ID="hfSkillId" runat="server" />

                    <div class="form-group">
                        <label for="txtSkillName">Skill Name</label>
                        <asp:TextBox ID="txtSkillName"
                            runat="server"
                            CssClass="form-control"
                            MaxLength="100"
                            placeholder="Example: Java, Spring Boot, SQL">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvSkillName"
                            runat="server"
                            ControlToValidate="txtSkillName"
                            ErrorMessage="Please enter a skill name."
                            ForeColor="#ff6578"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtDisplayOrder">Display Order</label>
                        <asp:TextBox ID="txtDisplayOrder"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            Text="1">
                        </asp:TextBox>
                    </div>

                    <div class="check-row">
                        <asp:CheckBox ID="chkIsActive"
                            runat="server"
                            Checked="true" />
                        <label for="<%= chkIsActive.ClientID %>">Show this skill on homepage</label>
                    </div>

                    <asp:Button ID="btnSaveSkill"
                        runat="server"
                        Text="SAVE SKILL"
                        CssClass="primary-btn"
                        OnClick="btnSaveSkill_Click" />

                    <asp:Button ID="btnCancelEdit"
                        runat="server"
                        Text="CANCEL EDIT"
                        CssClass="secondary-btn"
                        CausesValidation="false"
                        OnClick="btnCancelEdit_Click"
                        Visible="false" />

                    <asp:Label ID="lblStatus"
                        runat="server"
                        CssClass="status">
                    </asp:Label>

                </section>

                <!-- SKILLS LIST -->
                <section class="panel table-panel">

                    <div class="table-heading">
                        <h2>Your Skills</h2>
                        <span class="table-count">
                            MANAGE ALL
                        </span>
                    </div>

                    <div class="table-wrap">

                        <asp:GridView ID="gvSkills"
                            runat="server"
                            AutoGenerateColumns="false"
                            CssClass="skills-table"
                            GridLines="None"
                            DataKeyNames="SkillId"
                            EmptyDataText="No skills found. Add your first skill."
                            OnRowCommand="gvSkills_RowCommand">

                            <Columns>

                                <asp:BoundField
                                    DataField="SkillName"
                                    HeaderText="Skill"
                                    ItemStyle-CssClass="skill-name" />

                                <asp:BoundField
                                    DataField="DisplayOrder"
                                    HeaderText="Order" />

                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <span class='<%# Convert.ToBoolean(Eval("IsActive")) ? "active-status" : "inactive-status" %>'>
                                            <%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>

                                        <asp:LinkButton
                                            ID="btnEdit"
                                            runat="server"
                                            Text="EDIT"
                                            CssClass="action-btn edit-btn"
                                            CommandName="EditSkill"
                                            CommandArgument='<%# Eval("SkillId") %>'
                                            CausesValidation="false" />

                                        <asp:LinkButton
                                            ID="btnDelete"
                                            runat="server"
                                            Text="DELETE"
                                            CssClass="action-btn delete-btn"
                                            CommandName="DeleteSkill"
                                            CommandArgument='<%# Eval("SkillId") %>'
                                            CausesValidation="false"
                                            OnClientClick="return confirm('Are you sure you want to delete this skill?');" />

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                            <EmptyDataRowStyle CssClass="empty-message" />

                        </asp:GridView>

                    </div>

                </section>

            </div>

        </div>

    </form>
</body>
</html>