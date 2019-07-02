<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmManageStoppage.aspx.cs" Inherits="HSL_Terrry.HomePages.frmManageStoppage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="../content/bootstrap.min.css" rel="stylesheet" />
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
    </head>
    <body>
        <%-- Card For PO Close --%>
        <div class="container-fluid pr-0 pl-0">
            <div class="card border-warning mt-3">
                <div class="card-header bg-warning" style="height: 50px;">
                    <p class="font-weight-bold">MANAGE STOPPAGE REASONS</p>
                </div>
                <div class="card-body">
                    <div class="form-row">

                        <div class="form-group col-md-6 p-2">
                            <%--                            <div class="col">--%>
                            <label for="txtPO_No" class="col-form-label">Select Screen</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:DropDownList ID="ddlScreen" class="form-control" runat="server" AutoPostBack="true">
                                <%--<asp:ListItem Text="Select screen" Value=""></asp:ListItem>--%>
                                <asp:ListItem Text="LSM-Length Slitting Machine" Value="LSM"></asp:ListItem>
                                <asp:ListItem Text="LHM-Length Hemming Machine" Value="LHM"></asp:ListItem>
                                <asp:ListItem Text="ACCHM-Automatic Cross Cutting and Cross Hemming Machine" Value="ACCHM"></asp:ListItem>
                                <asp:ListItem Text="MCC-Manual Cross Cutting" Value="MCC"></asp:ListItem>
                                <asp:ListItem Text="MCH-Manual Cross Hemming" Value="MCH"></asp:ListItem>
                                <asp:ListItem Text="EM-Embroidery Machine" Value="EM"></asp:ListItem>
                                <asp:ListItem Text="PP-Poly Packing" Value="PP"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group col-md-6 p-2">
                            <label for="txtStopCode" class="col-form-label">Stoppage Code:</label>
                            <asp:TextBox ID="txtStopCode" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col p-2">
                            <label for="txtStopDesc" class="col-form-label">Stoppage Description</label>
                            <asp:TextBox ID="txtStopDesc" class="form-control" placeholder="Reject Description" runat="server" />
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <%--                            <div class="col">--%>
                            <label for="btnClose" class="col-form-label invisible">Lot Balance</label>
                            <%--                            </div>--%>
                            <%-- OnClick="btnClose_Click"                           <div class="col">--%>
                            <asp:Button runat="server" class="btn btn-success btn-block" ID="btnAdd" Text="Add" OnClick="btnAdd_Click"></asp:Button>
                            <%--                            </div>--%>
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </div>

    </body>
    </html>

</asp:Content>
