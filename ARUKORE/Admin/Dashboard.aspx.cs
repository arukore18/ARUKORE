
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using ARUKORE.Database;

namespace ARUKORE.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            if (!IsPostBack)
            {
                lblAdmin.Text =
                    Convert.ToString(Session["AdminUsername"]);

                LoadMessages();
            }
        }


        private void LoadMessages()
        {
            const string statsQuery = @"
        SELECT
            COUNT(*) AS TotalMessages,
            COALESCE(SUM(CASE WHEN IsRead = 0 THEN 1 ELSE 0 END), 0) AS UnreadMessages,
            COALESCE(SUM(CASE WHEN IsRead = 1 THEN 1 ELSE 0 END), 0) AS ReadMessages
        FROM dbo.ContactMessages";

            const string messagesQuery = @"
        SELECT MessageId, SenderName, SenderEmail,
               Subject, CreatedAt, IsRead
        FROM dbo.ContactMessages
        WHERE SenderName LIKE @Search
           OR SenderEmail LIKE @Search
           OR ISNULL(Subject, '') LIKE @Search
        ORDER BY CreatedAt DESC";

            try
            {
                using (SqlConnection con = DBConnection.GetConnection())
                {
                    con.Open();

                    using (SqlCommand statsCmd =
                        new SqlCommand(statsQuery, con))
                    using (SqlDataReader reader = statsCmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTotalMessages.Text =
                                reader["TotalMessages"].ToString();

                            lblUnreadMessages.Text =
                                reader["UnreadMessages"].ToString();

                            lblReadMessages.Text =
                                reader["ReadMessages"].ToString();
                        }
                    }

                    string search = "%" + txtSearch.Text.Trim() + "%";

                    using (SqlCommand cmd =
                        new SqlCommand(messagesQuery, con))
                    {
                        cmd.Parameters.Add("@Search", SqlDbType.NVarChar, 300)
                            .Value = search;

                        DataTable dt = new DataTable();

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }

                        gvMessages.DataSource = dt;
                        gvMessages.DataBind();
                    }
                }
            }
            catch (SqlException)
            {
                lblStatus.Text = "Unable to load contact messages.";
            }
        }

        protected void gvMessages_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            int messageId;

            if (!int.TryParse(Convert.ToString(e.CommandArgument),
                out messageId) || messageId <= 0)
            {
                lblStatus.Text = "Invalid message selected.";
                return;
            }

            try
            {
                if (e.CommandName == "ViewMessage")
                {
                    LoadMessageDetails(messageId);
                }
                else if (e.CommandName == "ToggleRead")
                {
                    const string query = @"
                        UPDATE dbo.ContactMessages
                        SET IsRead = CASE WHEN IsRead = 1 THEN 0 ELSE 1 END
                        WHERE MessageId = @MessageId";

                    int rows = DBHelper.ExecuteQuery(query,
                        new SqlParameter("@MessageId", SqlDbType.Int)
                        { Value = messageId });

                    lblStatus.Text = rows > 0
                        ? "Message status updated."
                        : "Message not found.";

                    LoadMessages();
                }
                else if (e.CommandName == "DeleteMessage")
                {
                    const string query = @"
                        DELETE FROM dbo.ContactMessages
                        WHERE MessageId = @MessageId";

                    int rows = DBHelper.ExecuteQuery(query,
                        new SqlParameter("@MessageId", SqlDbType.Int)
                        { Value = messageId });

                    pnlMessage.Visible = false;

                    lblStatus.Text = rows > 0
                        ? "Message deleted successfully."
                        : "Message not found.";

                    LoadMessages();
                }
            }
            catch (SqlException)
            {
                lblStatus.Text =
                    "Unable to complete the action. Please try again.";
            }
        }

        private void LoadMessageDetails(int messageId)
        {
            const string query = @"
                SELECT SenderName, SenderEmail, Subject,
                       MessageText, CreatedAt
                FROM dbo.ContactMessages
                WHERE MessageId = @MessageId";

            using (SqlConnection con = DBConnection.GetConnection())
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@MessageId", SqlDbType.Int)
                    .Value = messageId;

                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        litName.Text = Convert.ToString(reader["SenderName"]);
                        litEmail.Text = Convert.ToString(reader["SenderEmail"]);
                        litSubject.Text = Convert.ToString(reader["Subject"]);
                        litMessage.Text = Convert.ToString(reader["MessageText"]);

                        litDate.Text = Convert.ToDateTime(
                            reader["CreatedAt"]).ToString("dd-MMM-yyyy hh:mm tt");

                        pnlMessage.Visible = true;
                        lblStatus.Text = "";
                    }
                    else
                    {
                        pnlMessage.Visible = false;
                        lblStatus.Text = "Message not found.";
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Admin/Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadMessages();
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadMessages();
        }

    }
}
