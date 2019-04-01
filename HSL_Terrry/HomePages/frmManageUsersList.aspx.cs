using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmManageUsersList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindSupervisors();
        }

        protected void BindSupervisors()
        {
            DataTable dtSup = new DataTable();

            dtSup = ClsSupervisorMasters.GetAllSupervisors();

            if (dtSup.Rows.Count > 0)
            {

                BeamList.DataSource = dtSup;
                BeamList.DataBind();


            }
            //}
            else
            {
                dtSup.Rows.Add(dtSup.NewRow());
                BeamList.DataSource = dtSup;
                BeamList.DataBind();
                int columncount = BeamList.Rows[0].Cells.Count;
                BeamList.Rows[0].Cells.Clear();
                BeamList.Rows[0].Cells.Add(new TableCell());
                BeamList.Rows[0].Cells[0].ColumnSpan = columncount;
                BeamList.Rows[0].Cells[0].Text = "No Records Found";
            }


        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePages/frmManageUsers.aspx");
        }
     
        protected void gvSupList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                
            }
        }

        protected void gvSupList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkbtnDelete = (LinkButton)e.Row.FindControl("lnkbtnDelete");

                lnkbtnDelete.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure to delete this User - " +
                DataBinder.Eval(e.Row.DataItem, "Sup_ID") + "')");

            }
        }

        protected void gvSupList_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void gvSupList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string strLoggedinUser = Session["UserID"].ToString().Trim();
            DataTable dt = null;
            string strSupID = (string)BeamList.DataKeys[e.RowIndex].Value.ToString().Trim();
            if (strLoggedinUser.ToUpper() != strSupID.ToUpper())
            {
                dt = ClsSupervisorMasters.DeleteSupervisorByID(strSupID);
                DataTable dtSup = ClsSupervisorMasters.GetAllSupervisors();
                BeamList.DataSource = dtSup;
                BeamList.DataBind();
            }
            else
            {
                MsgBox1.MessageBox.Show("Cannot delete the Loggedin User");
                return;
            }
        }
    }
}