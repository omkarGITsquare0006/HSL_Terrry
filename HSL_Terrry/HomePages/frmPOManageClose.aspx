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
                    <div class="row">
                        <div class="col pr-1">
                            <div class="form-group">
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
                        </div>

                        <div class="col pr-0">
                            <div class="form-group">
                                <%--                            <div class="col">--%>
                                <label for="txtPOQty" class="col-form-label">PO Qty</label>
                                <%--                            </div>--%>
                                <%--                            <div class="col">--%>
                                <asp:TextBox ID="txtPOQty" class="form-control" ReadOnly="true" placeholder="PO Qty" runat="server" />
                                <%--                            </div>--%>
                            </div>
                        </div>

                        <div class="col pr-0">
                            <div class="form-group">
                                <%--                            <div class="col">--%>
                                <label for="TextPoProd" class="col-form-label">PO Produced</label>
                                <%--                            </div>--%>
                                <%--                            <div class="col">--%>
                                <asp:TextBox ID="TextPoProd" class="form-control" ReadOnly="true" placeholder="PO Produced" runat="server" />
                                <%--                            </div>--%>
                            </div>
                        </div>

                        <div class="col pr-1">
                            <div class="form-group">
                                <%--                            <div class="col">--%>
                                <label for="TextPoBal" class="col-form-label">PO Balance</label>
                                <%--                            </div>--%>
                                <%--                            <div class="col">--%>
                                <asp:TextBox ID="TextPoBal" class="form-control" ReadOnly="true" placeholder="PO Balance" runat="server" />
                                <%--                            </div>--%>
                            </div>
                        </div>

                        <div class="col pr-1">
                            <div class="form-group">
                                <%--                            <div class="col">--%>
                                <label for="txtLotBal" class="col-form-label invisible">Lot Balance</label>
                                <%--                            </div>--%>
                                <%-- OnClick="btnClose_Click"                           <div class="col">--%>
                                <button type="button" class="btn btn-outline-danger btn-block" id="btnClose" onclick="return Selected();">Short-Close</button>
                                <%--                            </div>--%>
                            </div>
                        </div>
                        <br />
                    </div>
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
