<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmEmbroideryMachine.aspx.cs" Inherits="HSL_Terrry.HomePages.frmEmbroideryMachine" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>

    <html>
    <head>
        <title>HIMATSINGKA</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%--dfg--%>
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
        <script type="text/javascript" src="../ValidationScript.js"></script>
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
        <link rel="stylesheet" href="../jquery-ui.css" />
        <script src="../jquery-ui.js"></script>
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
<%--                alert('<%= "session is "+ HttpContext.Current.Session["RoleID"] %>');--%>
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
                <h5 class="mt-xl-3">EMBROIDERY MACHINE ENTRY</h5>
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
        <div class="form-group col p-2">
            <%--                            <div class="col">--%>
            <label for="txtPO_No" class="col-form-label">PO No:</label><span class="font-weight-bold text-danger">*</span>
            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
            <%--                            </div>--%>
            <%--                            <div class="col">--%>
            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
            <asp:DropDownList ID="txtPO_No1" class="form-control" runat="server" OnSelectedIndexChanged="LoadPODetails_OnSelectedIndexChanged"
                AutoPostBack="true" Visible="false">
            </asp:DropDownList>
            <div class="row">
                <asp:TextBox ID="txtPO_No" CssClass="form-control col-md-3 ml-2" runat="server"></asp:TextBox>
                <button runat="server" id="btnGetdata" class="btn btn-primary ml-2" onserverclick="LoadPODetails_OnSelectedIndexChanged">
                    <span id="loading" runat="server" class="spinner-border spinner-border-sm" hidden></span>Get Data
                </button>
            </div>
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
                        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">Production Output
                        </a>
                    </div>
                    <div id="collapseTwo" class="collapse show">
                        <div class="card-body">
                            <%-- Card 2 --%>
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
                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtdate" class="col-form-label">Date</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtdate" AutoComplete="Off" class="form-control" placeholder="Date" runat="server" />
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:CalendarExtender ID="CalendarExtender1" BehaviorID="calendar1" OnClientDateSelectionChanged="dateselect" TargetControlID="txtdate" runat="server"></asp:CalendarExtender>
                                    <%--                            </div>--%>
                                </div>

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

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtoperator" class="col-form-label">Operator</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtoperator" AutoComplete="Off" class="form-control" placeholder="Operator" runat="server" />
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtsupervisor" class="col-form-label">Supervisor</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:DropDownList ID="txtsupervisor" class="form-control dropdown-toggle" runat="server" AutoPostBack="false" aria-haspopup="true" aria-expanded="false">
                                        <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtmachineno" class="col-form-label">M/C No</label>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:DropDownList ID="ddMachineNo" class="form-control dropdown-toggle" runat="server" AutoPostBack="false" aria-haspopup="true" aria-expanded="false">
                                    </asp:DropDownList>
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txttrollyno" class="col-form-label">Trolley No</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:DropDownList ID="txttrollyno" class="form-control dropdown-toggle" runat="server" AutoPostBack="false" aria-haspopup="true" aria-expanded="false">
                                    </asp:DropDownList>
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-6 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txttrollyqty" class="col-form-label">Trolley Qty(Pcs)</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txttrollyqty" AutoComplete="Off" TextMode="Number" class="form-control" placeholder="Trolley Quantity" runat="server" />
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtpcsperround" class="col-form-label">Pcs/Round</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtpcsperround" AutoComplete="Off" class="form-control" TextMode="Number" oninput="return Calculate();" placeholder="Pcs per Round" runat="server" />
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtnoofrounds" class="col-form-label">No of Rounds</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtnoofrounds" AutoComplete="Off" class="form-control" TextMode="Number" oninput="return Calculate();" placeholder="No of Rounds" runat="server" />
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtprodpcs" class="col-form-label">Produced Pcs</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtprodpcs" class="form-control" placeholder="Produced Pieces" runat="server" />
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtrejQty" class="col-form-label">Rejected Qty(No's)</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="TextrejQty" AutoComplete="Off" TextMode="Number" class="form-control" placeholder="Qty" runat="server" />
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtprodwt" class="col-form-label">Produced Weight(Kgs)</label>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtprodwt" class="form-control" placeholder="Produced Weight" runat="server" />
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtrejreason" class="col-form-label">Rejected Reason</label><span class="font-weight-bold text-danger">*</span><a class="ml-2 small text-primary" id="rejid" data-toggle="modal" data-target="#exampleModal">Code Descriptions</a>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:DropDownList ID="Textrejreason" class="form-control dropdown-toggle" runat="server" AutoPostBack="false" aria-haspopup="true" aria-expanded="false">
                                    </asp:DropDownList>
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtmachinestop" class="col-form-label">M/C Stoppage(Min)</label><span class="font-weight-bold text-danger">*</span>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <asp:TextBox ID="txtmachinestop" AutoComplete="Off" class="form-control" placeholder="Machine Stoppage(Min)" runat="server" />
                                    <%--                            </div>--%>
                                </div>

                                <div class="form-group col-md-3 p-2">
                                    <%--                            <div class="col">--%>
                                    <label for="txtstopreason" class="col-form-label">Stop Reason</label><span class="font-weight-bold text-danger">*</span><a class="ml-2 small text-primary" id="stopid" data-toggle="modal" data-target="#exampleModal">Code Descriptions</a>
                                    <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                                    <%--                            </div>--%>
                                    <%--                            <div class="col">--%>
                                    <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                                    <asp:DropDownList ID="txtstopreason" class="form-control dropdown-toggle" runat="server" AutoPostBack="false" aria-haspopup="true" aria-expanded="false">
                                    </asp:DropDownList>
                                    <%--                            </div>--%>
                                </div>

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

                            </div>
                        </div>
                    </div>
                </div>
                <%-- End of card 2 --%>
            </div>
        </div>
        <div class="row pt-3 mb-5 p-1">
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

        <%-- Modal --%>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="rejList">
                            <asp:ListView ID="ListView1" runat="server">
                                <LayoutTemplate>
                                    <table class="table table-bordered table-striped">
                                        <tr>
                                            <th>Reject Code</th>
                                            <th>Code Description</th>
                                        </tr>
                                        <tbody>
                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Data_Dispaly")%></td>
                                        <td><%# Eval("Data_Desc")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div id="stopList">
                            <asp:ListView ID="ListView2" runat="server">
                                <LayoutTemplate>
                                    <table class="table table-bordered table-striped">
                                        <tr>
                                            <th>Stop Code</th>
                                            <th>Code Description</th>
                                        </tr>
                                        <tbody>
                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Data_Dispaly")%></td>
                                        <td><%# Eval("Data_Desc")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="myAlert-top alert alert-danger hide">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Warning!</strong><span id="errmsg"></span>
        </div>

        <script type="text/javascript">
            function Calculate() {
                var oqty = parseFloat(document.getElementById('<%=txtopenorderqty.ClientID %>').value);

                var pcslen = parseFloat(document.getElementById('<%=txtpcslength2.ClientID %>').value / 100);
                var noofslit = parseFloat(document.getElementById('<%=txtnoofslits.ClientID %>').value) + 1;
                var prodpcs = document.getElementById('<%=txtprodpcs.ClientID %>');
                var perpcsweight = parseFloat(document.getElementById('<%=txtpcswt.ClientID %>').value);
                var prodweiht = document.getElementById('<%=txtprodwt.ClientID %>');
                var pcsperround = parseInt(document.getElementById('<%=txtpcsperround.ClientID %>').value);
                var noofrounds = parseInt(document.getElementById('<%=txtnoofrounds.ClientID %>').value);
                //prodpcs.value = (prodmtr / (pcslen / 100)) * noofslit;
                prodpcs.value = pcsperround * noofrounds;
                prodweiht.value = ((perpcsweight * prodpcs.value) / 1000);
                //alert('prod pcs' + prodpcs.value + ' ' + 'pr wt' + prodweiht.value);
                if (prodpcs.value > oqty) {
                    prodpcs.style.borderColor = "red";
                    $(".myAlert-top").show();
                    $("#errmsg").text(" Produced quantity is exceeding order quantity!!");
                    setTimeout(function () {
                        $(".myAlert-top").hide();
                    }, 5000);
                } else
                    prodpcs.style.borderColor = "green";

            }

            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    $(".myAlert-top").show();
                    $("#errmsg").text(" Special charecters and Alphabets are not allowed");
                    setTimeout(function () {
                        $(".myAlert-top").hide();
                    }, 5000);
                    return false;
                }
                return true;
            }

            function isDecimalKey(evt) {
                if (!(evt.keyCode == 46 || (evt.keyCode >= 48 && evt.keyCode <= 57))) {
                    //alert(prodmtr.id.toString());
                    $(".myAlert-top").show();
                    $("#errmsg").text(" Alphabets are not allowed");
                    setTimeout(function () {
                        $(".myAlert-top").hide();
                    }, 2000);
                    return false;
                }
                var parts = evt.srcElement.value.split('.');
                if (parts.length > 2) return false;
                if (evt.keyCode == 46) return (parts.length == 1);
                if (parts.length == 2 && parts[1].length >= 2) {
                    $(".myAlert-top").show();
                    $("#errmsg").text(" Accept two decimal points only");
                    setTimeout(function () {
                        $(".myAlert-top").hide();
                    }, 2000);
                    return false;
                }
            }
        </script>
        <script type="text/javascript">  
            $(document).ready(function () {
                $("#<%=txtPO_No.ClientID%>").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            url: "frmEmbroideryMachine.aspx/GetPoNum",
                            method: "post",
                            contentType: "application/json;charset=utf-8",
                            data: JSON.stringify({ term: request.term }),
                            <%--data: "{'term':'" + $("#<%=txtPO.ClientID%>").val() + "'}",--%>
                            dataType: 'json',
                            success: function (data) {
                                console.log("data is : " + data)
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

        <script>
            $(document).ready(function () {
                $("#rejid").click(function () {
                    $("#stopList").hide();
                    $("#rejList").show();
                });

                $("#stopid").click(function () {
                    $("#rejList").hide();
                    $("#stopList").show();
                });
            });
        </script>
    </body>

    </html>
</asp:Content>
