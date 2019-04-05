<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmEmbroideryMachineSup.aspx.cs" Inherits="HSL_Terrry.HomePages.frmEmbroideryMachineSup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>JavaScript - read JSON from URL</title>
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    </head>

    <body>
        <%--<div class="container">
            <h1 class="mt-xl-5">List of data</h1>
            <ul class="list-group" id="lists">
                
            </ul>
        </div>--%>

        <%--<script>
            $(document).ready(function () {
                $.getJSON('http://localhost:8081/hplant/englab/tranformer_etp/get/all', function (data) {
                    var text = '';
                    $.each(data, function (key, value) {
                        text += '<li class="list-group-item list-group-item-warning">';
                        text += '<div class="row">';
                        text += '<div class="col">';
                        text += '<a href="frmLengthSlittingMachine.aspx">' + this.dateTime + '</a>';
                        text += '</div>';
                        text += '<div class="col">';
                        text += '<a>' + this.operatorName + '</a>';
                        text += '</div>';
                        text += '<div class="col">';
                        text += '<a>' + this.remarks + '</a>';
                        text += '</div>';
                        text += '</div>';
                        text += '</li>';
                    });
                    $('#lists').append(text);
                });
            });
        </script>--%>

        <%--Lot Manage--%>
        <div class="mt-xl-5"></div>
        <br />
        <div class="container-fluid mt-lg-5">
            <div class="card border-warning">
                <div class="card-header bg-warning" style="height: 50px;">
                    <p>LOT SHORT CLOSE</p>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 pr-1">
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
                        <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 pr-0">
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

                        <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 pr-0">
                            <div class="form-group">
                                <%--                            <div class="col">--%>
                                <label for="txtLotQty" class="col-form-label">Lot Qty</label>
                                <%--                            </div>--%>
                                <%--                            <div class="col">--%>
                                <asp:TextBox ID="TextLotQty" class="form-control" ReadOnly="true" placeholder="Lot Qty" runat="server" />
                                <%--                            </div>--%>
                            </div>
                        </div>

                        <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 pr-0">
                            <div class="form-group">
                                <%--                            <div class="col">--%>
                                <label for="TextLotProd" class="col-form-label">Lot Produced</label>
                                <%--                            </div>--%>
                                <%--                            <div class="col">--%>
                                <asp:TextBox ID="TextLotProd" class="form-control" ReadOnly="true" placeholder="Lot Produced" runat="server" />
                                <%--                            </div>--%>
                            </div>
                        </div>

                        <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 pr-1">
                            <div class="form-group">
                                <%--                            <div class="col">--%>
                                <label for="txtLotBal" class="col-form-label">Lot Balance</label>
                                <%--                            </div>--%>
                                <%--                            <div class="col">--%>
                                <asp:TextBox ID="TextLotBal" class="form-control" ReadOnly="true" placeholder="Lot Balance" runat="server" />
                                <%--                            </div>--%>
                            </div>
                        </div>

                        <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 pr-1">
                            <div class="form-group">
                                <%--                            <div class="col">--%>
                                <label for="txtLotBal" class="col-form-label invisible">Lot Balance</label>
                                <%--                            </div>--%>
                                <%--                            <div class="col">--%>
                                <asp:Button class="btn btn-outline-danger btn-block" runat="server" ID="btnClose" OnClick="btnClose_Click" Text="Short-Close"></asp:Button>
                                <%--                            </div>--%>
                            </div>
                        </div>
                        <br />
                        

                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="container-fluid">
            <div class="card border-warning">
                <div class="card-header bg-warning" style="height: 50px;">
                    <p>EMBROIDERY REPORT</p>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvBeamList" runat="server" DataKeyNames="ID" AutoGenerateColumns="false"
                        AllowSorting="true" CssClass="table table-striped w-auto" ForeColor="white"
                        OnRowCancelingEdit="gvDetails_RowCancelingEdit" OnRowEditing="gvDetails_RowEditing"
                        OnRowUpdating="gvDetails_RowUpdating" CellPadding="5" HeaderStyle-Font-Bold="true"
                        HeaderStyle-Height="30px" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="10px"
                        HeaderStyle-Width="100px" >

                        <HeaderStyle Font-Bold="True" Font-Size="20px" ForeColor="Black" Height="30px" Width="100px" HorizontalAlign="Center"></HeaderStyle>

                        <RowStyle ForeColor="Black" CssClass="table-hover" BackColor="#E5E4E4" HorizontalAlign="Center" Height="1px" Font-Size="Small"></RowStyle>
                        <Columns>
                            <asp:TemplateField HeaderText="Transaction #">
                                <HeaderStyle CssClass="small" Width="15%" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkID" runat="server" Text='<%#Eval("ID") %>' PostBackUrl='<%# String.Format("frmEmbroideryMachine.aspx?ID={0}", Eval("ID"))%>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Po Number">
                                <HeaderStyle CssClass="small" Width="15%" />
                                <ItemTemplate>
                                    <asp:Label ID="lblPONo" runat="server" Text='<%#Eval("PO_No") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Date">
                                <HeaderStyle CssClass="small" Width="18%" />
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Machine No">
                                <HeaderStyle CssClass="small" Width="15%" />
                                <ItemTemplate>
                                    <asp:Label ID="lblMachineNo" runat="server" Text='<%#Eval("Machine_No") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Shift">
                                <HeaderStyle CssClass="small" Width="12%" />
                                <ItemTemplate>
                                    <asp:Label ID="lblShift" runat="server" Text='<%#Eval("Shift") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Lot No">
                                <HeaderStyle CssClass="small" Width="15%" />
                                <ItemTemplate>
                                    <asp:Label ID="lblLotNo" runat="server" Text='<%#Eval("Lot_No") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trolly No">
                                <HeaderStyle CssClass="small" Width="15%" />
                                <ItemTemplate>
                                    <asp:Label ID="lblTrollyNo" runat="server" Text='<%#Eval("Trolly_No") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Time-In">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="lblTimeIn" runat="server" Text='<%#Eval("Time_In") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                            <%--<asp:TemplateField HeaderText="Action">
                        <HeaderStyle CssClass="small" />
                       <ItemTemplate>
                            <asp:Button ID="btn_Update" runat="server" Text="Approve" CommandName="Update" />
                        </ItemTemplate> <%--<ItemTemplate>
                            <asp:Button ID="btnApprove" class="btn btn-success" runat="server" Text="Approve" OnClick="btn_Approve" />
                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                        </EditItemTemplate>
                    </asp:TemplateField>--%>
                            <%-- <asp:TemplateField>
                        <HeaderTemplate>--%>
                            <%--<asp:CheckBox ID="checkAll" runat="server" Text="" onclick="checkAll(this);" />--%>
                            <%--<asp:Button ID="btnAllClick" class="btn btn-success" runat="server" Text="Approve All"
                                OnClick="btnAllClick_Save" Style="height: 32px; padding: 0px; width: 100px;" />--%>
                            <%-- </HeaderTemplate>--%>
                            <%--<ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>--%>
                            <%--</asp:TemplateField>--%>
                            <%--<asp:TemplateField HeaderText="Active">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                            <%--<asp:TemplateField>
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("Beam_No") %>'>Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                        </Columns>
                        <PagerSettings Mode="Numeric" />
                        <AlternatingRowStyle BackColor="White" ForeColor="Black" />
                    </asp:GridView>
                </div>
            </div>
        </div>
       

    </body>
    </html>
</asp:Content>