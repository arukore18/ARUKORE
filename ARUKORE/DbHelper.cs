using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ARUKORE
{
    /// <summary>
    /// One place for database access, so pages do not repeat connection code.
    /// </summary>
    public static class DbHelper
    {
        private const string ConnectionName = "ARUKORE_DB";

        /// <summary>
        /// Creates (but does not open) a connection using the Web.config connection string.
        /// Throws a clear error if the connection string is missing.
        /// </summary>
        public static SqlConnection CreateConnection()
        {
            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings[ConnectionName];

            if (settings == null || string.IsNullOrWhiteSpace(settings.ConnectionString))
            {
                throw new ConfigurationErrorsException(
                    "Connection string '" + ConnectionName + "' is missing in Web.config.");
            }

            return new SqlConnection(settings.ConnectionString);
        }

        /// <summary>
        /// Runs a SELECT query that needs no parameters and returns the rows as a DataTable.
        /// </summary>
        public static DataTable GetTable(string query)
        {
            using (SqlConnection con = CreateConnection())
            using (SqlCommand cmd = new SqlCommand(query, con))
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
    }
}
