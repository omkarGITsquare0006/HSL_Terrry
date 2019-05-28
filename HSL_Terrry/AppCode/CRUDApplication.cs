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

    public static DataTable InserPOfromtxt()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdUpdateBeam = new SqlCommand("SP_ImportMasterDataToPOMASTER", connGetDistrict);
            cmdUpdateBeam.CommandType = CommandType.StoredProcedure;
            cmdUpdateBeam.CommandTimeout = 250;
            SqlDataAdapter da = new SqlDataAdapter(cmdUpdateBeam);
            DataTable dtBeam = new DataTable();
            da.Fill(dtBeam);
            return dtBeam;
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

    //Closing PO No by supervisor or admin
    public static int Close_PODetailsOnPONumber(string poNumber, string remarks, String screenNameCol)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ClosePo";
            cmdDistrict.Parameters.Add("@PoNo", SqlDbType.NVarChar).Value = poNumber;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = remarks;
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.NVarChar).Value = screenNameCol;
            int exc = cmdDistrict.ExecuteNonQuery();
            //SqlDataAdapter da = new SqlDataAdapter(cmdDistrict);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            return exc;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return 0;
        }
        finally
        {
            if (connGetDistrict.State == ConnectionState.Open)
                connGetDistrict.Close();
        }
    }

    private static void Da_RowUpdated(object sender, SqlRowUpdatedEventArgs e)
    {
        throw new NotImplementedException();
    }

    public static DataTable AddNewrecord(string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal Pod_mtr, decimal Length,
       string Width, Int32 Rejected_Qty, string Reason_Rej, decimal Prod_Kg, Int32 Prod_pcs, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LSM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Insert";
            //cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            //cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = Lot_No;
            //cmdDistrict.Parameters.Add("@Lot_Qty", SqlDbType.Int).Value = Lot_Qty;
            //cmdDistrict.Parameters.Add("@Lot_Prod", SqlDbType.Int).Value = Lot_Prod;
            //cmdDistrict.Parameters.Add("@Lot_blnc", SqlDbType.Int).Value = Lot_blnc;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Pod_mtr", SqlDbType.Decimal).Value = Pod_mtr;
            cmdDistrict.Parameters.Add("@Length", SqlDbType.Decimal).Value = Length;
            cmdDistrict.Parameters.Add("@Width", SqlDbType.NVarChar).Value = Width;
            //cmdDistrict.Parameters.Add("@Pcs_Wt", SqlDbType.Decimal).Value = Pcs_Wt;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = Prod_Kg;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.Int).Value = Prod_pcs;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;


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

    public static DataTable AddNewrecordAcc(string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal prodpcs,
       Int32 Rejected_Qty, string Reason_Rej, decimal prodwt, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_ACCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Insert";
            //cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.NVarChar).Value = prodpcs;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = prodwt;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;


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

    public static DataTable Updaterecord(int ID, string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, Int32 Prod_pcs, string Trolly_no, Int32 Trolly_Qty, decimal Pod_mtr,
        Int32 Rejected_Qty, string Reason_Rej, decimal Prod_Kg, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks,string updateBy)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LSM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Update";
            cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            //cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = Lot_No;
            //cmdDistrict.Parameters.Add("@Lot_Qty", SqlDbType.Int).Value = Lot_Qty;
            // cmdDistrict.Parameters.Add("@Lot_Prod", SqlDbType.Int).Value = Lot_Prod;
            //cmdDistrict.Parameters.Add("@Lot_blnc", SqlDbType.Int).Value = Lot_blnc;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            //cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Pod_mtr", SqlDbType.Decimal).Value = Pod_mtr;
            //cmdDistrict.Parameters.Add("@Length", SqlDbType.NVarChar).Value = Length;
            //cmdDistrict.Parameters.Add("@Width", SqlDbType.NVarChar).Value = Width;
            //cmdDistrict.Parameters.Add("@Pcs_Wt", SqlDbType.Decimal).Value = Pcs_Wt;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = Prod_Kg;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.Int).Value = Prod_pcs;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;
            cmdDistrict.Parameters.Add("@RemarksSup", SqlDbType.NVarChar).Value = updateBy;
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

    public static DataTable UpdaterecordAcc(int ID, string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal prodpcs,
       Int32 Rejected_Qty, string Reason_Rej, decimal prodwt, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks, string updateBy)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_ACCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Update";
            cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.NVarChar).Value = prodpcs;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = prodwt;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;
            cmdDistrict.Parameters.Add("@RemarksSup", SqlDbType.NVarChar).Value = updateBy;

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

    public static DataTable AddNewrecordLhm(string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal Pod_mtr, decimal Length,
       string Width, Int32 Rejected_Qty, string Reason_Rej, decimal Prod_Kg, Int32 Prod_pcs, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LHM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Insert";
            //cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            //cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = Lot_No;
            //cmdDistrict.Parameters.Add("@Lot_Qty", SqlDbType.Int).Value = Lot_Qty;
            //cmdDistrict.Parameters.Add("@Lot_Prod", SqlDbType.Int).Value = Lot_Prod;
            //cmdDistrict.Parameters.Add("@Lot_blnc", SqlDbType.Int).Value = Lot_blnc;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Pod_mtr", SqlDbType.Decimal).Value = Pod_mtr;
            cmdDistrict.Parameters.Add("@Length", SqlDbType.Decimal).Value = Length;
            cmdDistrict.Parameters.Add("@Width", SqlDbType.NVarChar).Value = Width;
            //cmdDistrict.Parameters.Add("@Pcs_Wt", SqlDbType.Decimal).Value = Pcs_Wt;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = Prod_Kg;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.Int).Value = Prod_pcs;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;


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

    public static DataTable UpdaterecordLhm(int ID, string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, Int32 Prod_pcs, string Trolly_no, Int32 Trolly_Qty, decimal Pod_mtr,
        Int32 Rejected_Qty, string Reason_Rej, decimal Prod_Kg, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks,string updateBy)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LHM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Update";
            cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            //cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = Lot_No;
            //cmdDistrict.Parameters.Add("@Lot_Qty", SqlDbType.Int).Value = Lot_Qty;
            // cmdDistrict.Parameters.Add("@Lot_Prod", SqlDbType.Int).Value = Lot_Prod;
            //cmdDistrict.Parameters.Add("@Lot_blnc", SqlDbType.Int).Value = Lot_blnc;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            //cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Pod_mtr", SqlDbType.Decimal).Value = Pod_mtr;
            //cmdDistrict.Parameters.Add("@Length", SqlDbType.NVarChar).Value = Length;
            //cmdDistrict.Parameters.Add("@Width", SqlDbType.NVarChar).Value = Width;
            //cmdDistrict.Parameters.Add("@Pcs_Wt", SqlDbType.Decimal).Value = Pcs_Wt;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = Prod_Kg;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.Int).Value = Prod_pcs;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;
            cmdDistrict.Parameters.Add("@RemarksSup", SqlDbType.NVarChar).Value = updateBy;

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

    public static DataTable AddNewrecordMch(string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal prodpcs,
       Int32 Rejected_Qty, string Reason_Rej, decimal prodwt, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Insert";
            //cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.NVarChar).Value = prodpcs;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = prodwt;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;


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

    public static DataTable AddNewrecordPP(string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Noof_Pieces, Int32 Noof_PP, Int32 No_Of_Slits, decimal prodqty,
        Int32 Bal_Pcs, string Break_time, string Reason, string Remarks)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_PPM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Insert";
            //cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@No_Of_Pcs_Pack", SqlDbType.NVarChar).Value = Noof_Pieces;
            cmdDistrict.Parameters.Add("@No_Of_Poly_Pack", SqlDbType.Int).Value = Noof_PP;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.NVarChar).Value = prodqty;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;


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

    public static DataTable UpdaterecordPP(int ID, string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Noof_Pieces, Int32 Noof_PP, Int32 No_Of_Slits, decimal prodqty,
        Int32 Bal_Pcs, string Break_time, string Reason, string Remarks, string updateBy)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_PPM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Update";
            cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@No_Of_Pcs_Pack", SqlDbType.NVarChar).Value = Noof_Pieces;
            cmdDistrict.Parameters.Add("@No_Of_Poly_Pack", SqlDbType.Int).Value = Noof_PP;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.NVarChar).Value = prodqty;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;
            cmdDistrict.Parameters.Add("@RemarksSup", SqlDbType.NVarChar).Value = updateBy;

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

    public static DataTable UpdaterecordMch(int ID, string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal prodpcs,
   Int32 Rejected_Qty, string Reason_Rej, decimal prodwt, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks, string updateBy)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Update";
            cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.NVarChar).Value = prodpcs;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = prodwt;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;
            cmdDistrict.Parameters.Add("@RemarksSup", SqlDbType.NVarChar).Value = updateBy;

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

    public static DataTable AddNewrecordMcc(string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal prodpcs,
       Int32 Rejected_Qty, string Reason_Rej, decimal prodwt, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCC", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Insert";
            //cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.NVarChar).Value = prodpcs;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = prodwt;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;

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

    public static DataTable UpdaterecordMcc(int ID, string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal prodpcs,
       Int32 Rejected_Qty, string Reason_Rej, decimal prodwt, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks, string updateBy)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCC", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Update";
            cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.NVarChar).Value = prodpcs;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = prodwt;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;
            cmdDistrict.Parameters.Add("@RemarksSup", SqlDbType.NVarChar).Value = updateBy;
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

    public static DataTable AddNewrecordEmm(string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, string Trolly_no, Int32 Trolly_Qty,
        Int32 Pcs_In_Round, Int32 Prod_Rounds, Int32 Rejected_Qty, string Reason_Rej, decimal Prod_Kg, Int32 Prod_pcs, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_EMM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Insert";
            //cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@Pcs_In_Round", SqlDbType.NVarChar).Value = Pcs_In_Round;
            cmdDistrict.Parameters.Add("@Prod_Rounds", SqlDbType.Int).Value = Prod_Rounds;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = Prod_Kg;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.Int).Value = Prod_pcs;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;


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

    public static DataTable UpdaterecordEmm(int ID, string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No, Int32 Prod_pcs, string Trolly_no, Int32 Trolly_Qty,
        Int32 Pcs_In_Round, Int32 Prod_Rounds, Int32 Rejected_Qty, string Reason_Rej, decimal Prod_Kg, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks, string updateBy)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_EMM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Update";
            cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = Shift;
            cmdDistrict.Parameters.Add("@Operator", SqlDbType.NVarChar).Value = Operator;
            cmdDistrict.Parameters.Add("@Supervisor", SqlDbType.NVarChar).Value = Supervisor;
            cmdDistrict.Parameters.Add("@Machine_No", SqlDbType.NVarChar).Value = Machine_No;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@Pcs_In_Round", SqlDbType.NVarChar).Value = Pcs_In_Round;
            cmdDistrict.Parameters.Add("@Prod_Rounds", SqlDbType.Int).Value = Prod_Rounds;
            cmdDistrict.Parameters.Add("@Rejected_Qty", SqlDbType.Int).Value = Rejected_Qty;
            cmdDistrict.Parameters.Add("@Reason_Rej", SqlDbType.NVarChar).Value = Reason_Rej;
            cmdDistrict.Parameters.Add("@Prod_Kg", SqlDbType.Decimal).Value = Prod_Kg;
            cmdDistrict.Parameters.Add("@Prod_pcs", SqlDbType.Int).Value = Prod_pcs;
            cmdDistrict.Parameters.Add("@Bal_Pcs", SqlDbType.Int).Value = Bal_Pcs;
            cmdDistrict.Parameters.Add("@Break_time", SqlDbType.NVarChar).Value = Break_time;
            cmdDistrict.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = Reason;
            cmdDistrict.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Remarks;
            cmdDistrict.Parameters.Add("@RemarksSup", SqlDbType.NVarChar).Value = updateBy;

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


    public static DataTable RelesePo(string strPO_No, string lotno, Int32 lotqty, Int32 pobal)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_PO_Release", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "Insert";
            //cmdDistrict.Parameters.Add("@ID", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = strPO_No;
            //cmdDistrict.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = lotno;
            cmdDistrict.Parameters.Add("@Lot_Qty", SqlDbType.Int).Value = lotqty;
            cmdDistrict.Parameters.Add("@PO_Balnce", SqlDbType.Int).Value = pobal;


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

    public static DataTable Load_LotNumber(string PoNo)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LSM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "LotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PoNo;
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

    public static DataTable Load_LotNumberLhm(string PoNo)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LHM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "LotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PoNo;
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

    public static DataTable Load_LotNumberAcc(string PoNo)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_ACCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "LotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PoNo;
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

    public static DataTable Load_LotNumberMch(string PoNo)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "LotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PoNo;
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

    public static DataTable Load_LotNumberMcc(string PoNo)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCC", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "LotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PoNo;
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

    public static DataTable Load_LotNumberEmm(string PoNo)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_EMM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "LotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PoNo;
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
    public static DataTable Load_PONumber(String ScreenStatus)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PONumLoad";
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.Char).Value = ScreenStatus;
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

    public static DataTable Load_PONumberLhm()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PONumLoad";
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.Char).Value = "Lhm_status";
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

    public static DataTable Load_PONumberAcc()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PONumLoad";
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.Char).Value = "Acchm_status";
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

    public static DataTable Load_PONumberMch()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PONumLoad";
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.Char).Value = "Mch_status";
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

    public static DataTable Load_PONumberPP()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PONumLoad";
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.Char).Value = "Pp_status";
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

    public static DataTable Load_PONumberMcc()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PONumLoad";
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.Char).Value = "Mcc_status";
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

    public static DataTable Load_PONumberEmm()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PONumLoad";
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.Char).Value = "Em_status";
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

    public static DataTable Load_ChangeLotNumber(string PONum, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LSM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ChangeLotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PONum;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.Char).Value = LotNum;
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

    public static DataTable Load_ChangeLotNumberLhm(string PONum, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LHM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ChangeLotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PONum;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.Char).Value = LotNum;
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

    public static DataTable Load_ChangeLotNumberAcc(string PONum, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_ACCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ChangeLotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PONum;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.Char).Value = LotNum;
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

    public static DataTable Load_ChangeLotNumberMch(string PONum, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ChangeLotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PONum;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.Char).Value = LotNum;
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

    public static DataTable Load_ChangeLotNumberMcc(string PONum, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCC", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ChangeLotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PONum;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.Char).Value = LotNum;
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

    public static DataTable Load_ChangeLotNumberEmm(string PONum, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_EMM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ChangeLotNumLoad";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.Char).Value = PONum;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.Char).Value = LotNum;
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

    public static DataTable Load_PODetailsOnPONumberRelese(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PODetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.NVarChar).Value = PONumber;
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

    public static DataTable Load_PODetailsOnPONumber(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_LSM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PODetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.NVarChar).Value = PONumber;
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

    public static DataTable Load_PODetailsOnPONumberLhm(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_LHM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PODetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.NVarChar).Value = PONumber;
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

    public static DataTable Load_PODetailsOnPONumberAcc(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_ACCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PODetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.NVarChar).Value = PONumber;
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

    public static DataTable Load_PODetailsOnPONumberMch(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_MCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PODetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.NVarChar).Value = PONumber;
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

    public static DataTable Load_PODetailsOnPONumberPP(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_PPM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PODetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.NVarChar).Value = PONumber;
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

    public static DataTable Load_PODetailsOnPONumberMcc(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_MCC", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PODetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.NVarChar).Value = PONumber;
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

    public static DataTable Load_PODetailsOnPONumberEmm(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_EMM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PODetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.NVarChar).Value = PONumber;
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


    public static DataTable Load_POReleseDetailsOnPONumber(string PONumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "POReleaseDetailLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.Char).Value = PONumber;
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

    public static DataTable Load_LSMApproval(String poNumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_LSM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GETDetails";
            if (!poNumber.Equals(""))
            {
                cmdDistrict.Parameters.Add("@TempPO", SqlDbType.Char).Value = poNumber;
            }
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

    public static DataTable Load_LHMApproval(String poNumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_LHM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GETDetails";
            if (!poNumber.Equals(""))
            {
                cmdDistrict.Parameters.Add("@TempPO", SqlDbType.Char).Value = poNumber;
            }
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

    public static DataTable Load_ACCApproval(String poNumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_ACCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GETDetails";
            if (!poNumber.Equals(""))
            {
                cmdDistrict.Parameters.Add("@TempPO", SqlDbType.Char).Value = poNumber;
            }
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

    public static DataTable Load_EMMApproval(String poNumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_EMM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GETDetails";
            if (!poNumber.Equals(""))
            {
                cmdDistrict.Parameters.Add("@TempPO", SqlDbType.Char).Value = poNumber;
            }
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

    public static DataTable Load_MCCApproval(String poNumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_MCC", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GETDetails";
            if (!poNumber.Equals(""))
            {
                cmdDistrict.Parameters.Add("@TempPO", SqlDbType.Char).Value = poNumber;
            }
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

    public static DataTable Load_PPMApproval(String poNumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_PPM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GETDetails";
            if (!poNumber.Equals(""))
            {
                cmdDistrict.Parameters.Add("@TempPO", SqlDbType.Char).Value = poNumber;
            }
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

    public static DataTable Load_MCHApproval(String poNumber)
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_MCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GETDetails";
            if (!poNumber.Equals(""))
            {
                cmdDistrict.Parameters.Add("@TempPO", SqlDbType.Char).Value = poNumber;
            }
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

    public static DataTable GetOperatorByID(string strID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("SP_DT_Tbl_LSM", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SelectBySupID";
            cmdSup.Parameters.Add("@ID", SqlDbType.NChar).Value = strID;

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

    public static DataTable GetOperatorByIDLhm(string strID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("SP_DT_Tbl_LHM", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SelectBySupID";
            cmdSup.Parameters.Add("@ID", SqlDbType.NChar).Value = strID;

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

    public static DataTable GetOperatorByIDAcc(string strID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("SP_DT_Tbl_ACCH", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SelectBySupID";
            cmdSup.Parameters.Add("@ID", SqlDbType.NChar).Value = strID;

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

    public static DataTable GetOperatorByIDMch(string strID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("SP_DT_Tbl_MCH", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SelectBySupID";
            cmdSup.Parameters.Add("@ID", SqlDbType.NChar).Value = strID;

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

    public static DataTable GetOperatorByIDPP(string strID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("SP_DT_Tbl_PPM", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SelectBySupID";
            cmdSup.Parameters.Add("@ID", SqlDbType.NChar).Value = strID;

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

    public static DataTable GetOperatorByIDMcc(string strID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("SP_DT_Tbl_MCC", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SelectBySupID";
            cmdSup.Parameters.Add("@ID", SqlDbType.NChar).Value = strID;

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

    public static DataTable GetOperatorByIDEmm(string strID)
    {

        SqlConnection connGetSup = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdSup = new SqlCommand("SP_DT_Tbl_EMM", connGetSup);
            cmdSup.CommandType = CommandType.StoredProcedure;
            cmdSup.CommandTimeout = 250;
            cmdSup.Parameters.Add("@Flag", SqlDbType.Char).Value = "SelectBySupID";
            cmdSup.Parameters.Add("@ID", SqlDbType.NChar).Value = strID;

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
    public static int Close_LotNumber(string PoNo, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LSM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "CloseLot";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = PoNo;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = LotNum;
            int exc = cmdDistrict.ExecuteNonQuery();
            //SqlDataAdapter da = new SqlDataAdapter(cmdDistrict);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            return exc;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return 0;
        }
        finally
        {
            if (connGetDistrict.State == ConnectionState.Open)
                connGetDistrict.Close();
        }
    }
    public static int Close_LotNumberLhm(string PoNo, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_LHM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "CloseLot";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = PoNo;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = LotNum;
            int exc = cmdDistrict.ExecuteNonQuery();
            //SqlDataAdapter da = new SqlDataAdapter(cmdDistrict);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            return exc;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return 0;
        }
        finally
        {
            if (connGetDistrict.State == ConnectionState.Open)
                connGetDistrict.Close();
        }
    }
    public static int Close_LotNumberAcc(string PoNo, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_ACCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "CloseLot";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = PoNo;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = LotNum;
            int exc = cmdDistrict.ExecuteNonQuery();
            //SqlDataAdapter da = new SqlDataAdapter(cmdDistrict);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            return exc;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return 0;
        }
        finally
        {
            if (connGetDistrict.State == ConnectionState.Open)
                connGetDistrict.Close();
        }
    }
    public static int Close_LotNumberEmm(string PoNo, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_EMM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "CloseLot";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = PoNo;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = LotNum;
            int exc = cmdDistrict.ExecuteNonQuery();
            //SqlDataAdapter da = new SqlDataAdapter(cmdDistrict);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            return exc;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return 0;
        }
        finally
        {
            if (connGetDistrict.State == ConnectionState.Open)
                connGetDistrict.Close();
        }
    }
    public static int Close_LotNumberMcc(string PoNo, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCC", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "CloseLot";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = PoNo;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = LotNum;
            int exc = cmdDistrict.ExecuteNonQuery();
            //SqlDataAdapter da = new SqlDataAdapter(cmdDistrict);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            return exc;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return 0;
        }
        finally
        {
            if (connGetDistrict.State == ConnectionState.Open)
                connGetDistrict.Close();
        }
    }
    public static int Close_LotNumberMch(string PoNo, string LotNum)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_Tbl_MCH", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "CloseLot";
            cmdDistrict.Parameters.Add("@PO_No", SqlDbType.NVarChar).Value = PoNo;
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = LotNum;
            int exc = cmdDistrict.ExecuteNonQuery();
            //SqlDataAdapter da = new SqlDataAdapter(cmdDistrict);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            return exc;
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex.Message, "");
            return 0;
        }
        finally
        {
            if (connGetDistrict.State == ConnectionState.Open)
                connGetDistrict.Close();
        }
    }
}



