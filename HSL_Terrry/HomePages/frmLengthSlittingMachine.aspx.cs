using HSL_Terrry.AppCode;
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
            if (!Page.IsPostBack)
            {
                Load_PONumber();
            }
        }

        protected void Load_PONumber()
        {
            try
            {
                txtPO_No.DataSource = CRUDApplication.Load_PONumber();
                txtPO_No.DataTextField = "PO_No";
                txtPO_No.DataValueField = "PO_No";
                txtPO_No.DataBind();
                ListItem itm2 = new ListItem();
                itm2.Text = "--------Select PO Number--------";
                itm2.Value = "-1";
                itm2.Selected = true;
                txtPO_No.Items.Insert(0, itm2);
                txtPO_No.SelectedIndex = 0;

            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
                return;
            }
        }

        protected void LoadPODetails_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DataTable dtPODetails = CRUDApplication.Load_PODetailsOnPONumber(txtPO_No.SelectedValue.Trim());
                if (dtPODetails.Rows.Count > 0)
                {
                    txtdate.Text = DateTimeClass.CurrentDateTime();
                    txtpoodesc.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Desc"]);
                    txtcustno.Text = Convert.ToString(dtPODetails.Rows[0]["Cust_No"]);
                    txtorderkg.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Kg"]);
                    txtorderqty.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Oty"]);
                    txtitemno.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_No"]);
                    txtitemdesc.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_Desc"]);
                    txtpcswt.Text = Convert.ToString(dtPODetails.Rows[0]["Pcs_Wt"]);
                    txtsono.Text = Convert.ToString(dtPODetails.Rows[0]["SO_No"]);
                    txtshade.Text = Convert.ToString(dtPODetails.Rows[0]["Color"]);
                    txtcolordesc.Text = Convert.ToString(dtPODetails.Rows[0]["Color_Desc"]);
                    txtsize.Text = Convert.ToString(dtPODetails.Rows[0]["Size"]);
                    txtszdesc.Text = Convert.ToString(dtPODetails.Rows[0]["Size_Desc"]);
                    txtorderuom.Text = Convert.ToString(dtPODetails.Rows[0]["Program_Desc"]);
                    txtoperation.Text = Convert.ToString(dtPODetails.Rows[0]["Program"]);
                    txtgsm.Text = Convert.ToString(dtPODetails.Rows[0]["GSM"]);
                    //txtprocessedqty.Text = Convert.ToString(dtPODetails.Rows[0]["Processed_Qty"]);
                    txtbalqty.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Balance"]);
                    txtUdf1.Text = Convert.ToString(dtPODetails.Rows[0]["Udf_1"]);
                    txtUdf2.Text = Convert.ToString(dtPODetails.Rows[0]["Udf_2"]);
                    txtUdf3.Text = Convert.ToString(dtPODetails.Rows[0]["Udf_3"]);
                    txtstatus.Text = Convert.ToString(dtPODetails.Rows[0]["status"]);
                    ddLotNo.DataSource = CRUDApplication.Load_LotNumber(txtPO_No.SelectedValue);
                    ddLotNo.DataTextField = "Lot_No";
                    ddLotNo.DataValueField = "Lot_No";
                    ddLotNo.DataBind();
                    ddLotNo.SelectedIndex = 0;
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

        protected void ddLotNo_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DataTable dtPODetails = CRUDApplication.Load_ChangeLotNumber(txtPO_No.SelectedValue.Trim(),ddLotNo.SelectedValue.Trim());
                if (dtPODetails.Rows.Count > 0)
                {
                    txtdate.Text = DateTimeClass.CurrentDateTime();
                    txtpoodesc.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Desc"]);
                    txtcustno.Text = Convert.ToString(dtPODetails.Rows[0]["Cust_No"]);
                    txtorderkg.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Kg"]);
                    txtorderqty.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Oty"]);
                    txtitemno.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_No"]);
                    txtitemdesc.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_Desc"]);
                    txtpcswt.Text = Convert.ToString(dtPODetails.Rows[0]["Pcs_Wt"]);
                    txtsono.Text = Convert.ToString(dtPODetails.Rows[0]["SO_No"]);
                    txtshade.Text = Convert.ToString(dtPODetails.Rows[0]["Color"]);
                    txtcolordesc.Text = Convert.ToString(dtPODetails.Rows[0]["Color_Desc"]);
                    txtsize.Text = Convert.ToString(dtPODetails.Rows[0]["Size"]);
                    txtszdesc.Text = Convert.ToString(dtPODetails.Rows[0]["Size_Desc"]);
                    txtorderuom.Text = Convert.ToString(dtPODetails.Rows[0]["Program_Desc"]);
                    txtoperation.Text = Convert.ToString(dtPODetails.Rows[0]["Program"]);
                    txtgsm.Text = Convert.ToString(dtPODetails.Rows[0]["GSM"]);
                    //txtprocessedqty.Text = Convert.ToString(dtPODetails.Rows[0]["Processed_Qty"]);
                    txtbalqty.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Balance"]);
                    txtUdf1.Text = Convert.ToString(dtPODetails.Rows[0]["Udf_1"]);
                    txtUdf2.Text = Convert.ToString(dtPODetails.Rows[0]["Udf_2"]);
                    txtUdf3.Text = Convert.ToString(dtPODetails.Rows[0]["Udf_3"]);
                    txtstatus.Text = Convert.ToString(dtPODetails.Rows[0]["status"]);
                    ddLotNo.DataSource = CRUDApplication.Load_LotNumber(txtPO_No.SelectedValue);
                    ddLotNo.DataTextField = "Lot_No";
                    ddLotNo.DataValueField = "Lot_No";
                    ddLotNo.DataBind();
                    ddLotNo.SelectedIndex = 0;
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
        

        protected void Btn_submit(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = CRUDApplication.AddNewrecord(txtPO_No.SelectedValue.Trim(), Convert.ToDateTime(DateTime.Today.ToString("yyyy-MM-dd HH:mm:ss")), ddShift.SelectedValue, txtoperator.Text.Trim(),
                    txtsupervisor.Text.Trim(), ddMachineNo.SelectedValue, ddLotNo.SelectedValue.ToString(), Convert.ToInt32(TextLotQty.Text.Trim()), Convert.ToInt32(TextLotProd.Text.Trim()), Convert.ToInt32(TextLotBal.Text.Trim()),
                    txttrollyno.Text.Trim(), Convert.ToInt32(txttrollyqty.Text.Trim()), Convert.ToInt32(txtnoofslits.Text.Trim()), Convert.ToDecimal(Textprodmtr.Text.Trim()), txtpcslength2.Text.Trim(), txtpcswidth2.Text.Trim(),
                    Convert.ToDecimal(Textpcswt.Text.Trim()), Convert.ToInt32(TextrejQty.Text.Trim()), Textrejreason.Text.Trim(), Convert.ToDecimal(txtprodwt.Text.Trim()), Convert.ToInt32(txtprodpcs.Text.Trim()),
                    Convert.ToInt32(txtbalqty2.Text.Trim()), txtmachinestop.Text.Trim(), txtstopreason.Text.Trim(), txtremarks.Text.Trim());
                if (dt.Rows.Count > 0)
                {
                    //divMsg.Visible = true;
                    //LblMsg.Text = " User - " + txtSupID.Text.Trim() + " added successfully!";
                    MsgBox1.MessageBox.Show("Record" + txtPO_No.SelectedValue.Trim() + "Created successfully ");
                    //txtPO_No.Text = "";
                    ddMachineNo.SelectedIndex = 0;
                    txtoperator.Text = "";
                    txtsupervisor.Text = "";
                    txtdate.Text = "";
                    ddShift.SelectedIndex = 0;
                    txttrollyno.Text = "";
                    txttrollyqty.Text = "";
                    txtbalqty2.Text = "";
                    ddLotNo.Text = "";
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
                MsgBox1.MessageBox.Show("Error while Submitting!!!");
                ex.StackTrace.ToString();
                return;
                //lblErrMessage.Text = "User already exists. Please add different user.!!!";
            }
        }
    }
}