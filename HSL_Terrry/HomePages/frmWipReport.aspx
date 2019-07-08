<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmWipReport.aspx.cs" Inherits="HSL_Terrry.HomePages.frmWipReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <%-- Added By Omkar --%>
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
        <%-- Added by Omkar --%>
        <div class="container-fluid border border-dark rounded">
            <div class="row">
                <div class="form-group col-md-2 p-2">
                    <label for="txtdate" class="col-form-label">From Date</label>
                    <asp:TextBox ID="txtfromdate" AutoComplete="Off" class="form-control" placeholder="Ex: yyyy/mm/dd" runat="server" />
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="txtdate" class="col-form-label">To Date</label>
                    <asp:TextBox ID="txttodate" AutoComplete="Off" class="form-control" placeholder="Ex: yyyy/mm/dd" runat="server" />
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="ddShift" class="col-form-label">Shift</label>
                    <asp:DropDownList ID="ddShift" class="form-control" runat="server" AutoPostBack="false">
                        <asp:ListItem Text="Select Shift" Value=""></asp:ListItem>
                        <asp:ListItem Text="1st Shift" Value="firstshift"></asp:ListItem>
                        <asp:ListItem Text="2nd Shift" Value="secondshift"></asp:ListItem>
                        <asp:ListItem Text="3rd Shift" Value="thirdshift"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="txtProcess" class="col-form-label">Process</label>
                    <asp:TextBox ID="txtProcess" AutoComplete="Off" class="form-control" placeholder="Ex: LSM,LHM,ACCH,..etc" runat="server" />
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="txtSupervisor" class="col-form-label">Supervisor</label>
                    <asp:TextBox ID="txtSupervisor" AutoComplete="Off" class="form-control" placeholder="supervisor name" runat="server" />
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="txtOperator" class="col-form-label">Operator</label>
                    <asp:TextBox ID="txtOperator" AutoComplete="Off" class="form-control" placeholder="operator Name" runat="server" />
                </div>
            </div>
            <div class="row justify-content-md-center">
                <asp:Button runat="server" ID="btnGetReport" Text="Get Report" class="btn btn-success btn-sm mb-1" />
            </div>
        </div>
        <%-- End --%>
        <br />
        <div class="row" style="margin-right: 0px; margin-left: 0px; overflow: auto;">
            <rsweb:ReportViewer ID="MyReportViewer" runat="server" ShowExportControls="true"
                OnLoad="ReportViewer_OnLoad" ZoomMode="PageWidth" AsyncRendering="false" Visible="false"
                ShowParameterPrompts="false" ShowFindControls="true" SizeToReportContent="True"
                ShowBackButton="false" ShowPageNavigationControls="true" Width="80%" Height="100%">
            </rsweb:ReportViewer>
        </div>

        <script>
            $(document).ready(function () {
                $('#<%=txtfromdate.ClientID%>').datepicker({
                    showTimePicker: false,
                    dateFormat: 'yy-mm-dd'
                });
                $('#<%=txttodate.ClientID%>').datepicker({
                    showTimePicker: false,
                    dateFormat: 'yy-mm-dd'
                });
            });
        </script>
    </body>
    </html>
</asp:Content>
