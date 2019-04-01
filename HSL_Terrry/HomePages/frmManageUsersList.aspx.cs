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
        //protected void gvSupList_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        //{
        //    //NewEditIndex property used to determine the index of the row being edited.  
        //    gvSupList.EditIndex = e.NewEditIndex;
        //    BindSupervisors();
        //}

        //protected void gvSupList_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        //{
        //    //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        //    gvSupList.EditIndex = -1;
        //    BindSupervisors();
        //}

        //protected void gvSupList_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        //{
        //    //Finding the controls from Gridview for the row which is going to update 

        //    Int64 id = (Int64)gvSupList.DataKeys[e.RowIndex].Values[0];
        //    string mach = (string)gvSupList.DataKeys[e.RowIndex].Values[1];

        //    //TextBox beamNo = gvSupList.Rows[e.RowIndex].FindControl("txtBeamNo") as TextBox;
        //    string beamNo = (gvSupList.Rows[e.RowIndex].FindControl("ddlBeam") as DropDownList).SelectedItem.Value;
        //    TextBox grossweight = gvSupList.Rows[e.RowIndex].FindControl("txtGrossWeight") as TextBox;
        //    TextBox NumberOfBreaks = gvSupList.Rows[e.RowIndex].FindControl("txtNoOfBreak") as TextBox;


        //    DataTable dt = CRUDApplication.UpdateBeamDetails(id, beamNo, grossweight.Text, NumberOfBreaks.Text);

        //    //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        //    gvSupList.EditIndex = -1;
        //    //Call ShowData method for displaying updated data  
        //    BindEmployeeDetails();

        //}

        protected void gvSupList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                //string strLoggedinUser = Session["UserID"].ToString().Trim();
                //DataTable dt = null;
                //string strSupId = Convert.ToString(e.CommandArgument).ToString().Trim();
                // Delete the record 
                //if (strLoggedinUser.ToUpper() != strSupId.ToUpper())
                //{
                //    dt = ClsSupervisorMasters.DeleteSupervisorByID(strSupId);
                //    DataTable dtSup = ClsSupervisorMasters.GetAllSupervisors();
                //gvSupList.DataSource = dtSup;
                //gvSupList.DataBind();
                //}
                //else
                //{
                //MsgBox1.MessageBox.Show("Cannot delete the Loggedin User");
                //return;
                //}
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