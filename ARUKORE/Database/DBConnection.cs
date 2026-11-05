
using System.Configuration;
using System.Data.SqlClient;

namespace ARUKORE.Database
{
    public class DBConnection
    {
        private static readonly string connectionString =
            ConfigurationManager.ConnectionStrings["ARUKORE_DB"].ConnectionString;

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }

        public static bool TestConnection()
        {
            try
            {
                using (SqlConnection con = GetConnection())
                {
                    con.Open();
                    return con.State == System.Data.ConnectionState.Open;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
