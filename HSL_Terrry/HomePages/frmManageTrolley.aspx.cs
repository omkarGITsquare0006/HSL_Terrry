using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmManageTrolley : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindListView();
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
                cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "GetMasters";
                cmdDistrict.Parameters.Add("@Operation", SqlDbType.Char).Value = ddlScreen.SelectedValue;
                cmdDistrict.Parameters.Add("@DataType", SqlDbType.Char).Value = "Trolley";
                ListView1.DataSource = cmdDistrict.ExecuteReader();
                ListView1.DataBind();
            }
            catch (Exception ex)
            {
                ex.StackTrace.ToString();
            }
        }

        protected void btnUpdate_click(object sender, EventArgs e)
        {
            foreach (ListViewItem item in ListView1.Items)
            {
                //Get the ID from the DataKey property.
                int ID = Convert.ToInt32((item.FindControl("id") as Label).Text);

                //Get the checked value of the CheckBox.
                bool isActive = (item.FindControl("chkActive") as CheckBox).Checked;

                //Update to database
                SqlConnection connGetDistrict = ConnectionProvider.GetConnection();
                try
                {
                    SqlCommand cmdDistrict = new SqlCommand("SP_GetPutSQLStatementHSL", connGetDistrict);
                    cmdDistrict.CommandType = CommandType.StoredProcedure;
                    cmdDistrict.CommandTimeout = 250;
                    cmdDistrict.Parameters.Add("@flag", SqlDbType.Char).Value = "UpdateMasters";
                    cmdDistrict.Parameters.Add("@ID", SqlDbType.Char).Value = ID;
                    cmdDistrict.Parameters.Add("@Active", SqlDbType.Char).Value = isActive;
                    ListView1.DataSource = cmdDistrict.ExecuteReader();
                    //ListView1.DataBind();
                    BindListView();
                }
                catch (Exception ex)
                {
                    ex.StackTrace.ToString();
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int dtLotClose = CRUDApplication.AddMaster(txtTrolleyNum.Text, txtTrTareWt.Text, ddlScreen.SelectedValue, "Trolley");
            if (dtLotClose > 0)
            {
                MsgBox1.MessageBox.Show(txtTrolleyNum.Text.Trim() + " added successfully ", "AdminSupPanel.aspx");

            }
            else
            {
                MsgBox1.MessageBox.Show("Something is going wrong...!");
                return;
            }
        }
    }
}