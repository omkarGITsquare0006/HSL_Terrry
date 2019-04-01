using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class frmHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(100);
            string date = System.DateTime.Now.ToLongDateString();
            string time = System.DateTime.Now.ToLongTimeString();
            lbltime.Text = date+" "+time;
        }
    }
}