<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="frmPOManage.aspx.cs" Inherits="HSL_Terrry.HomePages.frmPOManage" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <%--    <script src="Scripts/jquery-3.3.1.min.js"></script>--%>
    <%--    <script src="Scripts/bootstrap.min.js"></script>--%>
    <%--        <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
    <%--<script src="Scripts/Jquery_1_11.js" type="text/javascript"></script>
        <script src="Scripts/Jquery_1_10.js" type="text/javascript"></script>--%>
    <script src="jquery-1.10.2.js"></script>
    <script src="jquery-ui.js" type="text/javascript"></script>
    <link href="jquery-ui.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtPO_No').autocomplete({
                source: 'PoHandler.ashx'
            });
        });
    </script>
    <script>
        $(".autosearch-smart").autocomplete('PoHandler.ashx', {
            minChars: 1,
            width: 402,
            //matchContains: "word",
            autoFill: true,
            select: function (event, ui) {
                var label = ui.item.label;
                var value = ui.item.valueSelectedForAutocomplete;
                //store in session
                document.valueSelectedForAutocomplete = value
            }
        });
    </script>
</head>
<body>
    <form id="frm" runat="server">
        <div class="container">
            <div class="row justify-content-center mt-xl-5">
                <h3 class="mt-xl-3">PO RELEASE</h3>
            </div>
        </div>
        <br />
        <div class="row pr-0">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="row">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtpono" class="col-form-label">PO No:</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>

                            <asp:TextBox ID="txtPO_No" class="form-control" placeholder="PO Number" runat="server"/>
                             
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtlotno" class="col-form-label">Lot No.</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtlotno" class="form-control" placeholder="Lot Number" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtlotqty" class="col-form-label">Lot Qty</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtlotqty" class="form-control" placeholder="Lot Quantity" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtpobal" class="col-form-label">PO Bal.</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtpobal" class="form-control" placeholder="PO Balance" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>


                <div class="row mt-0">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtlotprod" class="col-form-label">Lot Prod</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:TextBox ID="txtlotprod" class="form-control" placeholder="Lot Produced" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtlotbal" class="col-form-label">Lot Bal.</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtlotbal" class="form-control" placeholder="Lot Balance" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtoperation" class="col-form-label">Operation</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtoperation" class="form-control" placeholder="Operation" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                </div>


                <div class="row mt-0">

                    <%--<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <div class="col">
                                <label for="txtextra" class="col-form-label">Extra Field</label>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtextra" class="form-control" placeholder="Extra Field" runat="server" />
                            </div>
                        </div>
                    </div>--%>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1 ">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtstatus" class="col-form-label">Status</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtstatus" class="form-control" placeholder="Status" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1 invisible">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtitemlot" class="col-form-label">Item Lot</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtitemlot" class="form-control" placeholder="Item Lot" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <asp:Button class="btn btn-success btn-block" ID="btnRelease" runat="server" Text="Release" OnClick="btn_Release"></asp:Button>
                    </div>
                </div>

            </div>
        </div>


    </form>

</body>
</html>
<%-- </asp:Content>--%>

