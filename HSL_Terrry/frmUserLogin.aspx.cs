using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry
{
    public partial class frmUserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String username = txtmobile.Text.ToString();
            Session["username"] = username;
            Response.Redirect("HomePages/frmHome.aspx");
        }
    }
}