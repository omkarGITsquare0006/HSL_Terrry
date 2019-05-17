﻿using HSL_Terrry.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmPolyPack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtprodqty.Attributes.Add("readonly", "readonly");
            string[] strID = Request.QueryString.GetValues("ID");
            if (!Page.IsPostBack)
            {
                if (strID != null)
                {
                    txtdate.ReadOnly = true;
                    ddShift.Enabled = false;
                    ddShift.CssClass = "form-control dropdown-toggle disabled";
                    txtoperator.ReadOnly = true;
                    txtsupervisor.ReadOnly = true;
                    ddMachineNo.Enabled = false;
                    ddMachineNo.CssClass = "form-control dropdown-toggle disabled";

                    Boolean edit = true;
                    LoadOprDetail(strID[0].ToString().Trim());
                    makeReadOnlyFields(edit);
                }
                else
                {
                    Load_PONumber();
                }
            }
        }

        protected void Load_PONumber()
        {
            try
            {
                txtPO_No.DataSource = CRUDApplication.Load_PONumberPP();
                txtPO_No.DataTextField = "Prod_Order_no".ToString().Trim();
                txtPO_No.DataValueField = "Prod_Order_no".ToString().Trim();
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
                LoadPODetail();
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
                return;
            }
        }

        //CALLING LOAD PO DETAIL METHOD FOR FETCHING PO DETAILS
        private void LoadPODetail()
        {
            DataTable dtPODetails = CRUDApplication.Load_PODetailsOnPONumberPP(txtPO_No.SelectedValue.Trim());
            if (dtPODetails.Rows.Count > 0)
            {
                txtdate.Text = DateTimeClass.CurrentDateTime();
                //txtpoodesc.Text = Convert.ToString(dtPODetails.Rows[0]["PO_Desc"]);
                txtcustno.Text = Convert.ToString(dtPODetails.Rows[0]["Customer"]);
                txtorderkg.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Kg"]);
                txtorderqty.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Oty"]);
                txtitemno.Text = Convert.ToString(dtPODetails.Rows[0]["Mateiral_code"]);
                txtitemdesc.Text = Convert.ToString(dtPODetails.Rows[0]["Mateiral_Desc"]);
                txtpcswt.Text = Convert.ToString(dtPODetails.Rows[0]["Per_piece_weight"]);
                //txtsono.Text = Convert.ToString(dtPODetails.Rows[0]["SO_No"]);
                txtshade.Text = Convert.ToString(dtPODetails.Rows[0]["Color"]);
                //txtcolordesc.Text = Convert.ToString(dtPODetails.Rows[0]["Color_Desc"]);
                txtsize.Text = Convert.ToString(dtPODetails.Rows[0]["Size"]);
                txtszdesc.Text = Convert.ToString(dtPODetails.Rows[0]["Size_Desc"]);
                //txtlotno.Text = Convert.ToString(dtPODetails.Rows[0]["Lot_No"]);
                txtgsm.Text = Convert.ToString(dtPODetails.Rows[0]["GSM"]);
                txtpcode.Text = Convert.ToString(dtPODetails.Rows[0]["Program_Code"]);
                txtpname.Text = Convert.ToString(dtPODetails.Rows[0]["Program_Name"]);
                txtproduct.Text = Convert.ToString(dtPODetails.Rows[0]["Product"]);
                txtpcsperkg.Text = Convert.ToString(dtPODetails.Rows[0]["PcsPer_Kg"]);
                //txtworkcentre.Text = Convert.ToString(dtPODetails.Rows[0]["Work_Centre"]);
                txtpcslength2.Text = Convert.ToString(dtPODetails.Rows[0]["Pcs_Length"]);
                txtpcswidth2.Text = Convert.ToString(dtPODetails.Rows[0]["Pcs_Width"]);
                txtnoofslits.Text = Convert.ToString(dtPODetails.Rows[0]["No_Of_Slit"]);
                txtprocessedqty.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_pcs"]);
                txtopenorderqty.Text = Convert.ToString(dtPODetails.Rows[0]["Po_blnc"]);
                txttotalconfirm.Text = Convert.ToString(dtPODetails.Rows[0]["TotProd"]);
            }
            else
            {
                MsgBox1.MessageBox.Show("No Record Found or Something is going wrong...!");
                return;
            }

        }

        protected void Btn_submit(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = CRUDApplication.AddNewrecordPP(txtPO_No.SelectedValue.Trim(), Convert.ToDateTime(txtdate.Text.Trim()), ddShift.SelectedValue, txtoperator.Text.Trim(),
                    txtsupervisor.Text.Trim(), ddMachineNo.SelectedValue, Convert.ToString(txtnoofpieces.Text.Trim()), Convert.ToInt32(txtnoofpp.Text.Trim()),
                    Convert.ToInt32(txtnoofslits.Text.Trim()),Convert.ToDecimal(txtprodqty.Text.Trim()),
                    Convert.ToInt32(txtopenorderqty.Text.Trim()), txtmachinestop.Text.Trim(), txtstopreason.Text.Trim(), txtremarks.Text.Trim());

                if (dt.Rows.Count > 0)
                {
                    textID.Text = Convert.ToString(dt.Rows[0]["Result"]);
                    MsgBox1.MessageBox.Show("Record " + textID.Text + " Created successfully ", "frmHome.aspx");
                    ddMachineNo.SelectedIndex = 0;
                    txtoperator.Text = "";
                    txtsupervisor.Text = "";
                    txtdate.Text = "";
                    ddShift.SelectedIndex = 0;
                    txtnoofpieces.Text = "";
                    txtnoofpp.Text = "";
                    txtopenorderqty.Text = "";
                    //txtLotNo.SelectedIndex = 0;
                    //TextLotQty.Text = "";
                    //TextLotProd.Text = "";
                    //TextLotBal.Text = "";
                    txtnoofslits.Text = "";
                    txtpcslength2.Text = "";
                    txtpcswidth2.Text = "";
                    //Textpcswt.Text = "";
                    txtprodqty.Text = "";
                    txtmachinestop.Text = "";
                    txtremarks.Text = "";

                }
                //Response.Redirect("frmHome.aspx");
            }

            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Submitting!!!");
                ex.StackTrace.ToString();
                return;
                //lblErrMessage.Text = "User already exists. Please add different user.!!!";
            }
        }

        protected void btn_Update(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = CRUDApplication.UpdaterecordPP(Convert.ToInt32(textID.Text.Trim()), txtPO_No.SelectedValue.Trim(), Convert.ToDateTime(txtdate.Text.Trim()), ddShift.SelectedValue, txtoperator.Text.Trim(),
                    txtsupervisor.Text.Trim(), ddMachineNo.SelectedValue, Convert.ToString(txtnoofpieces.Text.Trim()), Convert.ToInt32(txtnoofpp.Text.Trim()),
                    Convert.ToInt32(txtnoofslits.Text.Trim()), Convert.ToInt32(txtprodqty.Text.Trim()),
                    Convert.ToInt32(txtopenorderqty.Text.Trim()), txtmachinestop.Text.Trim(), txtstopreason.Text.Trim(), txtremarks.Text.Trim());
                if (dt.Rows.Count > 0)
                {

                    //divMsg.Visible = true;
                    //LblMsg.Text = " User - " + txtSupID.Text.Trim() + " added successfully!";
                    MsgBox1.MessageBox.Show("Record " + txtPO_No.SelectedValue.Trim() + " Updated successfully ", "frmHome.aspx");
                    //txtPO_No.Text = "";

                    ddMachineNo.SelectedIndex = 0;
                    txtoperator.Text = "";
                    txtsupervisor.Text = "";
                    txtdate.Text = "";
                    ddShift.SelectedIndex = 0;
                    txtnoofpieces.Text = "";
                    txtnoofpp.Text = "";
                    //txtbalqty2.Text = "";
                    //txtLotNo.SelectedIndex = 0;
                    //TextLotQty.Text = "";
                    //TextLotProd.Text = "";
                    //TextLotBal.Text = "";
                    txtnoofslits.Text = "";
                    txtpcslength2.Text = "";
                    txtpcswidth2.Text = "";
                    //Textpcswt.Text = "";
                    txtprodqty.Text = "";
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
            //Response.Redirect("frmHome.aspx");
        }

        protected void LoadOprDetail(string strId)
        {
            try
            {
                DataTable dtSupDetails = CRUDApplication.GetOperatorByIDPP(strId);
                if (dtSupDetails.Rows.Count > 0)
                {
                    //txtPO_No.ReadOnly = true;
                    ListItem itm2 = new ListItem();
                    txtPO_No.Items.Insert(0, Convert.ToString(dtSupDetails.Rows[0]["Prod_Order_no"]));
                    txtPO_No.SelectedIndex = 0;
                    LoadPODetail();

                    //DETAIL DATA BINDING FROM DATATABLE TO TEXTBOXES
                    textID.Text = Convert.ToString(dtSupDetails.Rows[0]["ID"]);
                    txtdate.Text = Convert.ToString(dtSupDetails.Rows[0]["Date"]);
                    ddShift.SelectedIndex = ddShift.Items.IndexOf(ddShift.Items.FindByText(Convert.ToString(dtSupDetails.Rows[0]["Shift"]).Trim()));
                    txtoperator.Text = Convert.ToString(dtSupDetails.Rows[0]["Operator"]);
                    txtsupervisor.Text = Convert.ToString(dtSupDetails.Rows[0]["Supervisor"]);
                    ddMachineNo.SelectedIndex = ddMachineNo.Items.IndexOf(ddMachineNo.Items.FindByText(Convert.ToString(dtSupDetails.Rows[0]["Machine_No"]).Trim()));
                    //txtLotNo.Items.Insert(0, Convert.ToString(dtSupDetails.Rows[0]["Lot_No"]));
                    //txtLotNo.SelectedIndex = 0;
                    //TextLotQty.Text = Convert.ToString(dtSupDetails.Rows[0]["Lot_Qty"]);
                    //TextLotProd.Text = Convert.ToString(dtSupDetails.Rows[0]["Lot_Prod"]);
                    //TextLotBal.Text = Convert.ToString(dtSupDetails.Rows[0]["Lot_blnc"]);
                    txtnoofpieces.Text = Convert.ToString(dtSupDetails.Rows[0]["No_Of_Pcs_Pack"]);
                    txtnoofpp.Text = Convert.ToString(dtSupDetails.Rows[0]["No_Of_Poly_Pack"]);
                    //txtnoofslits.Text = Convert.ToString(dtSupDetails.Rows[0]["No_Of_Slits"]);
                    //txtpcslength2.Text = Convert.ToString(dtSupDetails.Rows[0]["Length"]);
                    //txtpcswidth2.Text = Convert.ToString(dtSupDetails.Rows[0]["Width"]);
                    //Textpcswt.Text = Convert.ToString(dtSupDetails.Rows[0]["Pcs_Wt"]);
                    txtprodqty.Text = Convert.ToString(dtSupDetails.Rows[0]["Prod_pcs"]);
                    txtprocessedqty.Text = Convert.ToString(dtSupDetails.Rows[0]["Prod_pcs1"]);
                    txtopenorderqty.Text = Convert.ToString(dtSupDetails.Rows[0]["Bal_Pcs"]);
                    txttotalconfirm.Text = Convert.ToString(dtSupDetails.Rows[0]["TotProd"]);
                    txtmachinestop.Text = Convert.ToString(dtSupDetails.Rows[0]["Break_time"]);
                    txtstopreason.Text = Convert.ToString(dtSupDetails.Rows[0]["Reason"]);
                    txtremarks.Text = Convert.ToString(dtSupDetails.Rows[0]["Remarks"]);
                }
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting Details!!!");
                return;
                //lblErrMessage.Text = "Error while Getting Supervisor Details!!!";
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            btnEdit.Visible = false;
            makeReadOnlyFields(false);
        }

        private void makeReadOnlyFields(Boolean edit)
        {
            txtdate.ReadOnly = true;
            txtoperator.ReadOnly = true;
            txtsupervisor.ReadOnly = true;
            //TextLotQty.ReadOnly = true;
            //TextLotProd.ReadOnly = true;
            //TextLotBal.ReadOnly = true;
            txtnoofpieces.ReadOnly = edit;
            txtnoofpp.ReadOnly = edit;
            //Textpcswt.ReadOnly = edit;
            txtmachinestop.ReadOnly = edit;
            txtstopreason.ReadOnly = edit;
            txtremarks.ReadOnly = edit;
        }
    }
}