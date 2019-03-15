using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace HSL_Terrry
{
    public partial class frmUserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
<<<<<<< HEAD
        protected void btn_signin(object sender, EventArgs e)
        {

            DataTable dtLogin = CRUDApplication.CheckLoginCredential(username.Text.Trim(), pwd.Text.Trim());
            if (dtLogin.Rows.Count == 1)
            {
                Session["UserDetail"] = dtLogin.Rows[0]["Sup_Name"];
                Session["UserID"] = username.Text;
                Session["Usernm"] = username.Text.Trim();
                Session["IsAdmin"] = dtLogin.Rows[0]["IsAdmin"];
                if (HttpContext.Current.Session["Usernm"] != null)
                {
                    ////Start here
                    Random rd;
                    rd = new Random();
                    string rno = rd.Next().ToString();
                    // Session.Add("Authcookie", rno);
                    if (Request.Cookies["LOGINAUTH"] != null)
                    {
                        Response.Cookies["LOGINAUTH"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Remove("LOGINAUTH");
                    }
                    System.Web.Security.FormsAuthenticationTicket ticket1;
                    ticket1 = new System.Web.Security.FormsAuthenticationTicket(1, Convert.ToString(Session["Usernm"]), DateTime.Now, DateTime.Now.AddSeconds(60), false, "");
                    string encryptedText = System.Web.Security.FormsAuthentication.Encrypt(ticket1);
                    Response.Cookies.Add(new HttpCookie("LOGINAUTH", encryptedText));
                    Session.Add("Authcookie", encryptedText);
                    Session["User"] = username.Text.Trim();

                    ////end here
                    FormsAuthentication.RedirectFromLoginPage(Convert.ToString(Session["User"]), false);
                    Response.Redirect("HomePages/frmHome.aspx");
                }
                else
                {
                    MsgBox1.MessageBox.Show("Login Failed. Please Enter Correct Username and Password");
                    return;
                }
            }
            else
            {
                MsgBox1.MessageBox.Show("Login Failed. Please Enter Correct Username and Password");
                return;
            }

=======

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String username = txtmobile.Text.ToString();
            Session["username"] = username;
            Response.Redirect("HomePages/frmHome.aspx");
>>>>>>> 27f41312f913066f567e2f0a74ae6a2f96b010ca
        }
    }
}