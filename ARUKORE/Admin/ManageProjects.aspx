<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ManageProjects.aspx.cs"
    Inherits="ARUKORE.Admin.ManageProjects" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Manage Projects | ARU KORE</title>

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
            max-width: 1250px;
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
            grid-template-columns: 390px 1fr;
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
            margin-bottom: 17px;
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
            font-family: Arial, sans-serif;
            transition: .25s;
        }

        textarea.form-control {
            min-height: 105px;
            resize: vertical;
            line-height: 1.5;
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
            font-size: 13px;
            margin: 14px 0;
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

        .projects-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 750px;
        }

        .projects-table th {
            text-align: left;
            color: var(--muted);
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 14px 12px;
            border-bottom: 1px solid var(--line);
        }

        .projects-table td {
            padding: 16px 12px;
            border-bottom: 1px solid var(--line);
            font-size: 13px;
            vertical-align: top;
        }

        .projects-table tr:last-child td {
            border-bottom: none;
        }

        .project-name {
            color: white;
            font-weight: 700;
        }

        .active-status {
            color: var(--green);
            font-weight: 700;
        }

        .inactive-status {
            color: var(--red);
            font-weight: 700;
        }

        .featured-status {
            color: #ffcb70;
            font-weight: 700;
        }

        .normal-status {
            color: var(--muted);
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

        @media (max-width: 1050px) {
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
                <h1>PROJECTS <span>MANAGEMENT</span></h1>
                <p>Add, update and organize the projects displayed on your portfolio.</p>
            </div>

            <div class="layout">

                <!-- ADD / EDIT PROJECT -->
                <section class="panel">

                    <h2>＋ Add / Edit Project</h2>

                    <asp:HiddenField ID="hfProjectId" runat="server" />

                    <div class="form-group">
                        <label for="txtProjectName">Project Name</label>

                        <asp:TextBox ID="txtProjectName"
                            runat="server"
                            CssClass="form-control"
                            MaxLength="200"
                            placeholder="Example: ShopEase E-commerce">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvProjectName"
                            runat="server"
                            ControlToValidate="txtProjectName"
                            ErrorMessage="Please enter project name."
                            ForeColor="#ff6578"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtShortDescription">Short Description</label>

                        <asp:TextBox ID="txtShortDescription"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            placeholder="Write a short project description...">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvDescription"
                            runat="server"
                            ControlToValidate="txtShortDescription"
                            ErrorMessage="Please enter project description."
                            ForeColor="#ff6578"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtTechnologies">Technologies</label>

                        <asp:TextBox ID="txtTechnologies"
                            runat="server"
                            CssClass="form-control"
                            MaxLength="500"
                            placeholder="Java, Spring Boot, MySQL">
                        </asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtProjectType">Project Type</label>

                        <asp:TextBox ID="txtProjectType"
                            runat="server"
                            CssClass="form-control"
                            MaxLength="100"
                            placeholder="Full Stack Web Application">
                        </asp:TextBox>
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
                        <label for="<%= chkIsActive.ClientID %>">Active project</label>
                    </div>

                    <div class="check-row">
                        <asp:CheckBox ID="chkIsFeatured"
                            runat="server"
                            Checked="true" />
                        <label for="<%= chkIsFeatured.ClientID %>">Show on homepage</label>
                    </div>

                    <asp:Button ID="btnSaveProject"
                        runat="server"
                        Text="SAVE PROJECT"
                        CssClass="primary-btn"
                        OnClick="btnSaveProject_Click" />

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

                <!-- PROJECT LIST -->
                <section class="panel table-panel">

                    <div class="table-heading">
                        <h2>Your Projects</h2>
                        <span class="table-count">MANAGE ALL</span>
                    </div>

                    <div class="table-wrap">

                        <asp:GridView ID="gvProjects"
                            runat="server"
                            AutoGenerateColumns="false"
                            CssClass="projects-table"
                            GridLines="None"
                            DataKeyNames="ProjectId"
                            EmptyDataText="No projects found. Add your first project."
                            OnRowCommand="gvProjects_RowCommand">

                            <Columns>

                                <asp:BoundField
                                    DataField="ProjectName"
                                    HeaderText="Project"
                                    ItemStyle-CssClass="project-name" />

                                <asp:BoundField
                                    DataField="ProjectType"
                                    HeaderText="Type" />

                                <asp:BoundField
                                    DataField="DisplayOrder"
                                    HeaderText="Order" />

                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <span class='<%# Convert.ToBoolean(Eval("IsActive")) ? "active-status" : "inactive-status" %>'>
                                            <%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>
                                        </span>
                                        <br />
                                        <span class='<%# Convert.ToBoolean(Eval("IsFeatured")) ? "featured-status" : "normal-status" %>'>
                                            <%# Convert.ToBoolean(Eval("IsFeatured")) ? "Featured" : "Not Featured" %>
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
                                            CommandName="EditProject"
                                            CommandArgument='<%# Eval("ProjectId") %>'
                                            CausesValidation="false" />

                                        <asp:LinkButton
                                            ID="btnDelete"
                                            runat="server"
                                            Text="DELETE"
                                            CssClass="action-btn delete-btn"
                                            CommandName="DeleteProject"
                                            CommandArgument='<%# Eval("ProjectId") %>'
                                            CausesValidation="false"
                                            OnClientClick="return confirm('Are you sure you want to delete this project?');" />

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