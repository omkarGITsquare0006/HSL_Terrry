using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HSL_Terrry.HomePages
{
    public partial class DailyReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //Loads Supervisor From Master Data
                    ddSupervisor.DataSource = CRUDApplication.Load_Supervisor();
                    ddSupervisor.DataTextField = "Sup_Name".ToString().Trim();
                    ddSupervisor.DataValueField = "Sup_Name".ToString().Trim();
                    ddSupervisor.DataBind();
                    ListItem itm2 = new ListItem();
                    itm2.Text = "-Select Supervisor-";
                    itm2.Value = "";
                    itm2.Selected = true;
                    ddSupervisor.Items.Insert(0, itm2);
                    ddSupervisor.SelectedIndex = 0;

                   
                }
                catch (Exception ex)
                {
                    MsgBox1.MessageBox.Show("Error while Getting Machine Name!!!");
                    return;
                }
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
                //MyReportViewer.ServerReport.ReportServerUrl = new Uri("http://192.168.1.102/ReportServer");
                MyReportViewer.ServerReport.ReportServerUrl = new Uri("http://192.168.4.4/ReportServer");

                //MyReportViewer.ServerReport.ReportPath = "/Russell Daily Data/Report_Russell Daily Data";
                MyReportViewer.ServerReport.ReportPath = "/Terry_Test/Prod-Daily";
                MyReportViewer.ServerReport.Refresh();

                //Res2005.ParameterValue[] reportParameterCollection = new Res2005.ParameterValue[1];
                ReportParameter[] reportParameterCollection = new ReportParameter[5];
                reportParameterCollection[0] = new ReportParameter();
                //reportParameterCollection[0] = new ReportParameter("fromdate", "2019-06-27");
                //reportParameterCollection[1] = new ReportParameter("todate", "2019-07-04");
                //reportParameterCollection[2] = new ReportParameter("shift","");
                //reportParameterCollection[3] = new ReportParameter("operator","");
                //reportParameterCollection[4] = new ReportParameter("supervisor","");
                //reportParameterCollection[5] = new ReportParameter("process","");

                reportParameterCollection[0].Name = "fromdate";
                reportParameterCollection[0].Values.Add(txtfromdate.Text);

                reportParameterCollection[1] = new Microsoft.Reporting.WebForms.ReportParameter();
                reportParameterCollection[1].Name = "todate";
                reportParameterCollection[1].Values.Add(txttodate.Text);

                reportParameterCollection[2] = new Microsoft.Reporting.WebForms.ReportParameter();
                reportParameterCollection[2].Name = "shift";
                reportParameterCollection[2].Values.Add(ddShift.SelectedValue.ToString());

                reportParameterCollection[3] = new Microsoft.Reporting.WebForms.ReportParameter();
                reportParameterCollection[3].Name = "supervisor";
                reportParameterCollection[3].Values.Add(ddSupervisor.SelectedValue.ToString());

                reportParameterCollection[4] = new Microsoft.Reporting.WebForms.ReportParameter();
                reportParameterCollection[4].Name = "process";
                reportParameterCollection[4].Values.Add(ddProcess.SelectedValue.ToString());
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