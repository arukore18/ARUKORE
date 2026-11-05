
using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace ARUKORE.Admin
{
    public partial class CreateAdmin : System.Web.UI.Page
    {
        private const int Iterations = 210000;

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (!Request.IsLocal)
            {
                lblStatus.Text = "Setup is available only locally.";
                return;
            }

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (username.Length < 3 || username.Length > 50)
            {
                lblStatus.Text = "Username must be 3–50 characters.";
                return;
            }

            if (password.Length < 12)
            {
                lblStatus.Text = "Password must contain at least 12 characters.";
                return;
            }

            try
            {
                using (SqlConnection con = ARUKORE.DbHelper.CreateConnection())
                {
                    con.Open();

                    using (SqlCommand check = new SqlCommand(
                        "SELECT COUNT(*) FROM dbo.AdminUsers", con))
                    {
                        int count = Convert.ToInt32(check.ExecuteScalar());

                        if (count > 0)
                        {
                            lblStatus.Text = "An admin account already exists.";
                            return;
                        }
                    }

                    byte[] salt = new byte[16];

                    using (RandomNumberGenerator rng =
                        RandomNumberGenerator.Create())
                    {
                        rng.GetBytes(salt);
                    }

                    byte[] hash;

                    using (var pbkdf2 = new Rfc2898DeriveBytes(
                        password, salt, Iterations, HashAlgorithmName.SHA256))
                    {
                        hash = pbkdf2.GetBytes(32);
                    }

                    const string query = @"
                        INSERT INTO dbo.AdminUsers
                        (Username, PasswordHash, PasswordSalt)
                        VALUES (@Username, @Hash, @Salt)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50)
                            .Value = username;

                        cmd.Parameters.Add("@Hash", SqlDbType.VarBinary, 64)
                            .Value = hash;

                        cmd.Parameters.Add("@Salt", SqlDbType.VarBinary, 32)
                            .Value = salt;

                        cmd.ExecuteNonQuery();
                    }
                }

                txtUsername.Text = "";
                txtPassword.Text = "";

                lblStatus.Text = "Admin account created successfully!";
            }
            catch (Exception)
            {
                lblStatus.Text = "Unable to create account. Check your database.";
            }
        }
    }
}
