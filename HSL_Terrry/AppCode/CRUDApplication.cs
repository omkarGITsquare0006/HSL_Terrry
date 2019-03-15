using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Caching;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;


    public class CRUDApplication
    {
    private static object Terry;
    private CRUDApplication()
    {

    }
    public static DataTable CheckLoginCredential(string username, string password)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Login";
            cmdDistrict.Parameters.Add("@loginID", SqlDbType.NVarChar).Value = username;
            cmdDistrict.Parameters.Add("@loginPwd", SqlDbType.NVarChar).Value = password;
            SqlDataAdapter da = new SqlDataAdapter(cmdDistrict);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return null;
        }
        finally
        {
            if (connGetDistrict.State == ConnectionState.Open)
                connGetDistrict.Close();
        }
    }
}
