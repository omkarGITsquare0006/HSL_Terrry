<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="HourlyReport.aspx.cs" Inherits="HSL_Terrry.HomePages.frmHourlyReport" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <%-- Added By Rakshit --%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
        <%-- End --%>
        <link href="../content/bootstrap.min.css" rel="stylesheet" />
        <%--        <link href="../Styles/css/materialize.min.css" rel="stylesheet" />--%>
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
        <%-- Added By Rakshit --%>
        <link rel="stylesheet" href="../jquery-ui.css" />
        <script src="../jquery-ui.js"></script>
        <%-- End --%>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-left">
                <h3>HOURLY PRODUCTION REPORT</h3>
            </div>
        </div>
        <%-- Added by Rakshit --%>
        <div class="container-fluid border border-dark rounded">
            <div class="row">
                <div class="form-group col-md-2 p-2">
                    <label for="txtfromdate" class="col-form-label">From Date</label>
                    <asp:TextBox ID="txtfromdate" AutoComplete="Off" class="form-control" placeholder="Ex: yyyy/mm/dd" runat="server" />
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="txttodate" class="col-form-label">To Date</label>
                    <asp:TextBox ID="txttodate" AutoComplete="Off" class="form-control" placeholder="Ex: yyyy/mm/dd" runat="server" />
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="ddShift" class="col-form-label">Shift</label>
                    <asp:DropDownList ID="ddShift" class="form-control" runat="server" AutoPostBack="false">
                        <asp:ListItem Text="-Select Shift-" Value=""></asp:ListItem>
                        <asp:ListItem Text="1st Shift" Value="1st Shift"></asp:ListItem>
                        <asp:ListItem Text="2nd Shift" Value="2nd Shift"></asp:ListItem>
                        <asp:ListItem Text="3rd Shift" Value="3rd Shift"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="ddProcess" class="col-form-label">Process</label>
                    <asp:DropDownList ID="ddProcess" class="form-control" runat="server" AutoPostBack="false">
                        <asp:ListItem Text="-All Process-" Value=""></asp:ListItem>
                        <asp:ListItem Text="Length Cutting" Value="LSM"></asp:ListItem>
                        <asp:ListItem Text="Length Hemming" Value="LHM"></asp:ListItem>
                        <asp:ListItem Text="Cross Cutting and Hemming" Value="ACCH"></asp:ListItem>
                        <asp:ListItem Text="Manual Cross Cutting" Value="MCC"></asp:ListItem>
                        <asp:ListItem Text="Manual Cross Hemming" Value="MCH"></asp:ListItem>
                        <asp:ListItem Text="Embroidary Machine" Value="EMM"></asp:ListItem>
                        <asp:ListItem Text="Poly Packing" Value="PPM"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-2 p-2">
                    <label for="txtSupervisor" class="col-form-label">Supervisor</label>
                    <asp:DropDownList ID="ddSupervisor" class="form-control dropdown-toggle" runat="server" AutoPostBack="false" aria-haspopup="true" aria-expanded="false">
                        <asp:ListItem Text="Select" Value=""></asp:ListItem>
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
        <script type="text/javascript">
            function checkdates() {
                var fDate = document.getElementById('<%=txtfromdate.ClientID%>').value;
                var tDate = document.getElementById('<%=txttodate.ClientID%>').value;
                if (fDate == "" || tDate == "") {
                    alert("Please choose both FROM and TO dates");
                    //console.log("true called");
                    return false;
                } else {
                    //console.log("else called");
                    return true;
                }
                //fDate = new Date(fDate);
                //tDate = new Date(tDate);
                //if (fDate > tDate) {
                //    alert("FROM date should be less than TO date");
                //    return false;
                //}
            }
        </script>
    </body>
    </html>
</asp:Content>
