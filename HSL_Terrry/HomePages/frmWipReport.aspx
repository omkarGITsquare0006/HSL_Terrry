<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmWipReport.aspx.cs" Inherits="HSL_Terrry.HomePages.frmWipReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="../content/bootstrap.min.css" rel="stylesheet" />
        <link href="../Styles/css/materialize.min.css" rel="stylesheet" />
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-left">
                <h3>WIP REPORT</h3>
                </div>
        </div>
        <br />
        <div class="row" style="margin-right: 0px; margin-left: 0px; overflow: auto;">
            <rsweb:reportviewer id="MyReportViewer" runat="server" showexportcontrols="true"
                onload="ReportViewer_OnLoad" zoommode="PageWidth" asyncrendering="false" visible="false"
                showparameterprompts="false" showfindcontrols="true" sizetoreportcontent="True"
                showbackbutton="false" showpagenavigationcontrols="true" width="80%" height="100%">
                </rsweb:reportviewer>
            </div>
      </body>
      </html>
</asp:Content>
