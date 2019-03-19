using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmLengthSlittingMachine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    

    protected void Btn_submit(object sender, EventArgs e)
    {
        try
        {
                DataTable dt = CRUDApplication.AddNewrecord(txtPO_No.Text, Convert.ToDateTime(txtdate.Text.Trim()), txtshift.Text.Trim(), txtoperator.Text.Trim(), 
                    txtsupervisor.Text.Trim(), txtmachineno.Text.Trim(), TextLotNo.Text.Trim(), Convert.ToInt32(TextLotQty.Text.Trim()), Convert.ToInt32(TextLotProd.Text.Trim()), Convert.ToInt32(TextLotBal.Text.Trim()),  
                    txttrollyno.Text.Trim(), Convert.ToInt32(txttrollyqty.Text.Trim()), Convert.ToInt32(txtnoofslits.Text.Trim()), Convert.ToDecimal(Textprodmtr.Text.Trim()),  txtpcslength2.Text.Trim(), txtpcswidth2.Text.Trim(),
                    Convert.ToDecimal(Textpcswt.Text.Trim()),  Convert.ToInt32(TextrejQty.Text.Trim()), Textrejreason.Text.Trim(), Convert.ToDecimal(txtprodwt.Text.Trim()), Convert.ToInt32(txtprodpcs.Text.Trim()), 
                    Convert.ToInt32(txtbalqty2.Text.Trim()), txtmachinestop.Text.Trim(), txtstopreason.Text.Trim(), txtremarks.Text.Trim()); 
                if (dt.Rows.Count > 0)
                {
                    //divMsg.Visible = true;
                    //LblMsg.Text = " User - " + txtSupID.Text.Trim() + " added successfully!";
                    MsgBox1.MessageBox.Show("Record"  + txtPO_No.Text.Trim()  +  "Created successfully ");
                    txtPO_No.Text = "";
                    txtmachineno.Text = "";
                    txtoperator.Text = "";
                    txtsupervisor.Text = "";
                    txtdate.Text = "";
                    txtshift.Text = "";
                    txttrollyno.Text = "";
                    txttrollyqty.Text = "";
                    txtbalqty2.Text = "";
                    TextLotNo.Text = "";
                    TextLotQty.Text = "";
                    TextLotProd.Text = "";
                    TextLotBal.Text = "";
                    txtnoofslits.Text = "";
                    Textprodmtr.Text = "";
                    txtpcslength2.Text = "";
                    txtpcswidth2.Text = "";
                    Textpcswt.Text = "";
                    TextrejQty.Text = "";
                    Textrejreason.Text = "";
                    txtprodwt.Text = "";
                    txtprodpcs.Text = "";
                    txtmachinestop.Text = "";
                    txtremarks.Text = "";

                }
            }
     
        catch (Exception ex)
        {
            MsgBox1.MessageBox.Show("Error while Adding Supervisor!!!");
            return;
            //lblErrMessage.Text = "User already exists. Please add different user.!!!";
        }
    }
    }
}