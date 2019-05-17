﻿<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmPolyPack.aspx.cs" Inherits="HSL_Terrry.HomePages.frmPolyPack" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>

    <html lang="en">
    <head>
        <title>HIMATSINGKA</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <div class="row justify-content-left">
                <h5 class="mt-xl-3">POLY PACKING REPORT</h5>

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
        <%--        <div class="row pr-0">--%>
        <%--            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">--%>


        <div class="form-group col p-2">
            <%--                            <div class="col">--%>
            <label for="txtPO_No" class="col-form-label">PO No:</label><span class="font-weight-bold text-danger">*</span>
            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
            <%--                            </div>--%>
            <%--                            <div class="col">--%>
            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
            <asp:DropDownList ID="txtPO_No" class="form-control" runat="server" OnSelectedIndexChanged="LoadPODetails_OnSelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
            <%--                            </div>--%>
        </div>
        <%--</div>--%>

        <div class="container-fluid">
            <div id="accordiontop">
                <div class="card border-warning">
                    <div class="card-header bg-warning" data-toggle="collapse" href="#collapseOne">
                        <a class="card-link" data-toggle="collapse" href="#collapseOne">PO Details
                        </a>
                    </div>
                    <div id="collapseOne" class="collapse">
                        <div class="card-body">
                            <div class="form-row pr-1">
                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtitemno" class="col-form-label">Material Code</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtitemno" class="form-control" ReadOnly="true" placeholder="Material Code" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtitemdesc" class="col-form-label">Material Description</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtitemdesc" class="form-control" ReadOnly="true" placeholder="Material Description" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtcustno" class="col-form-label">Customer</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtcustno" class="form-control" ReadOnly="true" placeholder="Customer" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtgsm" class="col-form-label">GSM</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtgsm" class="form-control" ReadOnly="true" placeholder="GSM" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--                    </div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtpcode" class="col-form-label">Program Code</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtpcode" class="form-control" ReadOnly="true" placeholder="Program Code" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>
                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtpname" class="col-form-label">Program Name</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtpname" class="form-control" ReadOnly="true" placeholder="Program Name" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtshade" class="col-form-label">Color</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtshade" class="form-control" ReadOnly="true" placeholder="Color" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtproduct" class="col-form-label">Product</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtproduct" class="form-control" ReadOnly="true" placeholder="Product" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtnoofslits" class="col-form-label">No Of Slits</label>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:TextBox ID="txtnoofslits" class="form-control" ReadOnly="true" placeholder="Number Of Slits" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtpcslength2" class="col-form-label">Pcs Length(Cms)</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtpcslength2" class="form-control" ReadOnly="true" placeholder="Pieces Length" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtpcswidth2" class="col-form-label">Pcs Width(Cms)</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtpcswidth2" class="form-control" ReadOnly="true" placeholder="Pieces Width" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2" hidden>
                                    <%--                            <div class="col">--%>
                                    <label for="txtsize" class="col-form-label">Size(CMS)</label>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:TextBox ID="txtsize" class="form-control" ReadOnly="true" placeholder="Size(CMS)" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--                    </div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtszdesc" class="col-form-label">Size Description</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtszdesc" class="form-control" ReadOnly="true" placeholder="Size Description" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--                    </div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtorderqty" class="col-form-label">Order Qty(Pcs)</label>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:TextBox ID="txtorderqty" class="form-control" ReadOnly="true" placeholder="Order Qty" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtorderkg" class="col-form-label">Order(KG)</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtorderkg" class="form-control" ReadOnly="true" placeholder="Order in kg" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtpcswt" class="col-form-label">Per Pcs Weight(GMS)</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtpcswt" class="form-control" ReadOnly="true" placeholder="Per Pcs Weight" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--                    </div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtpcsperkg" class="col-form-label">Pieces/KG</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtpcsperkg" class="form-control" ReadOnly="true" placeholder="Pieces/KG" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtprocessedqty" class="col-form-label">Confirmed Qty</label>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:TextBox ID="txtprocessedqty" class="form-control" ReadOnly="true" placeholder="Confirmed Quantity" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--                    </div>--%>
                                <%--</div>--%>

                                <%--                <div class="row mt-1">--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtopenorderqty" class="col-form-label">Open Order Qty</label>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:TextBox ID="txtopenorderqty" class="form-control" ReadOnly="true" placeholder="Open Order Quantity" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                    <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txttotalconfirm" class="col-form-label">Total confirmed Qty</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txttotalconfirm" class="form-control" ReadOnly="true" placeholder="Total Confirmed" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div id="accordion">
                <div class="card mt-1 border-warning">
                    <div class="card-header bg-warning" data-toggle="collapse" href="#collapseTwo">
                        <a class="card-link" data-toggle="collapse" href="#collapseTwo">Finished Goods Details
                        </a>
                    </div>
                    <div id="collapseTwo" class="collapse show">
                        <div class="card-body">
                            <%-- Card 1 Body --%>
                            <%-- Row1 --%>
                            <div class="form-row pr-1">
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
                                <%--                            <div class="row">--%>
                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtdate" class="col-form-label">Date</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtdate" AutoComplete="Off" class="form-control" placeholder="Date" runat="server" />
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:CalendarExtender ID="CalendarExtender1" BehaviorID="calendar1" OnClientDateSelectionChanged="dateselect" TargetControlID="txtdate" runat="server"></asp:CalendarExtender>
                                    <%--                            </div>--%>
                                </div>
                                <%--                                </div>--%>
                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
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
                                <%--                                </div>--%>


                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtoperator" class="col-form-label">Operator</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtoperator" AutoComplete="Off" class="form-control" placeholder="Operator" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtsupervisor" class="col-form-label">Supervisor</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtsupervisor" AutoComplete="Off" class="form-control" placeholder="Supervisor" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%-- Row2 --%>
                                <%--                            <div class="row">--%>
                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
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
                                <%--</div>--%>

                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtnoofpieces" class="col-form-label">No. of pieces in pack</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtnoofpieces" AutoComplete="Off" oninput="return Calculate();" class="form-control" placeholder="Number of piece in pack" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-1">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtnoofpp" class="col-form-label">No. of Poly Pack</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtnoofpp" AutoComplete="Off" oninput="return Calculate();" TextMode="Number" class="form-control" placeholder="Number of poly pack" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtprodqty" class="col-form-label">Production Quantity</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtprodqty" AutoComplete="Off" class="form-control" TextMode="Number" oninput="return Calculate();" placeholder="Production Quantity" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtmachinestop" class="col-form-label">M/C Stoppage(Min)</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtmachinestop" AutoComplete="Off" class="form-control" placeholder="Machine Stoppage(Min)" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%--</div>--%>


                                <%-- Row3 --%>
                                <%--                            <div class="row">--%>

                                <%--                                <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtstopreason" class="col-form-label">Stop Reason</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:TextBox ID="txtstopreason" AutoComplete="Off" class="form-control" placeholder="Stoppage Reason" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>

                                <%-- Row 4 --%>
                                <%--                            <div class="row">--%>
                                <%--                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 pr-0">--%>
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtremarks" class="col-form-label">Remarks</label>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:TextBox ID="txtremarks" AutoComplete="Off" class="form-control" Rows="5" placeholder="Remarks" runat="server" />
                                    <%--                            </div>--%>
                                </div>
                                <%--</div>--%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row pt-3 mb-5">
                    <%--<div id="op1" class="col-3 pr-1">
                            <asp:Button ID="btnSave" runat="server" Text="SAVE" class="btn btn-outline-warning btn-md btn-block" />
                        </div>--%>
                    <div id="op2" class="col-md-3 mb-1 pr-5">
                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" class="btn btn-outline-warning btn-md btn-block" OnClick="Btn_submit" />
                    </div>
                    <%--OnClientClick="javascript:return Validate();"--%>
                    <div id="sup1" class="col-md-3 mb-1 pr-5">
                        <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" class="btn btn-outline-success btn-md btn-block" OnClick="btn_Update" />
                    </div>
                    <%--<div id="sup2" class="col-3 pr-1">
                            <asp:Button class="btn btn-outline-danger btn-block" runat="server" ID="btnClose" Text="Close"></asp:Button>
                        </div>--%>
                    <div id="sup0" class="col-md-3 mb-1 pr-5">
                        <asp:Button class="btn btn btn-outline-primary btn-block" runat="server" ID="btnEdit" Text="Edit" OnClick="btnEdit_Click"></asp:Button>
                    </div>

                </div>
            </div>
        </div>
        <%--</div>--%>

        <script type="text/javascript">
            function Calculate() {
                var prodqty = document.getElementById('<%=txtprodqty.ClientID %>');
                var noofpieces = parseFloat(document.getElementById('<%=txtnoofpieces.ClientID %>').value);
                var noofpp = parseFloat(document.getElementById('<%=txtnoofpp.ClientID %>').value);
                //prodpcs.value = (prodmtr / (pcslen / 100)) * noofslit;
                prodqty.value = (noofpieces * noofpp);
            }
        </script>
    </body>
    </html>
</asp:Content>