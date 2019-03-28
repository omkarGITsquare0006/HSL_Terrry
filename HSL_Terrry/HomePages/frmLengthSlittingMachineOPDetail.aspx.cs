using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmLengthSlittingMachineOPDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] strID = Request.QueryString.GetValues("ID");
            if (strID != null)
            {
                LoadOprDetail(strID[0].ToString().Trim());
            }

            else
            {
                // Response.Redirect("~/SupervisorList.aspx");
            }
        }

        protected void Btn_submit(object sender, EventArgs e)
        {

        }

            protected void LoadOprDetail(string strId)
        {
            try
            {
                DataTable dtSupDetails = CRUDApplication.GetOperatorByID(strId);
                if (dtSupDetails.Rows.Count > 0)
                {
                    //txtPO_No.ReadOnly = true;
                    txtPO_No.Text = Convert.ToString(dtSupDetails.Rows[0]["PO_No"]);
                    txtdate.Text = Convert.ToString(dtSupDetails.Rows[0]["Date"]);
                    //ddShift.Text = Convert.ToString(dtSupDetails.Rows[0]["Shift"]);
                   
                    if (dtSupDetails.Rows[0]["Shift"].ToString().Trim() != null)
                        ddShift.SelectedIndex = Convert.ToInt32(dtSupDetails.Rows[0]["Shift"]);
                    else
                        ddShift.SelectedIndex = -1;
                    txtoperator.Text = Convert.ToString(dtSupDetails.Rows[0]["Operator"]);
                    txtsupervisor.Text = Convert.ToString(dtSupDetails.Rows[0]["Supervisor"]);
                    if (dtSupDetails.Rows[0]["Machine_No"].ToString().Trim() != null)
                        ddMachineNo.SelectedIndex = Convert.ToInt32(dtSupDetails.Rows[0]["Machine_No"]);
                    else
                        ddMachineNo.SelectedIndex = -1;
                    //txtdate.Text = Convert.ToString(dtSupDetails.Rows[0]["Date"]);
                }
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting Supervisor!!!");
                return;
                //lblErrMessage.Text = "Error while Getting Supervisor Details!!!";
            }
        }
    }
}