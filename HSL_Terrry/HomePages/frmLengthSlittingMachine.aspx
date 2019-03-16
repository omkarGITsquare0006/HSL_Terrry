<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmLengthSlittingMachine.aspx.cs" Inherits="HSL_Terrry.HomePages.frmLengthSlittingMachine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <%--    <script src="Scripts/jquery-3.3.1.min.js"></script>--%>
        <%--    <script src="Scripts/bootstrap.min.js"></script>--%>
        <%--        <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-xl-5">
                <h3 class="mt-xl-3">Length Slitting Machine</h3>
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
                            <asp:TextBox ID="txtPONo" class="form-control" placeholder="PO Number" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
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

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
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
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
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

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtitemno" class="col-form-label">Item No</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtitemno" class="form-control" placeholder="Item Number" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtitemdesc" class="col-form-label">Item Desc</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtitemdesc" class="form-control" placeholder="Item Description" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
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
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
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

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtpcswt" class="col-form-label">Pcs/Wt</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtpcswt" class="form-control" placeholder="Pieces/Weight" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtsono" class="col-form-label">SO No.</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtsono" class="form-control" placeholder="SO Number" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
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
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
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

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtpcswidth" class="col-form-label">Pcs Wdth</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtpcswidth" class="form-control" placeholder="Pcs Width" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtorderuom" class="col-form-label">Order UOM</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtorderuom" class="form-control" placeholder="Order UOM" runat="server" />
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


                <div class="row mt-1">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtprocessedqty" class="col-form-label">Processed Qty</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:TextBox ID="txtprocessedqty" class="form-control" placeholder="Processed Quantity" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtbalqty" class="col-form-label">Balance Qty</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtbalqty" class="form-control" placeholder="Balance Quantity" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtextra" class="col-form-label">Extra Field</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtextra" class="form-control" placeholder="Extra Field" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtstatus" class="col-form-label">Status</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtstatus" class="form-control" placeholder="Status" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>


            </div>


            <div class="container-fluid">
                <div id="accordion">
                    <div class="card border-warning">
                        <div class="card-header bg-warning">
                            <a class="card-link" data-toggle="collapse" href="#collapseOne">FG Item Specification
                            </a>
                        </div>
                        <div id="collapseOne" class="collapse show" data-parent="#accordion">
                            <div class="card-body">
                                <%-- Card 1 Body --%>
                                <%-- Row1 --%>
                                <div class="row">
                                    <%--<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0" visible="false">
                                        <div class="form-group" visible="false">
                                            <%--                            <div class="col">--%>
                                            <%--<label for="txtID" class="col-form-label" visible="true">ID</label>--%>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <%--<asp:TextBox ID="textID" class="form-control .form-control-sm" placeholder="ID" runat="server" visible="true"/>--%>
                                            <%--                            </div>--%>
                                        <%--</div>
                                    </div>--%>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtdate" class="col-form-label">Date</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtdate" class="form-control" placeholder="Date" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtshift" class="col-form-label">Shift</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:TextBox ID="txtshift" class="form-control" placeholder="Shift" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtoperator" class="col-form-label">Operator</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtoperator" class="form-control" placeholder="Operator" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtsupervisor" class="col-form-label">Supervisor</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtsupervisor" class="form-control" placeholder="Supervisor" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtmachineno" class="col-form-label">M/C No</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:TextBox ID="txtmachineno" class="form-control .form-control-sm" placeholder="Machine Number" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                </div>

                                <%-- Row2 --%>
                                <div class="row">
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtLotNo" class="col-form-label">Lot No</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:TextBox ID="TextLotNo" class="form-control" placeholder="Lot No" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtLotQty" class="col-form-label">Lot Qty</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="TextLotQty" class="form-control" placeholder="Lot Qty" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtLotProd" class="col-form-label">Lot Prodution</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="TextLotProd" class="form-control" placeholder="Lot Produced" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtLotBal" class="col-form-label">Bal Lot</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="TextLotBal" class="form-control" placeholder="Balance Lots" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txttrollyno" class="col-form-label">Trolly No</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txttrollyno" class="form-control" placeholder="Trolly Number" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txttrollyqty" class="col-form-label">Trolly Qty</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txttrollyqty" class="form-control" placeholder="Trolly Quantity" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtnoofslits" class="col-form-label">No Of Slits</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:TextBox ID="txtnoofslits" class="form-control" placeholder="Number Of Slits" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    
                                </div>
                                 

                                <%-- Row3 --%>
                                <div class="row">
                                    

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtprodmtr" class="col-form-label">Prod Mtr</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="Textprodmtr" class="form-control" placeholder="Production(Min)" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtpcslength2" class="col-form-label">Pcs Length</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtpcslength2" class="form-control" placeholder="Pieces Length" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtpcswidth2" class="col-form-label">Pcs Width</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtpcswidth2" class="form-control" placeholder="Pieces Width" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                     <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtpcswt" class="col-form-label">Pcs Weight</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="Textpcswt" class="form-control" placeholder="Pieces Weight" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                </div>

                                <%-- Row 4 --%>
                                <div class="row">
                                    

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtrejQty" class="col-form-label">Rejected Qty</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="TextrejQty" class="form-control" placeholder="Qty" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                     <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtrejreason" class="col-form-label">Rejected Reason</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="Textrejreason" class="form-control" placeholder="Reason" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtprodwt" class="col-form-label">Produced Weight</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtprodwt" class="form-control" placeholder="Produced Weight(KG)" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtprodpcs" class="col-form-label">Produces Pcs</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtprodpcs" class="form-control" placeholder="Produced Pieces" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <%--<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1 invisible">
                                        <div class="form-group">--%>
                                            <%--                            <div class="col">--%>
                                            <%--<label for="txtcustno" class="col-form-label">Cust No</label>--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--<asp:TextBox ID="TextBox15" class="form-control" placeholder="Customer Number" runat="server" />--%>
                                            <%--                            </div>--%>
                                        <%--</div>
                                    </div>--%>

                                    <%--<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1 invisible">
                                        <div class="form-group">--%>
                                            <%--                            <div class="col">--%>
                                            <%--<label for="txtorderkg" class="col-form-label">Order(KG)</label>--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--<asp:TextBox ID="TextBox16" class="form-control" placeholder="Order in kg" runat="server" />--%>
                                            <%--                            </div>--%>
                                        <%--</div>
                                    </div>--%>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="card mt-1 border-warning">
                        <div class="card-header bg-warning">
                            <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">Production Output
                            </a>
                        </div>
                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                            <div class="card-body">
                                <%-- Card 2 --%>
                                <%-- Row1 --%>
                                <div class="row">
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtbalqty2" class="col-form-label">Bal Qty</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtbalqty2" class="form-control" placeholder="Balance Quantity" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    

                                    
                                    
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtmachinestop" class="col-form-label">M/C Stop</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtmachinestop" class="form-control" placeholder="Machine Stappage(Min)" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtstopreason" class="col-form-label">Stop Reason</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:TextBox ID="txtstopreason" class="form-control" placeholder="Stoppage Reason" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    

                                    
                                </div>

                                <%-- Row1 --%>
                                <div class="row">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtremarks" class="col-form-label">Remarks</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:TextBox ID="txtremarks" class="form-control" Rows="5" placeholder="Remarks" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txttotalmaterial" class="col-form-label">Tot No Of Material</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:TextBox ID="txttotalmaterial" class="form-control" placeholder="Material in meter" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txttotalpcs" class="col-form-label">Total Pcs</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txttotalpcs" class="form-control" placeholder="Total Pieces" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- End of card 2 --%>
                        </div>
                    </div>
                    <div class="row pt-3 mb-5">
                        <div class="col-3 pr-1">
                            <asp:Button ID="btnSave" runat="server" Text="SAVE" class="btn btn-outline-warning btn-md btn-block" />
                        </div>
                        <div class="col-3 pr-1">
                            <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" class="btn btn-outline-warning btn-md btn-block" OnClick="Btn_submit" />
                        </div>
                        <div class="col-3 pr-1">
                            <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" class="btn btn-outline-warning btn-md btn-block" />
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </body>
    </html>
</asp:Content>
