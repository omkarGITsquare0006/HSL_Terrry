using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmPOManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LoadPODetails_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DataTable dtPODetails = CRUDApplication.Load_POReleseDetailsOnPONumber(txtPO_No.Text.Trim());
                if (dtPODetails.Rows.Count > 0)
                {
                    txtlotno.Text = Convert.ToString(dtPODetails.Rows[0]["Lot_No"]);
                    txtlotqty.Text = Convert.ToString(dtPODetails.Rows[0]["Lot_Qty"]);
                    txtstatus.Text = Convert.ToString(dtPODetails.Rows[0]["status"]);
                    //1.1 changes starts -->
                    //chkMachines.SelectedIndex = -1;
                    //txtSetlenght.Text = "";
                    //txtNoCreel.Text = "";
                    //txtNoBPC.Text = "";
                    //txtNoEPB.Text = "";
                    //txtSelvCount.Text = "";
                    //txtSelvEnds.Text = "";
                    //txtYarnCode.Text = "";
                    //txtYarnDesc.Text = "";
                    //ddlSetNo.SelectedIndex = -1;
                    //Load_SetNo(ddlPONumber.SelectedValue.Trim());
                    //EnableDisableFields(0);
                    //1.1 chnages Ends<--

                }
                else
                {
                    MsgBox1.MessageBox.Show("No Record Found or Something is going wrong...!");
                    return;
                }

            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
                return;
            }
        }
        protected void btn_Release(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = CRUDApplication.RelesePo(txtPO_No.Text,
                    txtlotno.Text, Convert.ToInt32(txtlotqty.Text), Convert.ToInt32(txtpobal.Text), Convert.ToInt32(txtlotprod.Text),
                    Convert.ToInt32(txtlotbal.Text), txtoperation.Text);
                if (dt.Rows.Count > 0)
                {
                    //divMsg.Visible = true;
                    //LblMsg.Text = " User - " + txtSupID.Text.Trim() + " added successfully!";
                    MsgBox1.MessageBox.Show("PO#" + txtPO_No.Text.Trim() + "Relesed successfully ");
                    txtPO_No.Text = "";
                    txtlotno.Text = "";
                    txtlotqty.Text = "";
                    txtpobal.Text = "";
                    txtlotprod.Text = "";
                    txtlotbal.Text = "";
                    txtoperation.Text = "";

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