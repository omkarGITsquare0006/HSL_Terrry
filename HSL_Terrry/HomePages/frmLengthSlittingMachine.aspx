<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmLengthSlittingMachine.aspx.cs" Inherits="HSL_Terrry.HomePages.frmLengthSlittingMachine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>

    <html>
    <head>
        <title></title>
        <%--    <script src="Scripts/jquery-3.3.1.min.js"></script>--%>
        <%--    <script src="Scripts/bootstrap.min.js"></script>--%>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <h3>Length Slitting Machine</h3>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="row">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtpono" class="col-form-label">PO No:</label>
                                <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                <asp:TextBox ID="txtpono" class="form-control" placeholder="PO Number" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtpoodesc" class="col-form-label">PO Desc</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtpoodesc" class="form-control" placeholder="PO Description" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtcustno" class="col-form-label">Cust No</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtcustno" class="form-control" placeholder="Customer Number" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtorderkg" class="col-form-label">Order(KG)</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtorderkg" class="form-control" placeholder="Order in kg" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>
                </div>


                <div class="row mt-1">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtorderqty" class="col-form-label">Order Qty</label>
                                <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                <asp:TextBox ID="txtorderqty" class="form-control" placeholder="Order Qty" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtitemno" class="col-form-label">Item No</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtitemno" class="form-control" placeholder="Item Number" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtitemdesc" class="col-form-label">Item Desc</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtitemdesc" class="form-control" placeholder="Item Description" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
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



                <div class="row mt-1">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtlotqty" class="col-form-label">Lot Qty</label>
                                <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                <asp:TextBox ID="txtlotqty" class="form-control" placeholder="Lot Qty" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtpcswt" class="col-form-label">Pcs/Wt</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtpcswt" class="form-control" placeholder="Pieces/Weight" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtsono" class="col-form-label">SO No.</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtsono" class="form-control" placeholder="SO Number" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtshade" class="col-form-label">Shade</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtshade" class="form-control" placeholder="Shade" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>
                </div>


                <div class="row mt-1">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtpcslen" class="col-form-label">Pcs Lgth</label>
                                <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                <asp:TextBox ID="txtpcslen" class="form-control" placeholder="Pcs Length" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtpcswidth" class="col-form-label">Pcs Wdth</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtpcswidth" class="form-control" placeholder="Pcs Width" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="form-group">
<%--                            <div class="col">--%>
                                <label for="txtorderuom" class="col-form-label">Order UOM</label>
<%--                            </div>--%>
<%--                            <div class="col">--%>
                                <asp:TextBox ID="txtorderuom" class="form-control" placeholder="Order UOM" runat="server" />
<%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
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


            </div>
        </div>
    </body>
    </html>
</asp:Content>
