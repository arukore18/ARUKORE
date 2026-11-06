using System;
using System.Data;
using System.Data.SqlClient;
using ARUKORE.Database;

namespace ARUKORE.Admin
{
    public partial class ManageSkills : System.Web.UI.Page
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
                LoadSkills();
            }
        }

        // LOAD ALL SKILLS
        private void LoadSkills()
        {
            try
            {
                using (SqlConnection con = DBConnection.GetConnection())
                {
                    string query = @"
                        SELECT SkillId, SkillName, IsActive, DisplayOrder
                        FROM dbo.Skills
                        ORDER BY DisplayOrder, SkillName";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            gvSkills.DataSource = dt;
                            gvSkills.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Unable to load skills: " + Server.HtmlEncode(ex.Message);
            }
        }

        // ADD OR UPDATE SKILL
        protected void btnSaveSkill_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
                return;

            string skillName = txtSkillName.Text.Trim();

            int displayOrder;

            if (string.IsNullOrWhiteSpace(skillName))
            {
                lblStatus.Text = "Please enter a skill name.";
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

                    if (string.IsNullOrWhiteSpace(hfSkillId.Value))
                    {
                        query = @"
                            INSERT INTO dbo.Skills
                            (SkillName, IsActive, DisplayOrder)
                            VALUES
                            (@SkillName, @IsActive, @DisplayOrder)";
                    }
                    else
                    {
                        query = @"
                            UPDATE dbo.Skills
                            SET SkillName = @SkillName,
                                IsActive = @IsActive,
                                DisplayOrder = @DisplayOrder
                            WHERE SkillId = @SkillId";
                    }

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@SkillName", SqlDbType.NVarChar, 100)
                            .Value = skillName;

                        cmd.Parameters.Add("@IsActive", SqlDbType.Bit)
                            .Value = chkIsActive.Checked;

                        cmd.Parameters.Add("@DisplayOrder", SqlDbType.Int)
                            .Value = displayOrder;

                        if (!string.IsNullOrWhiteSpace(hfSkillId.Value))
                        {
                            int skillId;

                            if (!int.TryParse(hfSkillId.Value, out skillId))
                            {
                                lblStatus.Text = "Invalid skill selection.";
                                return;
                            }

                            cmd.Parameters.Add("@SkillId", SqlDbType.Int)
                                .Value = skillId;
                        }

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            lblStatus.Text = "Skill saved successfully!";
                            ClearForm();
                            LoadSkills();
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
                lblStatus.Text = "Error saving skill: " +
                    Server.HtmlEncode(ex.Message);
            }
        }

        // EDIT / DELETE SKILL
        protected void gvSkills_RowCommand(object sender,
            System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int skillId;

            if (!int.TryParse(Convert.ToString(e.CommandArgument), out skillId))
                return;

            if (e.CommandName == "EditSkill")
            {
                LoadSkillForEdit(skillId);
            }
            else if (e.CommandName == "DeleteSkill")
            {
                DeleteSkill(skillId);
            }
        }

        // LOAD SELECTED SKILL INTO FORM
        private void LoadSkillForEdit(int skillId)
        {
            try
            {
                using (SqlConnection con = DBConnection.GetConnection())
                {
                    string query = @"
                        SELECT SkillId, SkillName, IsActive, DisplayOrder
                        FROM dbo.Skills
                        WHERE SkillId = @SkillId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@SkillId", SqlDbType.Int)
                            .Value = skillId;

                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                hfSkillId.Value = reader["SkillId"].ToString();
                                txtSkillName.Text = reader["SkillName"].ToString();
                                txtDisplayOrder.Text = reader["DisplayOrder"].ToString();

                                chkIsActive.Checked =
                                    Convert.ToBoolean(reader["IsActive"]);

                                btnSaveSkill.Text = "UPDATE SKILL";
                                btnCancelEdit.Visible = true;

                                lblStatus.Text = "Editing selected skill.";
                            }
                            else
                            {
                                lblStatus.Text = "Skill not found.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error loading skill: " +
                    Server.HtmlEncode(ex.Message);
            }
        }

        // DELETE SKILL
        private void DeleteSkill(int skillId)
        {
            try
            {
                using (SqlConnection con = DBConnection.GetConnection())
                {
                    string query = @"
                        DELETE FROM dbo.Skills
                        WHERE SkillId = @SkillId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@SkillId", SqlDbType.Int)
                            .Value = skillId;

                        con.Open();

                        int result = cmd.ExecuteNonQuery();

                        lblStatus.Text = result > 0
                            ? "Skill deleted successfully!"
                            : "Skill not found.";
                    }
                }

                ClearForm();
                LoadSkills();
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error deleting skill: " +
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
            hfSkillId.Value = "";
            txtSkillName.Text = "";
            txtDisplayOrder.Text = "1";
            chkIsActive.Checked = true;

            btnSaveSkill.Text = "SAVE SKILL";
            btnCancelEdit.Visible = false;
        }
    }
}