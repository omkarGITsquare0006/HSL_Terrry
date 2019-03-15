using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class HomeMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String username = String.Empty;
            username = Session["username"].ToString();
            navbarDropdown.InnerText = username;
        }
        protected void Anchor_Click(Object sender, EventArgs e)
        {
            String username = String.Empty;
            username = Session["username"].ToString();
            if (username.Equals("akshay"))
            {
                Response.Redirect("frmLengthSlittingMachineSup.aspx");
            }
            else
            {
                Response.Redirect("frmLengthSlittingMachine.aspx");
            }

        }
    }
}