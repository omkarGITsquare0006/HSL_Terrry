using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class HomeMaster : System.Web.UI.MasterPage
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
                DateTime currentTime = DateTime.Now;
                //lblDateTime.Text = currentTime.ToString();
                String username = String.Empty;
                username = Session["UserDetail"].ToString();
                navbarDropdown.InnerText = username;
                //Hiding PO MANAGE Item from sidebar for operators
                if (Session["UserDetail"].ToString().Equals("Akshay"))
                {
                    poAnch.Visible = false;
                }
                //

            }

        }

        protected void btn_LogOut(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            try
            {
                Session.Abandon();
                FormsAuthentication.SignOut();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Buffer = true;
                Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                Response.Expires = -1000;
                Response.CacheControl = "no-cache";
                //Response.Redirect("login.aspx", true);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            Response.Redirect("~/frmUserLogin.aspx");
        }
    }
}