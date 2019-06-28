using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmPOManageClose : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnClose.Attributes.Add("disabled", "disabled");
            Console.WriteLine("PO manage clicked!");
            if (!Page.IsPostBack)
            {
                //Load_PONumber(ddlScreen.SelectedValue.ToString().Trim());
            }
        }

        //protected void Load_PONumber(String screenName)
        //{
        //    try
        //    {
        //        txtPO_No.DataSource = CRUDApplication.Load_PONumber(screenName);
        //        txtPO_No.DataTextField = "Prod_Order_no";
        //        txtPO_No.DataValueField = "Prod_Order_no";
        //        txtPO_No.DataBind();
        //        ListItem itm2 = new ListItem();
        //        itm2.Text = "Select PO Number";
        //        itm2.Value = "-1";
        //        itm2.Selected = true;
        //        txtPO_No.Items.Insert(0, itm2);
        //        txtPO_No.SelectedIndex = 0;

        //    }
        //    catch (Exception ex)
        //    {
        //        MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
        //        return;
        //    }
        //}

        protected void LoadPODetails_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            txtPOQty.Text = "";
            TextPoBal.Text = "";
            TextPoProd.Text = "";
            try
            {
                LoadPODetail(ddlScreen.SelectedValue.ToString().Trim());
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
                return;
            }
        }

        private void LoadPODetail(String screenType)
        {
            DataTable dtPODetails = new DataTable();
            switch (screenType)
            {
                case "Lsm_status":
                    dtPODetails = CRUDApplication.Load_PODetailsOnPONumber(txtPO_No.Text.Trim());
                    break;
                case "Lhm_status":
                    dtPODetails = CRUDApplication.Load_PODetailsOnPONumberLhm(txtPO_No.Text.Trim());
                    break;
                case "Acchm_status":
                    dtPODetails = CRUDApplication.Load_PODetailsOnPONumberAcc(txtPO_No.Text.Trim());
                    break;
                case "Mcc_status":
                    dtPODetails = CRUDApplication.Load_PODetailsOnPONumberMcc(txtPO_No.Text.Trim());
                    break;
                case "Mch_status":
                    dtPODetails = CRUDApplication.Load_PODetailsOnPONumberMch(txtPO_No.Text.Trim());
                    break;
                case "Em_status":
                    dtPODetails = CRUDApplication.Load_PODetailsOnPONumberEmm(txtPO_No.Text.Trim());
                    break;
                case "Pp_status":
                    dtPODetails = CRUDApplication.Load_PODetailsOnPONumberPP(txtPO_No.Text.Trim());
                    break;
            }
            if (dtPODetails.Rows.Count > 0)
            {
                txtPOQty.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Oty"]);
                TextPoBal.Text = Convert.ToString(dtPODetails.Rows[0]["Po_blnc"]);
                TextPoProd.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_pcs"]);
                txtscrap.Text = Convert.ToString(dtPODetails.Rows[0]["Scrap"]);
                txttotconfirm.Text = Convert.ToString(dtPODetails.Rows[0]["TotProd"]);
                btnClose.Attributes.Remove("disabled");
            }
            else
            {
                MsgBox1.MessageBox.Show("No Record Found or Something is going wrong...!");
                return;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {

                int dtLotClose = CRUDApplication.Close_PODetailsOnPONumber(txtPO_No.Text, txtpocloseremark.Text, ddlScreen.SelectedValue.Trim());
                if (dtLotClose > 0)
                {
                    MsgBox1.MessageBox.Show("po#" + txtPO_No.Text.Trim() + "closed successfully ", "AdminSupPanel.aspx");
                    //txtPO_No.Text = "";
                    //txtlotno.Text = "";
                    //txtlotqty.Text = "";
                    //txtpobal.Text = "";

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

        protected void ddlScreen_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Load_PONumber(ddlScreen.SelectedValue.ToString().Trim());
        }

        //PO Textbox Autocomplete
        [WebMethod]
        public static string[] GetPoNum(string term,string screen)
        {
            List<string> listPoNum = new List<string>();
            //string[] listPoNum = null;
            try
            {
                listPoNum = CRUDApplication.Load_PONumber_Auto(screen, term);
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting PO Number!!!");
            }
            return listPoNum.ToArray<string>();
        }
    }
}