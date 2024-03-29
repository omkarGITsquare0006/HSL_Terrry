﻿<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmManageTrolley.aspx.cs" Inherits="HSL_Terrry.HomePages.frmManageTrolley" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="../content/bootstrap.min.css" rel="stylesheet" />
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
    </head>
    <body>
        <%-- Card For PO Close --%>
        <div class="container-fluid pr-0 pl-0">
            <div class="card border-warning mt-3">
                <div class="card-header bg-warning" style="height: 50px;">
                    <p class="font-weight-bold">MANAGE TROLLEY</p>
                </div>
                <div class="card-body">
                    <div class="form-row">

                        <div class="form-group col-md-5 p-2" hidden>
                            <%--                            <div class="col">--%>
                            <label for="txtPO_No" class="col-form-label">Select Screen</label>
                            <%--                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="PO No.:" />--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">--%>
                            <asp:DropDownList ID="ddlScreen" class="form-control" runat="server" AutoPostBack="true">
                                <%--<asp:ListItem Text="Select screen" Value=""></asp:ListItem>--%>
                                <asp:ListItem Text="LSM-Length Slitting Machine" Value="LSM"></asp:ListItem>
                                <asp:ListItem Text="LHM-Length Hemming Machine" Value="LHM"></asp:ListItem>
                                <asp:ListItem Text="ACCHM-Automatic Cross Cutting and Cross Hemming Machine" Value="ACCHM"></asp:ListItem>
                                <asp:ListItem Text="MCC-Manual Cross Cutting" Value="MCC"></asp:ListItem>
                                <asp:ListItem Text="MCH-Manual Cross Hemming" Value="MCH"></asp:ListItem>
                                <asp:ListItem Text="EM-Embroidery Machine" Value="EM"></asp:ListItem>
                                <asp:ListItem Text="PP-Poly Packing" Value="PP"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group col-md-4 p-2">
                            <label for="txtTrolleyNum" class="col-form-label">Trolley Number:</label><span class="small text-danger font-italic">(upto 15 char)</span>
                            <asp:TextBox ID="txtTrolleyNum" CssClass="form-control" runat="server" MaxLength="15"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <label for="btnView" class="col-form-label invisible">Machine Name:</label><br />
                            <button type="button" id="btnView" class="btn btn-light p-0" data-toggle="modal" data-target="#exampleModal"><span class="small">view or manage trolley's</span></button>
                        </div>

                        <div class="form-group col-md-4 p-2">
                            <label for="txtTrTareWt" class="col-form-label">Tare Weight:</label><span class="small text-danger font-italic">(upto 10 char)</span>
                            <asp:TextBox ID="txtTrTareWt" class="form-control" placeholder="Tare Weight" runat="server" MaxLength="10" />
                        </div>

                        <div class="form-group col-md-2 p-2">
                            <%--                            <div class="col">--%>
                            <label for="btnClose" class="col-form-label invisible">Lot Balance</label>
                            <%--                            </div>--%>
                            <%-- OnClick="btnClose_Click"                           <div class="col">--%>
                            <asp:Button runat="server" OnClientClick="return checkEmpty();" class="btn btn-success btn-block" ID="btnAdd" Text="Add" OnClick="btnAdd_Click"></asp:Button>
                            <%--                            </div>--%>
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </div>

        <%-- Modal --%>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Trolley Master</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body table-responsive modal-dialog-scrollable" style="max-height:400px;">
                        <asp:ListView ID="ListView1" runat="server">
                            <LayoutTemplate>
                                <table class="table table-bordered table-striped">
                                    <tr>
                                        <th>ID</th>
                                        <th>Operation Name</th>
                                        <th>Trolley Number</th>
                                        <th>Tare Weight</th>
                                        <th>Active Status</th>
                                    </tr>
                                    <tbody>
                                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("ID")%>'></asp:Label></td>
                                    <td><%# Eval("Operation")%></td>
                                    <td><%# Eval("Data_Dispaly")%></td>
                                    <td><%# Eval("Data_Desc")%></td>
                                    <td>
                                        <asp:CheckBox ID="chkActive" runat="server" Checked='<%#Convert.ToBoolean(Eval("Active"))%>' /></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" runat="server" class="btn btn-primary" onserverclick="btnUpdate_click">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function checkEmpty() {
                var code = document.getElementById('<%=txtTrolleyNum.ClientID %>').value;
                var desc = document.getElementById('<%=txtTrTareWt.ClientID %>').value;
                if (code == "" || desc == "") {
                    alert("Fill all fields!");
                    return false;
                } else
                    return true;
            }
        </script>

    </body>
    </html>

</asp:Content>
