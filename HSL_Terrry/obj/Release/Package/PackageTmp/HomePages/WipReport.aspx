<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="WipReport.aspx.cs" Inherits="HSL_Terrry.HomePages.WipReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
        <%-- End --%>
        <link href="../content/bootstrap.min.css" rel="stylesheet" />
        <%--        <link href="../Styles/css/materialize.min.css" rel="stylesheet" />--%>
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
        <%-- Added By Omkar --%>
        <link rel="stylesheet" href="../jquery-ui.css" />
        <script src="../jquery-ui.js"></script>
        <%-- End --%>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-left">
                <h3>WIP REPORT</h3>
            </div>
        </div>
      
        <div class="container-fluid border border-dark rounded">
            <div class="row">
                <div class="form-group col-md-2 p-2">
                    <label for="ddProcess" class="col-form-label">Process</label>
                    <asp:DropDownList ID="ddProcess" class="form-control" runat="server" AutoPostBack="false">
                        <asp:ListItem Text="Show All" Value=""></asp:ListItem>
                        <asp:ListItem Text="Length Cutting" Value="LSM"></asp:ListItem>
                        <asp:ListItem Text="Length Hemming" Value="LHM"></asp:ListItem>
                        <asp:ListItem Text="Cross Cutting-Hemming" Value="ACCH"></asp:ListItem>
                        <asp:ListItem Text="Embroidary Machine" Value="EMM"></asp:ListItem>
                        <asp:ListItem Text="Poly Packing" Value="PPM"></asp:ListItem>
                        <asp:ListItem Text="Carton Packing" Value="CPM"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                
            </div>
            <div class="row justify-content-md-center">
                <asp:Button runat="server" ID="btnGetReport" Text="Get Report" OnClientClick="return checkdates()" OnClick="btnGetReport_OnClick" class="btn btn-success btn-sm mb-1" />
            </div>
        </div>
        <%-- End --%>
        <br />
        <div class="row mb-5" style="margin-right: 0px; margin-left: 0px; overflow: auto;">
            <rsweb:ReportViewer ID="MyReportViewer" runat="server" ShowExportControls="true"
                OnLoad="ReportViewer_OnLoad" ZoomMode="PageWidth" AsyncRendering="false" Visible="false"
                ShowParameterPrompts="false" ShowFindControls="true" SizeToReportContent="True"
                ShowBackButton="false" ShowPageNavigationControls="true" Width="100%" Height="100%">
            </rsweb:ReportViewer>
        </div>

    </body>
    </html>
</asp:Content>
