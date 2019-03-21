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
            //LoadPODetails_OnSelectedIndexChanged(txtPO_No);
        }

        //protected void LoadPODetails_OnSelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        DataTable dtPODetails = CRUDApplication.Load_PODetailsOnPONumber(ddlPONumber.SelectedValue.Trim());
        //        if (dtPODetails.Rows.Count > 0)
        //        {
        //            txtPoQty.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Quantity"]);
        //            txtStyleNo.Text = Convert.ToString(dtPODetails.Rows[0]["Style_No"]);
        //            txtTotalEnds.Text = Convert.ToString(dtPODetails.Rows[0]["Total_NoOfEnds"]);
        //            txtCount.Text = Convert.ToString(dtPODetails.Rows[0]["Count"]);
        //            txtYarnSupplier.Text = Convert.ToString(dtPODetails.Rows[0]["Yarn_Suppler"]);
        //            txtLotNo.Text = Convert.ToString(dtPODetails.Rows[0]["Yarn_lot_Num"]);
        //            txtConeColor.Text = Convert.ToString(dtPODetails.Rows[0]["Cone_Tip_Color"]);
        //            txtConeWeight.Text = Convert.ToString(dtPODetails.Rows[0]["Cone_NetWt"]);
        //            txtSetlenght.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Quantity"]);
        //            1.1 changes starts -->
        //            chkMachines.SelectedIndex = -1;
        //            txtSetlenght.Text = "";
        //            txtNoCreel.Text = "";
        //            txtNoBPC.Text = "";
        //            txtNoEPB.Text = "";
        //            txtSelvCount.Text = "";
        //            txtSelvEnds.Text = "";
        //            txtYarnCode.Text = "";
        //            txtYarnDesc.Text = "";
        //            ddlSetNo.SelectedIndex = -1;
        //            Load_SetNo(ddlPONumber.SelectedValue.Trim());
        //            EnableDisableFields(0);
        //            1.1 chnages Ends<--

        //        }
        //        else
        //        {
        //            MsgBox1.MessageBox.Show("No Record Found or Something is going wrong...!");
        //            return;
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
        //        return;
        //    }
        //}

        protected void Btn_submit(object sender, EventArgs e)
    {
        try
        {
                DataTable dt = CRUDApplication.AddNewrecord(txtPO_No.Text, Convert.ToDateTime(DateTime.Today.ToString("yyyy-MM-dd HH:mm:ss")), txtshift.Text.Trim(), txtoperator.Text.Trim(), 
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