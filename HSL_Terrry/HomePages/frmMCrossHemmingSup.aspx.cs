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
                //Load_PONumber();
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

        protected void btnClose_Click(object sender, EventArgs e)
        {
            
        }
    }
}