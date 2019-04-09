using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
                Response.Cache.SetNoStore();
                Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
                Response.CacheControl = "Private";
                Response.CacheControl = "no-cache";
                Response.Cache.AppendCacheExtension("post-check=0,pre-check=0");
                Response.AddHeader("Pragma", "no-cache");
                if (Convert.ToString(Session["Usernm"]) == " ")
                {
                    Session.Clear();
                    Session.Abandon();
                    Session.RemoveAll();
                    Response.Redirect("~/frmUserLogin.aspx");
                }
                if (!Page.IsPostBack)
                {
                    if (!IsPostBack && !Session.IsNewSession && Request.Cookies["LOGINAUTH"].Value != ""
                           && Request.Cookies["LOGINAUTH"].Value != null &&
                           Convert.ToString(Session["Authcookie"]).Equals(Request.Cookies["LOGINAUTH"].Value))
                    {
                        //String a = Request.Cookies["ASP.NET_SessionId"].Value;

                        //MsgBox1.MessageBox.Show("Sucess");
                    }
                    else
                    {
                        Response.Cookies["LOGINAUTH"].Expires = DateTime.Now.AddDays(-1);
                        Session.Clear();
                        Session.Abandon();
                        Response.Redirect("~/frmUserLogin.aspx");
                    }
                }
                Load_Department();
                DateTime currentTime = DateTime.Now;
                //lblDateTime.Text = currentTime.ToString();
                //lblUsername.Text = "Welcome," + " " + Session["UserDetail"].ToString();

                string[] strSupID = Request.QueryString.GetValues("Sup_Id");
                if (strSupID != null)
                {
                    LoadSupDetail(strSupID[0].ToString().Trim());
                }

                else
                {
                    // Response.Redirect("~/SupervisorList.aspx");
                }
            }



        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                lblErrMessage.Text = "";
                string[] strSupID = Request.QueryString.GetValues("Sup_Id");
                Int16 intActive;
                string intRole;
                if (chkActive.Checked)
                    intActive = 1;
                else
                    intActive = 0;
                intRole = ddlRole.SelectedItem.Value;
                if (strSupID != null)
                {
                    DataTable dt = ClsSupervisorMasters.UpdateSupervisor(txtSupID.Text.Trim(), txtSupName.Text, txtPassword.Text, ddlDept.SelectedValue, txtEmailID.Text, intActive, intRole);
                    if (dt.Rows.Count > 0)
                    {
                        //divMsg.Visible = true;
                        MsgBox1.MessageBox.Show(" User - " + txtSupID.Text.Trim() + " updated successfully!");
                    }
                }
                else
                {

                    DataTable dt = ClsSupervisorMasters.AddNewSupervisor(txtSupID.Text, txtSupName.Text, txtPassword.Text, ddlDept.SelectedValue, txtEmailID.Text, intActive, intRole);
                    if (dt.Rows.Count > 0)
                    {
                        //divMsg.Visible = true;
                        MsgBox1.MessageBox.Show(" User - " + txtSupID.Text.Trim() + " added successfully!");
                        txtSupID.Text = "";
                        txtSupName.Text = "";
                        txtPassword.Text = "";
                        txtEmailID.Text = "";
                        ddlDept.SelectedValue = "-1";
                    }
                }
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Adding User!!!");
                return;
                //lblErrMessage.Text = "User already exists. Please add different user.!!!";
            }
        }

        protected void LoadSupDetail(string strSupId)
        {
            try
            {
                DataTable dtSupDetails = ClsSupervisorMasters.GetSupervisorByID(strSupId);
                if (dtSupDetails.Rows.Count > 0)
                {
                    txtSupID.ReadOnly = true;
                    txtSupID.Text = Convert.ToString(dtSupDetails.Rows[0]["Sup_Id"]);
                    txtSupName.Text = Convert.ToString(dtSupDetails.Rows[0]["Sup_Name"]);
                    txtPassword.Text = Convert.ToString(dtSupDetails.Rows[0]["Password"]);
                    txtEmailID.Text = Convert.ToString(dtSupDetails.Rows[0]["EmailID"]);
                    if (dtSupDetails.Rows[0]["Dept_Id"].ToString().Trim() != null)
                        ddlDept.SelectedIndex = Convert.ToInt32(dtSupDetails.Rows[0]["Dept_Id"]);
                    else
                        ddlDept.SelectedIndex = -1;
                    chkActive.Checked = Convert.ToBoolean(dtSupDetails.Rows[0]["Active"]);
                   // chkAdmin.Checked = Convert.ToBoolean(dtSupDetails.Rows[0]["IsAdmin"]);
                }
            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting User!!!");
                return;
                //lblErrMessage.Text = "Error while Getting Supervisor Details!!!";
            }
        }


        protected void Load_Department()
        {
            try
            {
                ddlDept.DataSource = ClsSupervisorMasters.GetDepartments();
                ddlDept.DataTextField = "Dept_Name";
                ddlDept.DataValueField = "Dept_Id";
                ddlDept.DataBind();
                ListItem itm2 = new ListItem();
                itm2.Text = "------Select Department------";
                itm2.Value = "-1";
                itm2.Selected = true;
                ddlDept.Items.Insert(0, itm2);
                ddlDept.SelectedIndex = 0;

            }
            catch (Exception ex)
            {
                MsgBox1.MessageBox.Show("Error while Getting Departments!!!");
                return;
                //lblErrMessage.Text = "Error while Getting Department!!!";
            }
        }
    }
}