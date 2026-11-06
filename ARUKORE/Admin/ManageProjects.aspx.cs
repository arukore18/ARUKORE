using System;
using System.Data;
using System.Data.SqlClient;
using ARUKORE.Database;

namespace ARUKORE.Admin
{
    public partial class ManageProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin session security
            if (Session["AdminId"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            if (!IsPostBack)
            {
                LoadProjects();
            }
        }

        // LOAD ALL PROJECTS
        private void LoadProjects()
        {
            try
            {
                using (SqlConnection con = DBConnection.GetConnection())
                {
                    string query = @"
                        SELECT ProjectId, ProjectName, ShortDescription,
                               Technologies, ProjectType, IsActive,
                               IsFeatured, DisplayOrder
                        FROM dbo.Projects
                        ORDER BY DisplayOrder, ProjectName";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvProjects.DataSource = dt;
                        gvProjects.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Unable to load projects: " +
                    Server.HtmlEncode(ex.Message);
            }
        }

        // ADD OR UPDATE PROJECT
        protected void btnSaveProject_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
                return;

            string projectName = txtProjectName.Text.Trim();
            string description = txtShortDescription.Text.Trim();
            string technologies = txtTechnologies.Text.Trim();
            string projectType = txtProjectType.Text.Trim();

            int displayOrder;

            if (string.IsNullOrWhiteSpace(projectName))
            {
                lblStatus.Text = "Please enter a project name.";
                return;
            }

            if (string.IsNullOrWhiteSpace(description))
            {
                lblStatus.Text = "Please enter a project description.";
                return;
            }

            if (!int.TryParse(txtDisplayOrder.Text.Trim(), out displayOrder)
                || displayOrder < 0)
            {
                lblStatus.Text = "Enter a valid display order.";
                return;
            }

            try
            {
                using (SqlConnection con = DBConnection.GetConnection())
                {
                    con.Open();

                    string query;

                    if (string.IsNullOrWhiteSpace(hfProjectId.Value))
                    {
                        query = @"
                            INSERT INTO dbo.Projects
                            (
                                ProjectName,
                                ShortDescription,
                                Technologies,
                                ProjectType,
                                IsActive,
                                IsFeatured,
                                DisplayOrder
                            )
                            VALUES
                            (
                                @ProjectName,
                                @ShortDescription,
                                @Technologies,
                                @ProjectType,
                                @IsActive,
                                @IsFeatured,
                                @DisplayOrder
                            )";
                    }
                    else
                    {
                        query = @"
                            UPDATE dbo.Projects
                            SET ProjectName = @ProjectName,
                                ShortDescription = @ShortDescription,
                                Technologies = @Technologies,
                                ProjectType = @ProjectType,
                                IsActive = @IsActive,
                                IsFeatured = @IsFeatured,
                                DisplayOrder = @DisplayOrder
                            WHERE ProjectId = @ProjectId";
                    }

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ProjectName", projectName);
                        cmd.Parameters.AddWithValue("@ShortDescription", description);
                        cmd.Parameters.AddWithValue("@Technologies", technologies);
                        cmd.Parameters.AddWithValue("@ProjectType", projectType);
                        cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);
                        cmd.Parameters.AddWithValue("@IsFeatured", chkIsFeatured.Checked);
                        cmd.Parameters.AddWithValue("@DisplayOrder", displayOrder);

                        if (!string.IsNullOrWhiteSpace(hfProjectId.Value))
                        {
                            int projectId;

                            if (!int.TryParse(hfProjectId.Value, out projectId))
                            {
                                lblStatus.Text = "Invalid project selection.";
                                return;
                            }

                            cmd.Parameters.AddWithValue("@ProjectId", projectId);
                        }

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            lblStatus.Text = "Project saved successfully!";
                            ClearForm();
                            LoadProjects();
                        }
                        else
                        {
                            lblStatus.Text = "No changes were made.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error saving project: " +
                    Server.HtmlEncode(ex.Message);
            }
        }

        // EDIT OR DELETE PROJECT
        protected void gvProjects_RowCommand(
            object sender,
            System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int projectId;

            if (!int.TryParse(Convert.ToString(e.CommandArgument), out projectId))
                return;

            if (e.CommandName == "EditProject")
            {
                LoadProjectForEdit(projectId);
            }
            else if (e.CommandName == "DeleteProject")
            {
                DeleteProject(projectId);
            }
        }

        // LOAD SELECTED PROJECT INTO FORM
        private void LoadProjectForEdit(int projectId)
        {
            try
            {
                using (SqlConnection con = DBConnection.GetConnection())
                {
                    string query = @"
                        SELECT ProjectId, ProjectName, ShortDescription,
                               Technologies, ProjectType, IsActive,
                               IsFeatured, DisplayOrder
                        FROM dbo.Projects
                        WHERE ProjectId = @ProjectId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@ProjectId", SqlDbType.Int)
                            .Value = projectId;

                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                hfProjectId.Value =
                                    reader["ProjectId"].ToString();

                                txtProjectName.Text =
                                    reader["ProjectName"].ToString();

                                txtShortDescription.Text =
                                    reader["ShortDescription"].ToString();

                                txtTechnologies.Text =
                                    reader["Technologies"].ToString();

                                txtProjectType.Text =
                                    reader["ProjectType"].ToString();

                                txtDisplayOrder.Text =
                                    reader["DisplayOrder"].ToString();

                                chkIsActive.Checked =
                                    Convert.ToBoolean(reader["IsActive"]);

                                chkIsFeatured.Checked =
                                    Convert.ToBoolean(reader["IsFeatured"]);

                                btnSaveProject.Text = "UPDATE PROJECT";
                                btnCancelEdit.Visible = true;

                                lblStatus.Text = "Editing selected project.";
                            }
                            else
                            {
                                lblStatus.Text = "Project not found.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error loading project: " +
                    Server.HtmlEncode(ex.Message);
            }
        }

        // DELETE PROJECT
        private void DeleteProject(int projectId)
        {
            try
            {
                using (SqlConnection con = DBConnection.GetConnection())
                {
                    string query = @"
                        DELETE FROM dbo.Projects
                        WHERE ProjectId = @ProjectId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@ProjectId", SqlDbType.Int)
                            .Value = projectId;

                        con.Open();

                        int result = cmd.ExecuteNonQuery();

                        lblStatus.Text = result > 0
                            ? "Project deleted successfully!"
                            : "Project not found.";
                    }
                }

                ClearForm();
                LoadProjects();
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error deleting project: " +
                    Server.HtmlEncode(ex.Message);
            }
        }

        // CANCEL EDIT
        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            ClearForm();
            lblStatus.Text = "Edit cancelled.";
        }

        // CLEAR FORM
        private void ClearForm()
        {
            hfProjectId.Value = "";

            txtProjectName.Text = "";
            txtShortDescription.Text = "";
            txtTechnologies.Text = "";
            txtProjectType.Text = "";
            txtDisplayOrder.Text = "1";

            chkIsActive.Checked = true;
            chkIsFeatured.Checked = true;

            btnSaveProject.Text = "SAVE PROJECT";
            btnCancelEdit.Visible = false;
        }
    }
}