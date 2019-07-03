<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmPOManageClose.aspx.cs" Inherits="HSL_Terrry.HomePages.frmPOManageClose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
        <link href="../Styles/css/confirm.css" rel="stylesheet" />
        <link rel="stylesheet" href="../jquery-ui.css" />
        <script src="../jquery-ui.js"></script>
        <script type="text/javascript">
            function Selected() {
                var poqty = parseFloat(document.getElementById('<%=txtPOQty.ClientID %>').value);
                var prodqty = document.getElementById('<%=TextPoProd.ClientID %>');
                var dropdown = document.getElementById('<%=txtPO_No.ClientID %>');
                var strUser = dropdown.value;
                console.log("po is : " + strUser);
                if (strUser == "") {
                    alert('Please Enter PO Numer');
                } else {
                    if (prodqty.value < poqty) {
                        $.confirm({
                            title: 'Do you want to close?',
                            content: 'Produced quantity has not reached order quantity!',
                            buttons: {
                                cancel: function () {

                                },
                                somethingElse: {
                                    text: 'I know! proceed to close.',
                                    btnClass: 'btn-blue',
                                    keys: ['enter', 'shift'],
                                    action: function () {
                                        $('#myModal').modal();
                                    }
                                }
                            }
                        });
                    } else {
                        $.confirm({
                            title: 'Do you want to close?',
                            content: 'Please confirm to close PO.',
                            buttons: {
                                confirm: function () {
                                    $('#myModal').modal();
                                },
                                cancel: function () {

                                }
                            }
                        });
                    }
                }
            }
        </script>
    </head>
    <body>
        <%-- Card For PO Close --%>
        <div class="container-fluid pr-0 pl-0">
            <div class="card border-warning mt-3">
                <div class="card-header bg-warning" style="height: 50px;">
                    <p class="font-weight-bold">PO SHORT CLOSE</p>
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
                                <%--<asp:ListItem Text="Select screen" Value=""></asp:ListItem>--%>
                                <asp:ListItem Text="LSM-Length Slitting Machine" Value="Lsm_status"></asp:ListItem>
                                <asp:ListItem Text="LHM-Length Hemming Machine" Value="Lhm_status"></asp:ListItem>
                                <asp:ListItem Text="ACCHM-Automatic Cross Cutting and Cross Hemming Machine" Value="Acchm_status"></asp:ListItem>
                                <asp:ListItem Text="MCC-Manual Cross Cutting" Value="Mcc_status"></asp:ListItem>
                                <asp:ListItem Text="MCH-Manual Cross Hemming" Value="Mch_status"></asp:ListItem>
                                <asp:ListItem Text="EM-Embroidery Machine" Value="Em_status"></asp:ListItem>
                                <asp:ListItem Text="PP-Poly Packing" Value="Pp_status"></asp:ListItem>
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
                            <asp:DropDownList ID="txtPO_No1" class="form-control" runat="server" OnSelectedIndexChanged="LoadPODetails_OnSelectedIndexChanged"
                                AutoPostBack="true" Visible="false">
                            </asp:DropDownList>
                            <asp:TextBox ID="txtPO_No" CssClass="form-control" AutoPostBack="true" OnTextChanged="LoadPODetails_OnSelectedIndexChanged" runat="server"></asp:TextBox>
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
                            <button type="button" runat="server" class="btn btn-outline-danger btn-block" id="btnClose" onclick="return Selected();">Close</button>
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

        <div class="myAlert-top alert alert-danger hide">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Warning!</strong><span id="errmsg"></span>
        </div>

        <script type="text/javascript">  
            $(document).ready(function () {

                $("#<%=txtPO_No.ClientID%>").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            url: "frmPOManageClose.aspx/GetPoNum",
                            method: "post",
                            contentType: "application/json;charset=utf-8",
                            //data: JSON.stringify({ term: request.term }),
                            data: "{'term':'" + $("#<%=txtPO_No.ClientID%>").val() + "','screen':'" + $("#<%=ddlScreen.ClientID %>").val() + "'}",
                            dataType: 'json',
                            success: function (data) {
                                var ddlScreen = $("#<%=ddlScreen.ClientID %>");
                                var selectedValue = ddlScreen.val();
                                console.log("data is : " + selectedValue);
                                response(data.d);
                            },
                            error: function (err) {
                                console.log(err.responseText + " " + term);
                                alert(err);
                            }
                        });
                    }
                });
            });
        </script>
        <script src="../Styles/css/confirm.js" type="text/javascript"></script>
    </body>
    </html>
</asp:Content>
