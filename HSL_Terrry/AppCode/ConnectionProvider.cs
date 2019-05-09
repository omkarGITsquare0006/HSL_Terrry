using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

    public class ConnectionProvider
    {
    private ConnectionProvider()
    {

    }
    public static SqlConnection GetConnection()
    {
        try
        {
            string strConnection = ConfigurationManager.ConnectionStrings["HSLConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConnection);
            conn.Open();
            return conn;
        }
        catch (SqlException e)
        {
            Console.WriteLine("SQL Error is: " + e);
            return null;
        }

    }
}
