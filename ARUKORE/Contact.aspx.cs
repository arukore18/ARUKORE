
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using ARUKORE.Services;

namespace ARUKORE
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void btnSend_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            try
            {
                MailAddress parsedEmail =
                    new MailAddress(txtEmail.Text.Trim());

                const string query = @"INSERT INTO dbo.ContactMessages
                    (SenderName, SenderEmail, Subject, MessageText)
                    VALUES (@Name, @Email, @Subject, @Message)";

                string senderName = txtName.Text.Trim();
                string senderEmail = parsedEmail.Address;
                string subject = txtSubject.Text.Trim();
                string messageText = txtMessage.Text.Trim();

                // STEP 1: Save message in SQL Server
                using (SqlConnection con = DbHelper.CreateConnection())
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value =
                        senderName;

                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value =
                        senderEmail;

                    cmd.Parameters.Add("@Subject", SqlDbType.NVarChar, 150).Value =
                        string.IsNullOrWhiteSpace(subject)
                        ? (object)DBNull.Value
                        : subject;

                    cmd.Parameters.Add("@Message", SqlDbType.NVarChar, 2000).Value =
                        messageText;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // STEP 2: Send email notification
                bool emailSent = true;

                try
                {
                    EmailService.SendContactNotification(
                        senderName,
                        senderEmail,
                        subject,
                        messageText
                    );
                }
                catch (Exception)
                {
                    // Message is already saved.
                    // Email failure must not lose the contact message.
                    emailSent = false;
                }

                // STEP 3: Show result to visitor
                if (emailSent)
                {
                    lblStatus.Text =
                        "Thanks! Your message has been received.";

                    lblStatus.CssClass = "success-message";
                }
                else
                {
                    lblStatus.Text =
                        "Your message was received successfully. Email notification is temporarily unavailable.";

                    lblStatus.CssClass = "success-message";
                }

                // STEP 4: Clear form
                txtName.Text = "";
                txtEmail.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
            }
            catch (FormatException)
            {
                lblStatus.Text =
                    "Please enter a valid email address.";

                lblStatus.CssClass = "validation";
            }
            catch (SqlException)
            {
                ShowSaveError();
            }
            catch (ConfigurationErrorsException)
            {
                ShowSaveError();
            }
        }

        private void ShowSaveError()
        {
            lblStatus.Text =
                "Sorry, we could not save your message right now. Please try again later.";

            lblStatus.CssClass = "validation";
        }
    }
}
