using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


   public class ClsSupervisorMasters
    {
    private ClsSupervisorMasters()
    {

    }
    // Function to get All Supervisors
    public static DataTable GetAllSupervisors()
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("sp_Supervisor_Master", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SupListALL";

            SqlDataAdapter da = new SqlDataAdapter(cmdSup);
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
            if (connGetSup.State == ConnectionState.Open)
                connGetSup.Close();
        }
    }

    // Function to get Supervisor by Supervisor ID
    public static DataTable GetSupervisorByID(string strSupID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("sp_Supervisor_Master", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SelectBySupID";
            cmdSup.Parameters.Add("@Sup_Id", SqlDbType.NChar).Value = strSupID;

            SqlDataAdapter da = new SqlDataAdapter(cmdSup);
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
            if (connGetSup.State == ConnectionState.Open)
                connGetSup.Close();
        }
    }

    // Function to add new Supervisor
    public static DataTable AddNewSupervisor(string strSupID, string strSupName, string strPassword, string strDeptId, string strEmailId, Int16 intActive, string intAdmin)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("sp_Supervisor_Master", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "InsertNewSup";
            cmdSup.Parameters.Add("@Sup_Id", SqlDbType.NChar).Value = strSupID;
            cmdSup.Parameters.Add("@Sup_Name", SqlDbType.NVarChar).Value = strSupName;
            cmdSup.Parameters.Add("@Password", SqlDbType.NVarChar).Value = strPassword;
            cmdSup.Parameters.Add("@Dept_Id", SqlDbType.NChar).Value = strDeptId;
            cmdSup.Parameters.Add("@EmailID", SqlDbType.VarChar).Value = strEmailId;
            cmdSup.Parameters.Add("@Active", SqlDbType.Bit).Value = intActive;
            cmdSup.Parameters.Add("@RoleId", SqlDbType.NChar).Value = intAdmin;

            SqlDataAdapter da = new SqlDataAdapter(cmdSup);
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
            if (connGetSup.State == ConnectionState.Open)
                connGetSup.Close();
        }
    }

    // Function to Update Supervisor By ID
    public static DataTable UpdateSupervisor(string strSupID, string strSupName, string strPassword, string strDeptId, string strEmailId, Int16 intActive, string intRole)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("sp_Supervisor_Master", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "UpdateBySupID";
            cmdSup.Parameters.Add("@Sup_Id", SqlDbType.NChar).Value = strSupID;
            cmdSup.Parameters.Add("@Sup_Name", SqlDbType.NVarChar).Value = strSupName;
            cmdSup.Parameters.Add("@Password", SqlDbType.NVarChar).Value = strPassword;
            cmdSup.Parameters.Add("@Dept_Id", SqlDbType.NChar).Value = strDeptId;
            cmdSup.Parameters.Add("@EmailID", SqlDbType.VarChar).Value = strEmailId;
            cmdSup.Parameters.Add("@Active", SqlDbType.Bit).Value = intActive;
            cmdSup.Parameters.Add("@RoleId", SqlDbType.NChar).Value = intRole;

            SqlDataAdapter da = new SqlDataAdapter(cmdSup);
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
            if (connGetSup.State == ConnectionState.Open)
                connGetSup.Close();
        }
    }

    // Function to Delete Supervisor by Supervisor ID
    public static DataTable DeleteSupervisorByID(string strSupID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("sp_Supervisor_Master", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "DeleteBySupID";
            cmdSup.Parameters.Add("@Sup_Id", SqlDbType.NChar).Value = strSupID;

            SqlDataAdapter da = new SqlDataAdapter(cmdSup);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        catch (SqlException ex)
        {
            MsgBox1.MessageBox.Show("Cannot delete the this Supervisor");
            ErrorHandler.WriteError(ex.Message, "");
            return null;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return null;
        }
        finally
        {
            if (connGetSup.State == ConnectionState.Open)
                connGetSup.Close();
        }
    }

    // Function to get All Departments
    public static DataTable GetDepartments()
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("sp_Supervisor_Master", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "GetDept";

            SqlDataAdapter da = new SqlDataAdapter(cmdSup);
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
            if (connGetSup.State == ConnectionState.Open)
                connGetSup.Close();
        }
    }
}
