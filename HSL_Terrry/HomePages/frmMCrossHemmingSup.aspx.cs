using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmMCrossHemmingSup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindMCHData();
            if (!Page.IsPostBack)
            {
                Load_PONumber();
            }
        }

        protected void BindMCHData()
        {
            DataTable dtBeam = new DataTable();

            dtBeam = CRUDApplication.Load_MCHApproval();

            if (dtBeam.Rows.Count > 0)
            {
                gvBeamList.DataSource = dtBeam;
                gvBeamList.DataBind();

            }
            else
            {
                dtBeam.Rows.Add(dtBeam.NewRow());
                gvBeamList.DataSource = dtBeam;
                gvBeamList.DataBind();
                int columncount = gvBeamList.Rows[0].Cells.Count;
                gvBeamList.Rows[0].Cells.Clear();
                gvBeamList.Rows[0].Cells.Add(new TableCell());
                gvBeamList.Rows[0].Cells[0].ColumnSpan = columncount;
                gvBeamList.Rows[0].Cells[0].Text = "No Records Found ";
            }
        }



        protected void gvDetails_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            gvBeamList.EditIndex = e.NewEditIndex;
            //BindServerRoom();
            //divMsg.Visible = false;
        }

        protected void gvDetails_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {

        }

        protected void gvDetails_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {

        }

        protected void Load_PONumber()
        {
            try
            {
                txtPO_No.DataSource = CRUDApplication.Load_PONumberMch();
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
            DataTable dtPODetails = CRUDApplication.Load_PODetailsOnPONumberMch(txtPO_No.SelectedValue.Trim());
            if (dtPODetails.Rows.Count > 0)
            {
                //Load_LotNo(txtPO_No.SelectedValue);
                txtLotNo.DataSource = CRUDApplication.Load_LotNumberMch(txtPO_No.SelectedValue.Trim());
                txtLotNo.DataTextField = "Lot_No";
                txtLotNo.DataValueField = "Lot_No";
                txtLotNo.DataBind();
                ListItem itm2 = new ListItem();
                itm2.Text = "Select Lot Number";
                itm2.Value = "-1";
                itm2.Selected = true;
                txtLotNo.Items.Insert(0, itm2);
                txtLotNo.SelectedIndex = 0;
            }
            else
            {
                MsgBox1.MessageBox.Show("No Record Found or Something is going wrong...!");
                return;
            }

        }

        protected void ddLotNo_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DataTable dtPODetails = CRUDApplication.Load_ChangeLotNumberMch(txtPO_No.SelectedValue.Trim(), txtLotNo.SelectedValue.Trim());
                if (dtPODetails.Rows.Count > 0)
                {
                    TextLotQty.Text = Convert.ToString(dtPODetails.Rows[0]["Lot_Qty"]);
                    TextLotBal.Text = Convert.ToString(dtPODetails.Rows[0]["Lot_blnc"]);
                    TextLotProd.Text = Convert.ToString(dtPODetails.Rows[0]["Lot_Prod"]);

                }
                else
                {
                    MsgBox1.MessageBox.Show("No Record Found or Something is going wrong...!");
                    return;
                }

            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting Lot Number!!!");
                return;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {

                int dtLotClose = CRUDApplication.Close_LotNumberMch(txtPO_No.Text, txtLotNo.Text);
                if (dtLotClose > 0)
                {
                    MsgBox1.MessageBox.Show("po#" + txtLotNo.Text.Trim() + "closed successfully ");
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