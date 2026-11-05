
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace ARUKORE.Services
{
    public class EmailService
    {
        public static void SendContactNotification(
            string senderName,
            string senderEmail,
            string subject,
            string messageText)
        {
            string email = ConfigurationManager.AppSettings["SmtpEmail"];
            string password = ConfigurationManager.AppSettings["SmtpPassword"];
            string receiver = ConfigurationManager.AppSettings["ReceiverEmail"];

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(email, "ARU KORE Website");
                mail.To.Add(receiver);

                // Reply directly to the visitor
                mail.ReplyToList.Add(new MailAddress(senderEmail));

                mail.Subject = "New Portfolio Message: " + subject;

                mail.Body =
                    "New message received from your ARU KORE website.\r\n\r\n" +
                    "Name: " + senderName + "\r\n" +
                    "Email: " + senderEmail + "\r\n" +
                    "Subject: " + subject + "\r\n\r\n" +
                    "Message:\r\n" + messageText;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new NetworkCredential(email, password);
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
        }
    }
}
