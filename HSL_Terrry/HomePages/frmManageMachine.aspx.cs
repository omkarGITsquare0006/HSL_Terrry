using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmManageMachine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int dtLotClose = CRUDApplication.AddMaster(txtMachineName.Text,txtMachineDesc.Text,ddlScreen.SelectedValue,"Machine");
            if (dtLotClose > 0)
            {
                MsgBox1.MessageBox.Show(txtMachineName.Text.Trim() + " added successfully ", "AdminSupPanel.aspx");

            }
            else
            {
                MsgBox1.MessageBox.Show("Something is going wrong...!");
                return;
            }
        }
    }
}