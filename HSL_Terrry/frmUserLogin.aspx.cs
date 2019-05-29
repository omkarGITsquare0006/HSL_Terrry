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
using System.Collections;
using System.Threading;
using log4net;

namespace HSL_Terrry
{
    public partial class frmUserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ILog logger = log4net.LogManager.GetLogger("ErrorLog");
            logger.Info("logi page loaded");
        }
        protected void btn_signin(object sender, EventArgs e)
        {
            //Download();
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
                string uri = "ftp://" + "192.168.1.29" + "/" + "Terry" + "/" + "Terry_Sewing_PO.txt";
                Uri serverUri = new Uri(uri);
                if (serverUri.Scheme != Uri.UriSchemeFtp)
                {
                    return;
                }
                FtpWebRequest reqFTP;
                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + "192.168.1.29" + "/" + "Terry" + "/" + "Terry_Sewing_PO.txt"));
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
                FileStream writeStream = new FileStream(@"E:\po\" + "Terry_Sewing_PO.txt", FileMode.Create);


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
            catch (Exception ex)
            {

            }
        }
        //private void Download()
        //{
        //    try
        //    {
        //        string _ftpURL = "testsftp.com"; //Host URL or address of the SFTP server
        //        string _UserName = "admin";     //User Name of the SFTP server
        //        string _Password = "admin123";  //Password of the SFTP server
        //        int _Port = 22;                 //Port No of the SFTP server (if any)
        //        string _ftpDirectory = "Receipts"; //The directory in SFTP server where the files are present
        //        string LocalDirectory = "D:\\FilePuller"; //Local directory where the files will be downloaded

        //        //Sftp oSftp = new Sftp(_ftpURL, _UserName, _Password);
        //        Sftp.Connect(_Port);
        //        ArrayList FileList = Sftp.GetFileList(_ftpDirectory);
        //        FileList.Remove(".");
        //        FileList.Remove("..");          //Remove . from the file list
        //        FileList.Remove("Processed");   //Remove folder name from the file list. If there is no folder name remove the code.

        //        for (int i = 0; i < FileList.Count; i++)
        //        {
        //            if (!File.Exists(LocalDirectory + "/" + FileList[i]))
        //            {
        //                oSftp.Get(_ftpDirectory + "/" + FileList[i], LocalDirectory + "/" + FileList[i]);
        //                Thread.Sleep(100);
        //            }
        //        }
        //        oSftp.Close();
        //    }
        //    catch (WebException wEx)
        //    {
        //        wEx.StackTrace.ToString();
        //        MsgBox1.MessageBox.Show("Error is" + wEx);
        //        return;
        //    }

        //    catch (Exception ex)
        //    {
        //        ex.StackTrace.ToString();
        //        MsgBox1.MessageBox.Show("Error is" + ex);
        //        return;
        //    }
        //}
        //protected void Download()
        //{
        //    try
        //    {
        //        string uri = "ftp://" + "192.168.1.29" + "/" + "SAPPP" + "/" + "ZDIONE" + "/" + "Terry_sewing" + "/" + "Sewing_open_po_text_format_details.txt";
        //            //"sftp://" + "home637259329.1and1-data.host" + "/" + "dione2015" + "/" + "PO1.txt";
        //        //int Port = 22;
        //        //"ftp://" + "192.168.1.29" + "/" + "QA" + "/" + "Terry_Sewing_PO.txt";
        //        //"ftp://" + "192.168.1.29" + "/" + "SAPPP" + "/" + "ZDIONE" + "/" + "Terry_sewing" + "/" + "Sewing_open_po_text_format_details.txt"
        //        //"SAPPP" + "/" + "ZDIONE" + "/" + "Terry_sewing" + "/" +
        //        Uri serverUri = new Uri(uri);
        //        if (serverUri.Scheme != Uri.UriSchemeFtp)
        //        {
        //            return;
        //        }
        //        FtpWebRequest reqFTP;
        //        reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + "192.168.1.29" + "/" + "SAPPP" + "/" + "ZDIONE" + "/" + "Terry_sewing" + "/" + "Sewing_open_po_text_format_details.txt"));
        //        //
        //        //"SAPPP" + "/" + "ZDIONE" + "/" + "Terry_sewing" + "/" +
        //        //"ftp://" + "192.168.1.29" + "/" + "QA" + "/" + "Terry_Sewing_PO.txt"
        //        //reqFTP.Credentials = new NetworkCredential("warping", "W@rp1ng@098"); 
        //        reqFTP.Credentials = new NetworkCredential("u85741006", "Dione987#");
        //        reqFTP.KeepAlive = false;
        //        reqFTP.Method = WebRequestMethods.Ftp.DownloadFile;
        //        reqFTP.UseBinary = true;
        //        reqFTP.Proxy = null;
        //        reqFTP.UsePassive = false;
        //        FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
        //        Stream responseStream = response.GetResponseStream();
        //        //FileStream writeStream = new FileStream(@"D:\Shrishanth" + "\" + ""SetUP.EXE", FileMode.Create);  
        //        //FileStream writeStream = new FileStream(@"D:\Shrishanth\", FileMode.OpenOrCreate, FileAccess.Write);
        //        // FileStream writeStream = new FileStream(localDestnDir + "\" + file, FileMode.Create);  
        //        FileStream writeStream = new FileStream(@"E:\po\" + "Terry_Sewing_PO.txt", FileMode.Create);


        //        int Length = 2048;
        //        Byte[] buffer = new Byte[Length];
        //        int bytesRead = responseStream.Read(buffer, 0, Length);
        //        while (bytesRead > 0)
        //        {
        //            writeStream.Write(buffer, 0, bytesRead);
        //            bytesRead = responseStream.Read(buffer, 0, Length);
        //        }
        //        writeStream.Close();
        //        response.Close();
        //    }
        //    catch (Exception wEx)
        //    {
        //        wEx.StackTrace.ToString();
        //        MsgBox1.MessageBox.Show("Error is" + wEx);
        //        return;
        //    }

        //    //catch (Exception ex)
        //    //{
        //    //    ex.StackTrace.ToString();
        //    //    MsgBox1.MessageBox.Show("Error is" + ex);
        //    //    return;
        //    //}
        //}

        protected void ImportPONumber()
        {
            //System.Diagnostics.Process.Start("D:\\D-Ione\\Himatsinka\\po\\PODownload.bat");
            Download();
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