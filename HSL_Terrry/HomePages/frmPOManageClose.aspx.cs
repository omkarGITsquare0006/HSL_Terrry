using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmPOManageClose : System.Web.UI.Page
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
                itm2.Text = "Select PO Number";
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
            txtPOQty.Text = "";
            TextPoBal.Text = "";
            TextPoProd.Text = "";
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

        private void LoadPODetail()
        {
            DataTable dtPODetails = CRUDApplication.Load_PODetailsOnPONumber(txtPO_No.SelectedValue.Trim());
            if (dtPODetails.Rows.Count > 0)
            {
                txtPOQty.Text = Convert.ToString(dtPODetails.Rows[0]["Order_Oty"]);
                TextPoBal.Text = Convert.ToString(dtPODetails.Rows[0]["Po_blnc"]);
                TextPoProd.Text = Convert.ToString(dtPODetails.Rows[0]["Prod_pcs"]);
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

                int dtLotClose = CRUDApplication.Close_PODetailsOnPONumber(txtPO_No.Text, txtpocloseremark.Text);
                if (dtLotClose > 0)
                {
                    MsgBox1.MessageBox.Show("po#" + txtPO_No.Text.Trim() + "closed successfully ");
                    txtPO_No.Text = "";
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
    }
}