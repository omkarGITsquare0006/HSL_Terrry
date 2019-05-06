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
using System.Net;
using System.IO;

namespace HSL_Terrry
{
    public partial class frmUserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btn_signin(object sender, EventArgs e)
        {
            Download();
            ImportPONumber();
            DataTable dtLogin = CRUDApplication.CheckLoginCredential(username.Text.Trim(), pwd.Text.Trim());
            if (dtLogin.Rows.Count == 1)
            {
                Session["UserDetail"] = dtLogin.Rows[0]["Sup_Name"];
                Session["RoleID"] = dtLogin.Rows[0]["RoleId"];
                Session["UserID"] = username.Text;
                Session["Usernm"] = username.Text.Trim();
                //Session["IsAdmin"] = dtLogin.Rows[0]["IsAdmin"];
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

        }
        private void Download()
        {
            try
            {
                string uri = "ftp://" + "192.168.1.29" + "/" + "SAPPP" + "/" + "ZDIONE" + "/" + "Terry_sewing" + "/" + "Sewing open po text format details.txt";
                Uri serverUri = new Uri(uri);
                if (serverUri.Scheme != Uri.UriSchemeFtp)
                {
                    return;
                }
                FtpWebRequest reqFTP;
                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + "192.168.1.29" + "/" + "SAPPP" + "/" + "ZDIONE" + "/" + "Terry_sewing" + "/" + "Sewing open po text format details.txt"));
                reqFTP.Credentials = new NetworkCredential("warping", "W@rp1ng@098"); 
                 reqFTP.KeepAlive = false;
                reqFTP.Method = WebRequestMethods.Ftp.DownloadFile;
                reqFTP.UseBinary = true;
                reqFTP.Proxy = null;
                reqFTP.UsePassive = false;
                FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
                Stream responseStream = response.GetResponseStream();
                //FileStream writeStream = new FileStream(@"D:\Shrishanth" + "\" + ""SetUP.EXE", FileMode.Create);  
                //FileStream writeStream = new FileStream(@"D:\Shrishanth\", FileMode.OpenOrCreate, FileAccess.Write);
                // FileStream writeStream = new FileStream(localDestnDir + "\" + file, FileMode.Create);  
                FileStream writeStream = new FileStream(@"E:\po\" + "Sewing open po text format details.txt", FileMode.Create);


                int Length = 2048;
                Byte[] buffer = new Byte[Length];
                int bytesRead = responseStream.Read(buffer, 0, Length);
                while (bytesRead > 0)
                {
                    writeStream.Write(buffer, 0, bytesRead);
                    bytesRead = responseStream.Read(buffer, 0, Length);
                }
                writeStream.Close();
                response.Close();
            }
            catch (WebException wEx)
            {

            }
            catch (Exception ex)
            {

            }
        }

        protected void ImportPONumber()
        {
            //System.Diagnostics.Process.Start("D:\\D-Ione\\Himatsinka\\po\\PODownload.bat");
            //Download();
            DataTable dt = CRUDApplication.InserPOfromtxt();
            if (dt.Rows.Count > 0)
            {
                //alert.Visible = true;
            }
            else
            {
                MsgBox1.MessageBox.Show("PO Number Not Updated!!!");
                return;
            }
        }
    }
}