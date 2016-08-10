using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace DB1
{
    public class Application : Page
    {
        public SqlCommand comm;
        public SqlConnection conn;
        public Dictionary<string, string> parameters;
        public string special = "#%%";
        public string ConnectionString
        {
            get { return ConfigurationManager.ConnectionStrings["masterConnectionString"].ConnectionString; }
        }
        public void SetStoredProcedure(string name)
        {
            parameters = new Dictionary<string, string>();
            conn = new SqlConnection(ConnectionString);
            comm = new SqlCommand();
            comm.CommandText = name;
            comm.CommandType = CommandType.StoredProcedure;
            comm.Connection = conn;
        }
        public void SetParameters(bool doesreturn = false, bool replace = false)
        {
            if (replace)
            {
                foreach (var key in parameters.Keys)
                {
                    comm.Parameters[key].Value = parameters[key];
                }
            }
            else
            {
                foreach (var key in parameters.Keys)
                {
                    SqlParameter sqlp = new SqlParameter(key, parameters[key]);
                    comm.Parameters.Add(sqlp);
                }
                if (doesreturn)
                {
                    SqlParameter returnParam = new SqlParameter();
                    returnParam.ParameterName = "returnValue";
                    returnParam.Direction = ParameterDirection.ReturnValue;
                    comm.Parameters.Add(returnParam);
                }
            }
        }

        public void SetOutputParameter(string name, string type = "string")
        {
            if (type == "string")
            {
                comm.Parameters.Add(name, SqlDbType.VarChar, 50);
            }
            else
            {
                comm.Parameters.Add(name, SqlDbType.Int);
            }
            comm.Parameters[name].Direction = ParameterDirection.Output;

        }
        public List<string> Execute(bool select = false, List<string> attributes = null)
        {
            conn.Open();
            if (select)
            {
                List<string> data = new List<string>();
                SqlDataReader rdr = comm.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    string tuple = "";
                    foreach (var attribute in attributes)
                    {
                        tuple += rdr[attribute].ToString();
                        tuple += special;
                    }
                    tuple = tuple.Substring(0, tuple.Length - 3);
                    data.Add(tuple);
                }
                conn.Close();
                return data;

            }
            else
            {
                comm.ExecuteNonQuery();
                conn.Close();
                return null;
            }
        }
        public bool Success()
        {
            return Convert.ToInt32(comm.Parameters["returnValue"].Value.ToString()) == 1;
        }
        public string getOutputValue(string name)
        {
            return comm.Parameters[name].Value.ToString();
        }

        public bool SignedIn()
        {
            return Session["Id"] != null;
        }
    }
}