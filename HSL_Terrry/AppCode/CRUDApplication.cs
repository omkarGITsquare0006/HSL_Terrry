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
    public static int Close_PODetailsOnPONumber(string poNumber)
    {
        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ClosePo";
            cmdDistrict.Parameters.Add("@PoNo", SqlDbType.NVarChar).Value = poNumber;
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

    public static DataTable AddNewrecord(string strPO_No, DateTime Date, string Shift, string Operator, string Supervisor, string Machine_No,
       string Lot_No, Int32 Lot_Qty, Int32 Lot_Prod, Int32 Lot_blnc, string Trolly_no, Int32 Trolly_Qty, Int32 No_Of_Slits, decimal Pod_mtr, string Length,
       string Width, decimal Pcs_Wt, Int32 Rejected_Qty, string Reason_Rej, decimal Prod_Kg, Int32 Prod_pcs, Int32 Bal_Pcs, string Break_time, string Reason, string Remarks)
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
            cmdDistrict.Parameters.Add("@Lot_No", SqlDbType.NVarChar).Value = Lot_No;
            cmdDistrict.Parameters.Add("@Lot_Qty", SqlDbType.Int).Value = Lot_Qty;
            cmdDistrict.Parameters.Add("@Lot_Prod", SqlDbType.Int).Value = Lot_Prod;
            cmdDistrict.Parameters.Add("@Lot_blnc", SqlDbType.Int).Value = Lot_blnc;
            cmdDistrict.Parameters.Add("@Trolly_no", SqlDbType.NVarChar).Value = Trolly_no;
            cmdDistrict.Parameters.Add("@Trolly_Qty", SqlDbType.Int).Value = Trolly_Qty;
            cmdDistrict.Parameters.Add("@No_Of_Slits", SqlDbType.Int).Value = No_Of_Slits;
            cmdDistrict.Parameters.Add("@Pod_mtr", SqlDbType.Decimal).Value = Pod_mtr;
            cmdDistrict.Parameters.Add("@Length", SqlDbType.NVarChar).Value = Length;
            cmdDistrict.Parameters.Add("@Width", SqlDbType.NVarChar).Value = Width;
            cmdDistrict.Parameters.Add("@Pcs_Wt", SqlDbType.Decimal).Value = Pcs_Wt;
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
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "LotNumLoad";
            cmdDistrict.Parameters.Add("@PONo", SqlDbType.Char).Value = PoNo;
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

    public static DataTable Load_PONumber()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "PONumLoad";
            cmdDistrict.Parameters.Add("@ColumName1", SqlDbType.Char).Value = "Lsm_status";
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
            SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "ChangeLotNumLoad";
            cmdDistrict.Parameters.Add("@PoNo", SqlDbType.Char).Value = PONum;
            cmdDistrict.Parameters.Add("@LotNo", SqlDbType.Char).Value = LotNum;
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

    public static DataTable Load_LSMApproval()
    {

        SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
        try
        {
            SqlCommand cmdDistrict = new SqlCommand("SP_DT_Tbl_LSM", connGetDistrict);
            cmdDistrict.CommandType = CommandType.StoredProcedure;
            cmdDistrict.CommandTimeout = 250;
            cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GETDetails";
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
