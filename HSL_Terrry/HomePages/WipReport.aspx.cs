using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class WipReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
            }
        }

        protected void btnGetReport_OnClick(object sender, EventArgs e)
        {
            GenerateExcel();
        }

        public void GenerateExcel()
        {
            try
            {

                string encoding = String.Empty;
                string mimeType = String.Empty;
                string extension = String.Empty;
                Warning[] warnings;
                string[] streamIds;

                //Res2005.Warning[] warning = null;

                MyReportViewer.Visible = true;
                MyReportViewer.Reset();
                MyReportViewer.Width = 500;
                MyReportViewer.Height = 1000;
                MyReportViewer.ShowPrintButton = true;
                //DateTime fromdate = DateTime.Parse(txtFromDate.Text);
                //DateTime todate = DateTime.Parse(txtToDate.Text);k

                MyReportViewer.ProcessingMode = ProcessingMode.Remote;
                //IReportServerCredentials irsc = new CustomReportCredentials("appdev", "Olie*908");
                //MyReportViewer.ServerReport.ReportServerCredentials = irsc;
                //MyReportViewer.ServerReport.ReportServerUrl = new Uri("http://192.168.1.101/ReportServer");
                MyReportViewer.ServerReport.ReportServerUrl = new Uri("http://192.168.4.4/ReportServer");

                //MyReportViewer.ServerReport.ReportPath = "/Russell Daily Data/Report_Russell Daily Data";
                MyReportViewer.ServerReport.ReportPath = "/Terry_Test/WIP REPORT";
                MyReportViewer.ServerReport.Refresh();

                //Res2005.ParameterValue[] reportParameterCollection = new Res2005.ParameterValue[1];
                ReportParameter[] reportParameterCollection = new ReportParameter[1];
                reportParameterCollection[0] = new ReportParameter();
                //reportParameterCollection[0] = new ReportParameter("fromdate", "2019-06-27");
                //reportParameterCollection[1] = new ReportParameter("todate", "2019-07-04");
                //reportParameterCollection[2] = new ReportParameter("shift","");
                //reportParameterCollection[3] = new ReportParameter("operator","");
                //reportParameterCollection[4] = new ReportParameter("supervisor","");
                //reportParameterCollection[5] = new ReportParameter("process","");

                

                reportParameterCollection[0] = new Microsoft.Reporting.WebForms.ReportParameter();
                reportParameterCollection[0].Name = "process";
                reportParameterCollection[0].Values.Add(ddProcess.SelectedValue.ToString());
                MyReportViewer.ServerReport.SetParameters(reportParameterCollection);



                MyReportViewer.ServerReport.Refresh();


            }

            catch (Exception ex)
            {
                //MsgBox1.MessageBox.Show(ex.ToString());
                //return;

            }
        }
        protected void ReportViewer_OnLoad(object sender, EventArgs e)
        {
            string exportOption = "Excel";
            //string exportOption = "Word";
            //string exportOption = "PDF";
            RenderingExtension extension = MyReportViewer.LocalReport.ListRenderingExtensions().ToList().Find(x => x.Name.Equals(exportOption, StringComparison.CurrentCultureIgnoreCase));
            if (extension != null)
            {
                System.Reflection.FieldInfo fieldInfo = extension.GetType().GetField("m_isVisible", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
                fieldInfo.SetValue(extension, false);
            }
        }
    }
}