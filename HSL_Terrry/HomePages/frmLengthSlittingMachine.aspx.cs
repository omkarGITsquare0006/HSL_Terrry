using HSL_Terrry.AppCode;
using log4net;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmLengthSlittingMachine : System.Web.UI.Page
    {
        ILog logger = log4net.LogManager.GetLogger("[LengthSlittingMachine]");
        protected void Page_Load(object sender, EventArgs e)
        {
            txtprodpcs.Attributes.Add("readonly", "readonly");
            txtudf.Attributes.Add("readonly", "readonly");
            txtprodwt.Attributes.Add("readonly", "readonly");
            txtoperator.Attributes.Add("readonly", "readonly");
            loading.Attributes.Add("hidden", "hidden");
            string[] strID = Request.QueryString.GetValues("ID");
            BindListView();
            if (!IsPostBack)
            {
                Load_Master();
                if (strID != null)
                {
                    txtdate.ReadOnly = true;
                    ddShift.Enabled = false;
                    ddShift.CssClass = "form-control dropdown-toggle disabled";
                    txtoperator.ReadOnly = true;
                    ddMachineNo.Enabled = false;
                    ddMachineNo.CssClass = "form-control dropdown-toggle disabled";
                    txtnoofslits.ReadOnly = true;

                    Boolean edit = true;
                    LoadOprDetail(strID[0].ToString().Trim());
                    txtsupervisor.CssClass = "form-control dropdown-toggle disabled";
                    makeReadOnlyFields(edit);
                }
                else
                {
                    txtoperator.Text = Session["UserDetail"].ToString();
                }
            }
        }

        private void BindListView()
        {
            SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
            try
            {
                SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
                cmdDistrict.CommandType = CommandType.StoredProcedure;
                cmdDistrict.CommandTimeout = 250;
                cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GetRej";
                cmdDistrict.Parameters.Add("@Operation", SqlDbType.Char).Value = "LSM";
                cmdDistrict.Parameters.Add("@DataType", SqlDbType.Char).Value = "Reject";
                SqlDataReader rdr= cmdDistrict.ExecuteReader();
                ListView1.DataSource = rdr;
                ListView1.DataBind();
                rdr.Close();

                SqlCommand cmdDistrict1 = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
                cmdDistrict1.CommandType = CommandType.StoredProcedure;
                cmdDistrict1.CommandTimeout = 250;
                cmdDistrict1.Parameters.Add("@flag", SqlDbType.Char).Value = "GetRej";
                cmdDistrict1.Parameters.Add("@Operation", SqlDbType.Char).Value = "LSM";
                cmdDistrict1.Parameters.Add("@DataType", SqlDbType.Char).Value = "Stoppage";
                ListView2.DataSource = cmdDistrict1.ExecuteReader();
                ListView2.DataBind();
            }
            catch (Exception ex)
            {
                ex.StackTrace.ToString();
            }
        }

        protected void Load_Master()
        {
            try
            {
                //Loads Supervisor From Master Data
                txtsupervisor.DataSource = CRUDApplication.Load_Supervisor();
                txtsupervisor.DataTextField = "Sup_Name".ToString().Trim();
                txtsupervisor.DataValueField = "Sup_Name".ToString().Trim();
                txtsupervisor.DataBind();
                ListItem itm2 = new ListItem();
                itm2.Text = "--------Select Supervisor--------";
                itm2.Value = "-1";
                itm2.Selected = true;
                txtsupervisor.Items.Insert(0, itm2);
                txtsupervisor.SelectedIndex = 0;

                //Loads Machines From Master Data
                ddMachineNo.DataSource = CRUDApplication.Load_Master("LSM", "Machine");
                ddMachineNo.DataTextField = "Data_Dispaly".ToString().Trim();
                ddMachineNo.DataValueField = "Data_Dispaly".ToString().Trim();
                ddMachineNo.DataBind();
                ListItem mach = new ListItem();
                mach.Text = "--------Select Machine--------";
                mach.Value = "-1";
                mach.Selected = true;
                ddMachineNo.Items.Insert(0, mach);
                ddMachineNo.SelectedIndex = 0;

                //Loads Trolley Numbers From Master Data
                txttrollyno.DataSource = CRUDApplication.Load_Master("LSM", "Trolley");
                txttrollyno.DataTextField = "Data_Dispaly".ToString().Trim();
                txttrollyno.DataValueField = "Data_Dispaly".ToString().Trim();
                txttrollyno.DataBind();
                ListItem trn = new ListItem();
                trn.Text = "-----Select Trolley Number-----";
                trn.Value = "-1";
                trn.Selected = true;
                txttrollyno.Items.Insert(0, trn);
                txttrollyno.SelectedIndex = 0;

                //Loads Reject Reasonss From Master Data
                Textrejreason.DataSource = CRUDApplication.Load_Master("LSM", "Reject");
                Textrejreason.DataTextField = "Data_Dispaly".ToString().Trim();
                Textrejreason.DataValueField = "Data_Dispaly".ToString().Trim();
                Textrejreason.DataBind();
                ListItem rej = new ListItem();
                rej.Text = "-----Select Reject Reason-----";
                rej.Value = "-1";
                rej.Selected = true;
                Textrejreason.Items.Insert(0, rej);
                Textrejreason.SelectedIndex = 0;

                //Loads Stoppage Reasonss From Master Data
                txtstopreason.DataSource = CRUDApplication.Load_Master("LSM", "Stoppage");
                txtstopreason.DataTextField = "Data_Dispaly".ToString().Trim();
                txtstopreason.DataValueField = "Data_Dispaly".ToString().Trim();
                txtstopreason.DataBind();
                ListItem stop = new ListItem();
                stop.Text = "-----Select Stoppage Reason-----";
                stop.Value = "-1";
                stop.Selected = true;
                txtstopreason.Items.Insert(0, stop);
                txtstopreason.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting Machine Name!!!");
                return;
            }
        }

        protected void LoadPODetails_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            loading.Attributes.Remove("hidden");
            try
            {
                LoadPODetail();
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
                return;
            }
            finally
            {
                loading.Visible = false;
            }
        }


        //CALLING LOAD PO DETAIL METHOD FOR FETCHING PO DETAILS
        public void LoadPODetail()
        {
            DataTable dtPODetails = CRUDApplication.Load_PODetailsOnPONumber(txtPO_No.Text.Trim());
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

                // txtLotNo.DataSource = CRUDApplication.Load_LotNumber(txtPO_No.SelectedValue);
                //txtLotNo.DataTextField = "Lot_No";
                //txtLotNo.DataValueField = "Lot_No";
                //txtLotNo.DataBind();
                //txtLotNo.SelectedIndex = 0;
                //Load_LotNo(txtPO_No.SelectedValue);
                //txtLotNo.DataSource = CRUDApplication.Load_LotNumber(txtPO_No.SelectedValue.Trim());
                //txtLotNo.DataTextField = "Lot_No";
                //txtLotNo.DataValueField = "Lot_No";
                //txtLotNo.DataBind();
                //ListItem itm2 = new ListItem();
                //itm2.Text = "Select Lot Number";
                //itm2.Value = "-1";
                //itm2.Selected = true;
                //txtLotNo.Items.Insert(0, itm2);
                //txtLotNo.SelectedIndex = 0;
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
                string produced = txtprodpcs.Text.Trim();
                DataTable dt = CRUDApplication.AddNewrecord(txtPO_No.Text.Trim(), Convert.ToDateTime(txtdate.Text.Trim()), ddShift.SelectedValue, txtoperator.Text.Trim(),
                    txtsupervisor.SelectedValue, ddMachineNo.SelectedValue, Convert.ToString(txttrollyno.SelectedValue.Trim()), Convert.ToInt32(txttrollyqty.Text.Trim()),
                    Convert.ToInt32(txtnoofslits.Text.Trim()), Convert.ToDecimal(Textprodmtr.Text.Trim()), Convert.ToDecimal(txtpcslength2.Text.Trim()), txtpcswidth2.Text.Trim(),
                     Convert.ToInt32(TextrejQty.Text.Trim()), Textrejreason.SelectedValue, Convert.ToDecimal(txtprodwt.Text.Trim()), Convert.ToInt32(txtprodpcs.Text.Trim()),
                    Convert.ToInt32(txtopenorderqty.Text.Trim()), txtmachinestop.Text.Trim(), txtstopreason.Text.Trim(), txtremarks.Text.Trim(), Convert.ToInt32(txtudf.Text.Trim()));

                if (dt.Rows.Count > 0)
                {
                    textID.Text = Convert.ToString(dt.Rows[0]["Result"]);
                    MsgBox1.MessageBox.Show("Record " + textID.Text + " Created successfully ", "frmHome.aspx");
                    ddMachineNo.SelectedIndex = 0;
                    txtoperator.Text = "";
                    txtdate.Text = "";
                    ddShift.SelectedIndex = 0;
                    txttrollyqty.Text = "";
                    txtopenorderqty.Text = "";
                    //txtLotNo.SelectedIndex = 0;
                    //TextLotQty.Text = "";
                    //TextLotProd.Text = "";
                    //TextLotBal.Text = "";
                    txtnoofslits.Text = "";
                    Textprodmtr.Text = "";
                    txtpcslength2.Text = "";
                    txtpcswidth2.Text = "";
                    //Textpcswt.Text = "";
                    TextrejQty.Text = "";
                    txtprodwt.Text = "";
                    txtprodpcs.Text = "";
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
                //txtprodpcs.Text = Convert.ToString((Convert.ToDecimal(Textprodmtr.Text.Trim()) / (Convert.ToDecimal(txtpcslength2.Text.Trim()) / 100)) * (Convert.ToInt32(txtnoofslits.Text.Trim()) + 1));
                DataTable dt = CRUDApplication.Updaterecord(Convert.ToInt32(textID.Text.Trim()), txtPO_No.Text.Trim(), Convert.ToDateTime(txtdate.Text.Trim()), ddShift.SelectedValue, txtoperator.Text.Trim(),
                    txtsupervisor.SelectedValue, ddMachineNo.SelectedValue, Convert.ToInt32(txtprodpcs.Text.Trim()),
                    txttrollyno.SelectedValue.Trim(), Convert.ToInt32(txttrollyqty.Text.Trim()), Convert.ToDecimal(Textprodmtr.Text.Trim()),
                    Convert.ToInt32(TextrejQty.Text.Trim()), Textrejreason.SelectedValue, Convert.ToDecimal(txtprodwt.Text.Trim()),
                    Convert.ToInt32(txtopenorderqty.Text.Trim()), txtmachinestop.Text.Trim(), txtstopreason.SelectedValue, txtremarks.Text.Trim(), Session["UserDetail"].ToString(), Convert.ToInt32(txtudf.Text.Trim()));

                if (dt.Rows.Count > 0)
                {
                    logger.Info(Session["UserDetail"].ToString() + ":Data updated for:[" + txtPO_No.Text.Trim() + "] Trolly Number: " + txttrollyno.SelectedValue + ",Trolley Qty: "
                                            + txttrollyqty.Text + ",Prod mtr:" + Textprodmtr.Text + ",Reject Qty:" + TextrejQty.Text + ",Reject Reason:" + Textrejreason.SelectedValue +
                                            ",Machine stop:" + txtmachinestop.Text + ",Stop reason:" + txtstopreason.SelectedValue + ",Remarks:" + txtremarks.Text);
                    MsgBox1.MessageBox.Show("Record " + txtPO_No.Text.Trim() + " Updated successfully ", "frmHome.aspx");

                    ddMachineNo.SelectedIndex = 0;
                    txtoperator.Text = "";
                    txtdate.Text = "";
                    ddShift.SelectedIndex = 0;
                    txttrollyqty.Text = "";
                    txtnoofslits.Text = "";
                    Textprodmtr.Text = "";
                    txtpcslength2.Text = "";
                    txtpcswidth2.Text = "";
                    TextrejQty.Text = "";
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
            }
        }

        protected void LoadOprDetail(string strId)
        {
            try
            {
                DataTable dtSupDetails = CRUDApplication.GetOperatorByID(strId);
                if (dtSupDetails.Rows.Count > 0)
                {
                    ListItem itm2 = new ListItem();
                    txtPO_No.Text = Convert.ToString(dtSupDetails.Rows[0]["Prod_Order_no"]);
                    LoadPODetail();

                    //DETAIL DATA BINDING FROM DATATABLE TO TEXTBOXES
                    textID.Text = Convert.ToString(dtSupDetails.Rows[0]["ID"]);
                    txtdate.Text = Convert.ToString(dtSupDetails.Rows[0]["Date"]);
                    ddShift.SelectedIndex = ddShift.Items.IndexOf(ddShift.Items.FindByText(Convert.ToString(dtSupDetails.Rows[0]["Shift"]).Trim()));
                    txtoperator.Text = Convert.ToString(dtSupDetails.Rows[0]["Operator"]);
                    txtsupervisor.SelectedIndex = txtsupervisor.Items.IndexOf(txtsupervisor.Items.FindByText(Convert.ToString(dtSupDetails.Rows[0]["Supervisor"])));
                    ddMachineNo.SelectedIndex = ddMachineNo.Items.IndexOf(ddMachineNo.Items.FindByText(Convert.ToString(dtSupDetails.Rows[0]["Machine_No"]).Trim()));

                    txttrollyno.SelectedIndex = txttrollyno.Items.IndexOf(txttrollyno.Items.FindByText(Convert.ToString(dtSupDetails.Rows[0]["Trolly_no"])));
                    txttrollyqty.Text = Convert.ToString(dtSupDetails.Rows[0]["Trolly_Qty"]);
                    Textprodmtr.Text = Convert.ToString(dtSupDetails.Rows[0]["Pod_mtr"]);
                    TextrejQty.Text = Convert.ToString(dtSupDetails.Rows[0]["Rejected_Qty"]);
                    Textrejreason.SelectedIndex = Textrejreason.Items.IndexOf(Textrejreason.Items.FindByText(Convert.ToString(dtSupDetails.Rows[0]["Reason_Rej"])));
                    txtprodwt.Text = Convert.ToString(dtSupDetails.Rows[0]["Prod_Kg"]);
                    txtprodpcs.Text = Convert.ToString(dtSupDetails.Rows[0]["Prod_pcs"]);
                    txtprocessedqty.Text = Convert.ToString(dtSupDetails.Rows[0]["Prod_pcs1"]);
                    txtopenorderqty.Text = Convert.ToString(dtSupDetails.Rows[0]["Bal_Pcs"]);
                    txttotalconfirm.Text = Convert.ToString(dtSupDetails.Rows[0]["TotProd"]);
                    txtmachinestop.Text = Convert.ToString(dtSupDetails.Rows[0]["Break_time"]);
                    txtstopreason.SelectedIndex = txtstopreason.Items.IndexOf(txtstopreason.Items.FindByText(Convert.ToString(dtSupDetails.Rows[0]["Reason"])));
                    txtremarks.Text = Convert.ToString(dtSupDetails.Rows[0]["Remarks"]);
                    txtudf.Text = Convert.ToString(dtSupDetails.Rows[0]["Udf_1"]);
                    logger.Info(Session["UserDetail"].ToString() + ":Data fetched for:[" + txtPO_No.Text.Trim() + "] Trolly Number: " + txttrollyno.SelectedValue + ",Trolley Qty: "
                        + txttrollyqty.Text + ",Prod mtr:" + Textprodmtr.Text + ",Reject Qty:" + TextrejQty.Text + ",Reject Reason:" + Textrejreason.SelectedValue +
                        ",Machine stop:" + txtmachinestop.Text + ",Stop reason:" + txtstopreason.SelectedValue + ",Remarks:" + txtremarks.Text);
                }
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting Details!!!");
                return;
            }
        }

        protected void btnCalculate(object sender, EventArgs e)
        {
            txtprodpcs.Text = Convert.ToString((Convert.ToDecimal(Textprodmtr.Text.Trim()) / (Convert.ToDecimal(txtpcslength2.Text.Trim()) / 100)) * (Convert.ToInt32(txtnoofslits.Text.Trim()) + 1));
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
            //TextLotQty.ReadOnly = true;
            //TextLotProd.ReadOnly = true;
            //TextLotBal.ReadOnly = true;
            txttrollyqty.ReadOnly = edit;
            Textprodmtr.ReadOnly = edit;
            //Textpcswt.ReadOnly = edit;
            TextrejQty.ReadOnly = edit;
            txtprodwt.ReadOnly = edit;
            txtmachinestop.ReadOnly = edit;
            txtremarks.ReadOnly = edit;
        }

        //PO Textbox Autocomplete
        [WebMethod]
        public static string[] GetPoNum(string term)
        {
            List<string> listPoNum = new List<string>();
            //string[] listPoNum = null;
            try
            {
                listPoNum = CRUDApplication.Load_PONumber_Auto("Lsm_status", term);
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
            }
            return listPoNum.ToArray<string>();
        }
    }
}