
using System.Data;
using System.Data.SqlClient;

namespace ARUKORE.Database
{
    public class DBHelper
    {
        // Fetch records from database
        public static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = DBConnection.GetConnection())
            {
                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    da.Fill(dt);
                }
            }

            return dt;
        }

        // Insert, Update or Delete records
        public static int ExecuteQuery(
            string query,
            params SqlParameter[] parameters)
        {
            using (SqlConnection con = DBConnection.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    con.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
