<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmPOManage.aspx.cs" Inherits="HSL_Terrry.HomePages.frmPOManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>HIMATSINGKA</title>
        <script src="jquery-1.10.2.js"></script>
        <link href="jquery-ui.css" rel="stylesheet" />
        <script src="jquery-ui.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    </head>
    <body>
        <br />
        <div class="container">
            <div class="row justify-content-center mt-xl-5">
                <h3 class="mt-xl-3">PO RELEASE</h3>
            </div>
        </div>
        <asp:RequiredFieldValidator ID="user" runat="server" ControlToValidate="txtPO_No" EnableClientScript="false"
            ErrorMessage="Please enter PO Number" ForeColor="Red"></asp:RequiredFieldValidator>
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
                            <div class="input-group mb-3">
                                <asp:TextBox ID="txtPO_No" class="form-control" placeholder="PO Number" runat="server" />
                                <div class="input-group-append">
                                    <asp:Button class="btn btn-outline-secondary" ID="btnPoSearch" OnClick="btnPoSearch_Click" Text="Search" runat="server"></asp:Button>
                                </div>
                            </div>
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtpoodesc" class="col-form-label">PO Description</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtpoodesc" class="form-control" ReadOnly="true" placeholder="PO Description" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtcustno" class="col-form-label">Cust Number</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtcustno" class="form-control" ReadOnly="true" placeholder="Customer Number" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtorderkg" class="col-form-label">Order(KG)</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtorderkg" class="form-control" ReadOnly="true" placeholder="Order in kg" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                </div>


                <div class="row mt-0">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtorderqty" class="col-form-label">Order Qty(Pcs)</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:TextBox ID="txtorderqty" class="form-control" ReadOnly="true" placeholder="Order Qty" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtprodcode" class="col-form-label">Product code</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtprodcode" class="form-control" ReadOnly="true" placeholder="Product code" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtproddesc" class="col-form-label">Product Description</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtproddesc" class="form-control" ReadOnly="true" placeholder="Product Description" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtpcswt" class="col-form-label">Pieces/KG</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtpcswt" class="form-control" ReadOnly="true" placeholder="Pieces/KG" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>


                <div class="row mt-0">

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtshade" class="col-form-label">Color</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtcolor" class="form-control" ReadOnly="true" placeholder="Color" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtshade" class="col-form-label">Color Description</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtcolordesc" class="form-control" ReadOnly="true" placeholder="Color Description" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtsize" class="col-form-label">Size(CMS)</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:TextBox ID="txtsize" class="form-control" ReadOnly="true" placeholder="Size(CMS)" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtszdesc" class="col-form-label">Size Description</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtszdesc" class="form-control" ReadOnly="true" placeholder="Size Description" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>


                </div>

                <div class="row mt-1">

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtsono" class="col-form-label">SO No.</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtsono" class="form-control" ReadOnly="true" placeholder="SO Number" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtoperation" class="col-form-label">Program</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtoperation" class="form-control" ReadOnly="true" placeholder="Program" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtopdesc" class="col-form-label">Program Description</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtopdesc" class="form-control" ReadOnly="true" placeholder="Program Description" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtgsm" class="col-form-label">GSM</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtgsm" class="form-control" ReadOnly="true" placeholder="GSM" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                </div>

                <div class="row mt-1">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtpobal" class="col-form-label">PO Balance</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtpobal" class="form-control" ReadOnly="true" placeholder="PO Balance" runat="server" />
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

                </div>

                <div class="row">
                    <div class="col-4">
                        <asp:Button class="btn btn-success btn-block" ID="btnRelease" runat="server" Text="Release" OnClick="btn_Release"></asp:Button>
                    </div>
                    <div class="col-4">
                        <asp:Button class="btn btn-danger btn-block" runat="server" ID="btnClose" OnClick="btnClose_Click" Text="Short-Close" data-toggle="modal" data-target="#myModal"></asp:Button>
                    </div>
                </div>

            </div>
        </div>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#txtPO_No').autocomplete({
                    source: 'PoHandler.ashx'
                });
            });
        </script>
    </body>
    </html>
</asp:Content>

