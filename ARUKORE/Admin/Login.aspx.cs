
using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace ARUKORE.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        private const int Iterations = 210000;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] != null)
            {
                Response.Redirect("~/Admin/Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrEmpty(password))
            {
                lblStatus.Text = "Enter your username and password.";
                return;
            }

            try
            {
                const string query = @"
                    SELECT AdminId, Username, PasswordHash,
                           PasswordSalt, IsActive
                    FROM dbo.AdminUsers
                    WHERE Username = @Username";

                using (SqlConnection con = ARUKORE.DbHelper.CreateConnection())
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50)
                        .Value = username;

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            lblStatus.Text = "Invalid username or password.";
                            return;
                        }

                        int adminId = Convert.ToInt32(reader["AdminId"]);
                        string adminUsername =
                            Convert.ToString(reader["Username"]);

                        byte[] storedHash =
                            (byte[])reader["PasswordHash"];

                        byte[] salt =
                            (byte[])reader["PasswordSalt"];

                        bool isActive = Convert.ToBoolean(reader["IsActive"]);

                        if (!isActive)
                        {
                            lblStatus.Text = "Invalid username or password.";
                            return;
                        }

                        byte[] enteredHash;

                        using (var pbkdf2 = new Rfc2898DeriveBytes(
                            password, salt, Iterations,
                            HashAlgorithmName.SHA256))
                        {
                            enteredHash = pbkdf2.GetBytes(32);
                        }

                        if (!SecureCompare(storedHash, enteredHash))
                        {
                            lblStatus.Text =
                                "Invalid username or password.";
                            return;
                        }

                        Session.Clear();

                        Session["AdminId"] = adminId;
                        Session["AdminUsername"] = adminUsername;
                    }
                }

                Response.Redirect("~/Admin/Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (SqlException)
            {
                lblStatus.Text = "Login is temporarily unavailable.";
            }
        }

        private bool SecureCompare(byte[] a, byte[] b)
        {
            if (a == null || b == null || a.Length != b.Length)
                return false;

            int difference = 0;

            for (int i = 0; i < a.Length; i++)
            {
                difference |= a[i] ^ b[i];
            }

            return difference == 0;
        }
    }
}
