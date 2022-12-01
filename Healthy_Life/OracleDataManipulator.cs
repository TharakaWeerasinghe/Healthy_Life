using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;
using System.Data;

namespace Healthy_Life
{
    public class OracleDataManipulator
    {
        //method to return connection string
        public string constring()
        {
            return @"Data Source=(DESCRIPTION =" + "(ADDRESS = (PROTOCOL = TCP)(HOST = MSI)(PORT = 1521))" + "(CONNECT_DATA =" + "(SERVER = DEDICATED)" + "(SERVICE_NAME = XE)));" + " User Id= admin;Password=admin;";
        }

        //method to modify data in the database
        public void modifyData(string query)
        {
            OracleConnection con = new OracleConnection(constring());
            con.Open();
            OracleCommand cmd = new OracleCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //method to retrieve data and dispaly it
        public DataTable dispalyData(string query)
        {
            OracleConnection con = new OracleConnection(constring());
            con.Open();
            OracleCommand cmd = new OracleCommand(query, con);
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            return dt;



        }
    }
}