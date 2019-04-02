<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmLengthSlittingMachine.aspx.cs" Inherits="HSL_Terrry.HomePages.frmLengthSlittingMachine" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>

    <html lang="en">
    <head>
        <title>HIMATSINGKA</title>

        <%--dfg--%>
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />

        <script type="text/javascript">
            $(document).ready(function () {
                if ('<%= HttpContext.Current.Session["RoleId"] %>' == "3") {
                    $("#sup0").hide();
                    $("#sup1").hide();
                    $("#sup2").hide();
                    //alert('session is true');
                } else {
                    $("#op1").hide();
                    $("#op2").hide();
                    //alert('session is false');
                }
                //alert('<%= "session is "+ HttpContext.Current.Session["RoleID"] %>');
            });
        </script>
        <script type="text/javascript">
            function dateselect(ev) {
                var calendarBehavior1 = $find("calendar1");
                var d = calendarBehavior1._selectedDate;
                var now = new Date();
                calendarBehavior1.get_element().value = d.format("yyyy-MM-dd") + " " + now.format("HH:mm:ss")
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-xl-5">
                <h3 class="mt-xl-3">Length Slitting Machine</h3>

            </div>
        </div>
        <%--<div>
        <asp:GridView ID="gvBeamList" runat="server" DataKeyNames="PO_No" AutoGenerateColumns="false"
                AllowSorting="true" CssClass="Gridview" HeaderStyle-BackColor="orange" ForeColor="white"
                CellPadding="5" HeaderStyle-Font-Bold="true"
                HeaderStyle-Height="30px" HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="20px"
                HeaderStyle-Width="100px" Style="text-align: center;">
                <RowStyle ForeColor="Black" BackColor="#E5E4E4" HorizontalAlign="Center" Height="27px">
                </RowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Po Number" visible="true">
                        <HeaderStyle CssClass="small" Width="15%" />
                        <ItemTemplate>
                            <asp:Label ID="lblPONo" runat="server" Text='<%#Eval("PO_No") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
            </asp:GridView>
            </div>--%>
        <br />
        <div class="row pr-0">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="row">
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">

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
                            <label for="txtcustno" class="col-form-label">Customer Number</label>
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


                <div class="row mt-1">
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
                            <label for="txtitemno" class="col-form-label">Product Code</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtitemno" class="form-control" ReadOnly="true" placeholder="Product Code" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtitemdesc" class="col-form-label">Product Description</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtitemdesc" class="form-control" ReadOnly="true" placeholder="Product Description" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtpcswt" class="col-form-label">Pieces/Wt</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtpcswt" class="form-control" ReadOnly="true" placeholder="Pieces/Weight" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>



                <div class="row mt-1">

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtshade" class="col-form-label">Color</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtshade" class="form-control" ReadOnly="true" placeholder="Color" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtcolordesc" class="col-form-label">Color Description</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtcolordesc" class="form-control" ReadOnly="true" placeholder="Color Description" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtsize" class="col-form-label">Size</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:TextBox ID="txtsize" class="form-control" ReadOnly="true" placeholder="Size" runat="server" />
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
                            <label for="txtorderuom" class="col-form-label">Program Description</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtorderuom" class="form-control" ReadOnly="true" placeholder="Program Description" runat="server" />
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
                            <label for="txtprocessedqty" class="col-form-label">Processed Qty</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:TextBox ID="txtprocessedqty" class="form-control" ReadOnly="true" placeholder="Processed Quantity" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtbalqty" class="col-form-label">Balance Qty</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtbalqty" class="form-control" ReadOnly="true" placeholder="Balance Quantity" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>

                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1" hidden>
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtextra" class="col-form-label">Extra Field</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtUdf1" class="form-control" ReadOnly="true" placeholder="Extra Field" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1" hidden>
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtextra" class="col-form-label">Extra Field</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtUdf2" class="form-control" ReadOnly="true" placeholder="Extra Field" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1" hidden>
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtextra" class="col-form-label">Extra Field</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtUdf3" class="form-control" ReadOnly="true" placeholder="Extra Field" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1" hidden>
                        <div class="form-group">
                            <%--                            <div class="col">--%>
                            <label for="txtstatus" class="col-form-label">Status</label>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <asp:TextBox ID="txtstatus" class="form-control" ReadOnly="true" placeholder="Status" runat="server" />
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>


            </div>


            <div class="container-fluid">
                <div id="accordion">
                    <div class="card border-warning">
                        <div class="card-header bg-warning" data-toggle="collapse" href="#collapseOne">
                            <a class="card-link" data-toggle="collapse" href="#collapseOne">Finished Goods Details
                            </a>
                        </div>
                        <div id="collapseOne" class="collapse">
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
                                    <asp:TextBox ID="textID" class="form-control .form-control-sm" placeholder="ID" runat="server" Visible="false" />
                                    <%--                            </div>--%>
                                    <%--</div>
                                    </div>--%>
                                </div>
                                <div class="row">
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtdate" class="col-form-label">Date</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtdate" class="form-control" placeholder="Date" runat="server" />
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:CalendarExtender ID="CalendarExtender1" BehaviorID="calendar1" OnClientDateSelectionChanged="dateselect" TargetControlID="txtdate" runat="server"></asp:CalendarExtender>
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
                                            <asp:DropDownList ID="ddShift" class="form-control dropdown-toggle" runat="server" AutoPostBack="false" aria-haspopup="true" aria-expanded="false">
                                                <asp:ListItem Text="1st Shift" Value="1st Shift"></asp:ListItem>
                                                <asp:ListItem Text="2nd Shift" Value="2nd Shift"></asp:ListItem>
                                                <asp:ListItem Text="3rd Shift" Value="3rd Shift"></asp:ListItem>
                                            </asp:DropDownList>
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
                                </div>
                                <%-- Row2 --%>
                                <div class="row">
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtmachineno" class="col-form-label">M/C No</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:DropDownList ID="ddMachineNo" class="form-control dropdown-toggle" runat="server" AutoPostBack="false" aria-haspopup="true" aria-expanded="false">
                                                <asp:ListItem Text="Machine 1" Value="Machine 1"></asp:ListItem>
                                                <asp:ListItem Text="Machine 2" Value="Machine 2"></asp:ListItem>
                                            </asp:DropDownList>
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtLotNo" class="col-form-label">Lot No</label>
                                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                            <asp:DropDownList ID="txtLotNo" class="form-control dropdown-toggle" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddLotNo_OnSelectedIndexChanged">
                                            </asp:DropDownList>
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtLotQty" class="col-form-label">Lot Qty</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="TextLotQty" class="form-control" ReadOnly="true" placeholder="Lot Qty" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtLotBal" class="col-form-label">Lot Balance</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="TextLotBal" class="form-control" ReadOnly="true" placeholder="Lot Balance" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="TextLotProd" class="col-form-label">Lot Produced</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="TextLotProd" class="form-control" ReadOnly="true" placeholder="Lot Produced" runat="server" />
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


                                <%-- Row 4 --%>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-1 border-warning">
                        <div class="card-header bg-warning" data-toggle="collapse" href="#collapseTwo">
                            <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">Production Output
                            </a>
                        </div>
                        <div id="collapseTwo" class="collapse">
                            <div class="card-body">
                                <%-- Card 2 --%>
                                <%-- Row1 --%>
                                <div class="row">

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txttrollyno" class="col-form-label">Trolley No</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txttrollyno" class="form-control" placeholder="Trolley Number" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txttrollyqty" class="col-form-label">Trolley Qty(Pcs)</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txttrollyqty" class="form-control" placeholder="Trolley Quantity" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtprodpcs" class="col-form-label">Produced Pcs</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtprodpcs" class="form-control" placeholder="Produced Pieces" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtbalqty2" class="col-form-label">Trolley Balance Qty</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtbalqty2" class="form-control" placeholder="Balance Quantity" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtpcswidth2" class="col-form-label">Pcs Width(Cms)</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtpcswidth2" class="form-control" placeholder="Pieces Width" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtpcswt" class="col-form-label">Pcs Weight(Gms)</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="Textpcswt" class="form-control" placeholder="Pieces Weight" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtrejQty" class="col-form-label">Rejected Qty(No's)</label>
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
                                <div class="row">

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtprodwt" class="col-form-label">Produced Weight(Kgs)</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtprodwt" class="form-control" placeholder="Produced Weight(KG)" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtprodmtr" class="col-form-label">Production(Mtr)</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="Textprodmtr" class="form-control" placeholder="Production(Mtr)" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtpcslength2" class="col-form-label">Pcs Length(Cms)</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtpcslength2" class="form-control" placeholder="Pieces Length" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                            <label for="txtmachinestop" class="col-form-label">M/C Stoppage(Min)</label>
                                            <%--                            </div>--%>
                                            <%--                            <div class="col">--%>
                                            <asp:TextBox ID="txtmachinestop" class="form-control" placeholder="Machine Stoppage(Min)" runat="server" />
                                            <%--                            </div>--%>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
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
                                    <%-- <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">
                                        <div class="form-group">--%>
                                    <%--                            <div class="col">--%>
                                    <%--<label for="txttotalmaterial" class="col-form-label">Tot No Of Material</label>--%>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <%--  <asp:TextBox ID="txttotalmaterial" class="form-control" placeholder="Material in meter" runat="server" />--%>
                                    <%--                            </div>--%>
                                    <%--</div>
                                    </div>--%>
                                    <%--<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">
                                        <div class="form-group">
                                            <%--                            <div class="col">--%>
                                    <%-- <label for="txttotalpcs" class="col-form-label">Total Pcs</label>--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--<asp:TextBox ID="txttotalpcs" class="form-control" placeholder="Total Pieces" runat="server" />--%>
                                    <%--                            </div>--%>
                                    <%--</div>
                                    </div>--%>
                                </div>
                            </div>
                            <%-- End of card 2 --%>
                        </div>
                    </div>
                    <div class="row pt-3 mb-5">
                        <%--<div id="op1" class="col-3 pr-1">
                            <asp:Button ID="btnSave" runat="server" Text="SAVE" class="btn btn-outline-warning btn-md btn-block" />
                        </div>--%>
                        <div id="op2" class="col-3 pr-1">
                            <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" class="btn btn-outline-warning btn-md btn-block" OnClick="Btn_submit" />
                        </div>
                        <div id="sup1" class="col-3 pr-1">
                            <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" class="btn btn-outline-success btn-md btn-block" OnClick="btn_Update" />
                        </div>
                        <div id="sup2" class="col-3 pr-1">
                            <asp:Button class="btn btn-outline-danger btn-block" runat="server" ID="btnClose" Text="Close"></asp:Button>
                        </div>
                        <div id="sup0" class="col-3 pr-1">
                            <asp:Button class="btn btn btn-outline-primary btn-block" runat="server" ID="btnEdit" Text="Edit" OnClick="btnEdit_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </body>
    </html>
</asp:Content>
