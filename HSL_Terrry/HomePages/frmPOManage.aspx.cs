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


        protected void btn_Release(object sender, EventArgs e)
        {
            try
            {
                int PoBalance = Convert.ToInt32(txtpobal.Text) - Convert.ToInt32(txtlotqty.Text);
                DataTable dt = CRUDApplication.RelesePo(txtPO_No.Text, txtlotno.Text, Convert.ToInt32(txtlotqty.Text), Convert.ToInt32(PoBalance));
                if (dt.Rows.Count > 0)
                {
                    //divmsg.visible = true;
                    //lblmsg.text = " user - " + txtsupid.text.trim() + " added successfully!";
                    MsgBox1.MessageBox.Show("Po#" + txtPO_No.Text.Trim() + "relesed successfully ");
                    txtPO_No.Text = "";
                    txtlotno.Text = "";
                    txtlotqty.Text = "";
                    txtpobal.Text = "";
                }
            }

            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("error while Releasing PO!!!");
                return;
                //lblerrmessage.text = "user already exists. please add different user.!!!";
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {

                int dtPODetails = CRUDApplication.Close_PODetailsOnPONumber(txtPO_No.Text,"","");
                if (dtPODetails > 0)
                {
                    MsgBox1.MessageBox.Show("Po#" + txtPO_No.Text.Trim() + "closed successfully ");
                    txtPO_No.Text = "";
                    txtlotno.Text = "";
                    txtlotqty.Text = "";
                    txtpobal.Text = "";

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

        protected void btnPoSearch_Click(object sender, EventArgs e)
        {
            try
            {

                DataTable dtPODetails = CRUDApplication.Load_PODetailsOnPONumberRelese(txtPO_No.Text);
                if (dtPODetails.Rows.Count > 0)
                {
                    txtpoodesc.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Desc"]);
                    txtcustno.Text = Convert.ToString(dtPODetails.Rows[0]["Cust_No"]);
                    txtorderkg.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Kg"]);
                    txtorderqty.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Oty"]);
                    txtprodcode.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_No"]);
                    txtproddesc.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_Desc"]);
                    txtpcswt.Text = Convert.ToString(dtPODetails.Rows[0]["Pcs_Wt"]);
                    txtsono.Text = Convert.ToString(dtPODetails.Rows[0]["SO_No"]);
                    txtcolor.Text = Convert.ToString(dtPODetails.Rows[0]["Color"]);
                    txtcolordesc.Text = Convert.ToString(dtPODetails.Rows[0]["Color_Desc"]);
                    txtsize.Text = Convert.ToString(dtPODetails.Rows[0]["Size"]);
                    txtszdesc.Text = Convert.ToString(dtPODetails.Rows[0]["Size_Desc"]);
                    txtoperation.Text = Convert.ToString(dtPODetails.Rows[0]["Program"]);
                    txtopdesc.Text = Convert.ToString(dtPODetails.Rows[0]["Program_Desc"]);
                    txtgsm.Text = Convert.ToString(dtPODetails.Rows[0]["GSM"]);
                    txtpobal.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Balance"]);
                    //txtUdf2.Text = Convert.ToString(dtPODetails.Rows[0]["Udf_2"]);
                    //txtUdf3.Text = Convert.ToString(dtPODetails.Rows[0]["Udf_3"]);
                    //txtstatus.Text = Convert.ToString(dtPODetails.Rows[0]["status"]);

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
    }
}