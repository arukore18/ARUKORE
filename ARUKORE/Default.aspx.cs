using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ARUKORE
{
    public partial class Default : System.Web.UI.Page
    {
        private const string SkillsQuery =
            @"SELECT SkillId, SkillName
              FROM dbo.Skills
              WHERE IsActive = 1
              ORDER BY DisplayOrder, SkillName";

        private const string ProjectsQuery =
            @"SELECT ProjectId, ProjectName, ShortDescription,
                     Technologies, ProjectType
              FROM dbo.Projects
              WHERE IsActive = 1 AND IsFeatured = 1
              ORDER BY DisplayOrder, ProjectName";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            try
            {
                rptSkills.DataSource = DbHelper.GetTable(SkillsQuery);
                rptSkills.DataBind();

                rptProjects.DataSource = DbHelper.GetTable(ProjectsQuery);
                rptProjects.DataBind();
            }
            catch (SqlException ex)
            {
                ShowDatabaseError(ex);
            }
            catch (ConfigurationErrorsException ex)
            {
                ShowDatabaseError(ex);
            }
        }

        private void ShowDatabaseError(Exception ex)
        {
            lblDbStatus.Text =
                "Content is temporarily unavailable.";

            if (Context.IsDebuggingEnabled)
            {
                lblDbStatus.Text +=
                    " [Debug: " +
                    Server.HtmlEncode(ex.Message) + "]";
            }
        }
    }
}