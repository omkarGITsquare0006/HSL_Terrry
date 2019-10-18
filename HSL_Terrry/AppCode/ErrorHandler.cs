using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Globalization;


    public class ErrorHandler
    {
    public static void WriteError(string errorMessage, string user)
    {
        try
        {
            string path = "~/Error/" + DateTime.Today.ToString("dd-MM-yy") + ".txt";
            if (!File.Exists(System.Web.HttpContext.Current.Server.MapPath(path)))
            {
                File.Create(System.Web.HttpContext.Current.Server.MapPath(path)).Close();
            }
            using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath(path)))
            {
                w.WriteLine("\r\nLog Entry : ");
                w.WriteLine("{0}", DateTime.Now.ToString(CultureInfo.InvariantCulture));
                string err = "Error in: " + System.Web.HttpContext.Current.Request.Url.ToString() +
                              ". Error Message:" + errorMessage + " For User/Role : " + user;
                w.WriteLine(err);

                //Exception ex = HttpContext.Current.Server.GetLastError();
                //System.Diagnostics.StackTrace trace = new System.Diagnostics.StackTrace(ex, true);
                //w.WriteLine("\nError encountered in method " + trace.GetFrame(0).GetMethod().Name);
                //trace.GetFrame(0).GetFileLineNumber());
                w.WriteLine("__________________________");
                w.Flush();
                w.Close();
            }
        }
        catch (Exception ex)
        {
            
        }

    }
}
