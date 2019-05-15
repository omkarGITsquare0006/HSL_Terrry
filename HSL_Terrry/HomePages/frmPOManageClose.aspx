<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmPOManageClose.aspx.cs" Inherits="HSL_Terrry.HomePages.frmPOManageClose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
        <script type="text/javascript">
            function Selected() {
                var dropdown = document.getElementById('<%=txtPO_No.ClientID %>');
                var strUser = dropdown.options[dropdown.selectedIndex].value;
                if (strUser == -1) {
                    alert('Please select a PO');
                } else {
                    $('#myModal').modal();
                }
            }
        </script>
    </head>
    <body>
        <%-- Card For PO Close --%>
        <div class="container-fluid">
            <div class="card border-warning mt-5">
                <div class="card-header bg-warning" style="height: 50px;">
                    <p>PO SHORT CLOSE</p>
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
                            <asp:DropDownList ID="ddlScreen" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlScreen_SelectedIndexChanged">
                                <asp:ListItem Text="Select screen" Value=""></asp:ListItem>
                                <asp:ListItem Text="LSM-Length Slitting Machine" Value="Lsm_status"></asp:ListItem>
                                <asp:ListItem Text="LHM-Length Hemming Machine" Value="Lhm_status"></asp:ListItem>
                                <asp:ListItem Text="ACCHM-Automatic Cross Cutting and Cross Hemming Machine" Value="Acchm_status"></asp:ListItem>
                                <asp:ListItem Text="MCC-Manual Cross Cutting" Value="Mcc_status"></asp:ListItem>
                                <asp:ListItem Text="MCH-Manual Cross Hemming" Value="Mch_status"></asp:ListItem>
                                <asp:ListItem Text="EM-Embroidery Machine" Value="Em_status"></asp:ListItem>
                            </asp:DropDownList>
                            <%--                            </div>--%>
                        </div>

                        <div class="form-group col-md-6 p-2">
                            <%--                            <div class="col">--%>
                            <label for="txtPO_No" class="col-form-label">PO No:</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:DropDownList ID="txtPO_No" class="form-control" runat="server" OnSelectedIndexChanged="LoadPODetails_OnSelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                            <%--                            </div>--%>
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <%--                            <div class="col">--%>
                            <label for="txtPOQty" class="col-form-label">Order Qty</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtPOQty" class="form-control" ReadOnly="true" placeholder="PO Qty" runat="server" />
                            <%--                            </div>--%>
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <%--                            <div class="col">--%>
                            <label for="TextPoProd" class="col-form-label">Confirmed Qty</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="TextPoProd" class="form-control" ReadOnly="true" placeholder="PO Produced" runat="server" />
                            <%--                            </div>--%>
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <%--                            <div class="col">--%>
                            <label for="TextPoBal" class="col-form-label">Open Order Qty</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="TextPoBal" class="form-control" ReadOnly="true" placeholder="PO Balance" runat="server" />
                            <%--                            </div>--%>
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <%--                            <div class="col">--%>
                            <label for="txtscrap" class="col-form-label">Scrap Qty</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtscrap" class="form-control" ReadOnly="true" placeholder="Scrap Qty" runat="server" />
                            <%--                            </div>--%>
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <%--                            <div class="col">--%>
                            <label for="txttotconfirm" class="col-form-label">Tot Confirmed</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txttotconfirm" class="form-control" ReadOnly="true" placeholder="Tot Cnfmd Qty" runat="server" />
                            <%--                            </div>--%>
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <%--                            <div class="col">--%>
                            <label for="btnClose" class="col-form-label invisible">Lot Balance</label>
                            <%--                            </div>--%>
                            <%-- OnClick="btnClose_Click"                           <div class="col">--%>
                            <button type="button" class="btn btn-outline-danger btn-block" id="btnClose" onclick="return Selected();">Close</button>
                            <%--                            </div>--%>
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Remark below for closing</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <asp:TextBox ID="txtpocloseremark" Rows="5" TextMode="MultiLine" class="form-control" placeholder="Type remarks....." runat="server" />
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <asp:Button runat="server" class="btn btn-danger" OnClick="btnClose_Click" Text="Yes! Close"></asp:Button>
                    </div>

                </div>
            </div>
        </div>

    </body>
    </html>
</asp:Content>
