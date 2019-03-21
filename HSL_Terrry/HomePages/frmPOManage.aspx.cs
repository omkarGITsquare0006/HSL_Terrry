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