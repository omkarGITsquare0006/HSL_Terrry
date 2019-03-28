<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmLengthSlittingMachineSup.aspx.cs" Inherits="HSL_Terrry.HomePages.frmLengthSlittingMachineSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
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
        <div class="container" style="width: 100%">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <%--<div class="max_min_button" style="font-weight: 600; font-size: 28px; margin-top: -13px;">
                    </div>--%>
    <h2 class="panel-title" > 
                       LENGTH SLITTING MACHINE</h2>
             </div>
        <br />
        <br />
          <div class="container" style="width: 100%; overflow: auto; height: 100%;">
        <div class="panel panel-primary table-responsive" style="border-color: #fff;">
            <div class="panel-heading">
                <h2 class="panel-title" > 
                       LENGTH SLITTING MACHINE</h2>
             </div>
            <br />
            <asp:GridView ID="gvBeamList" runat="server" DataKeyNames="ID" AutoGenerateColumns="false"
                AllowSorting="true" CssClass="table table-striped table-bordered table-hover thead-dark" ForeColor="white"
                OnRowCancelingEdit="gvDetails_RowCancelingEdit" OnRowEditing="gvDetails_RowEditing"
                OnRowUpdating="gvDetails_RowUpdating" CellPadding="5" HeaderStyle-Font-Bold="true"
                HeaderStyle-Height="30px" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="20px"
                HeaderStyle-Width="100px" Style="text-align: center;" AllowPaging="True">
                <RowStyle ForeColor="Black" BackColor="#E5E4E4" HorizontalAlign="Center" Height="27px">
                </RowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Transaction #">
                        <HeaderStyle CssClass="small" Width="15%" />
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkID" runat="server" Text='<%#Eval("ID") %>' PostBackUrl='<%# String.Format("frmLengthSlittingMachineOPDetail.aspx?ID={0}", Eval("ID"))%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Po Number" >
                        <HeaderStyle CssClass="small" Width="15%" />
                        <ItemTemplate>
                            <asp:Label ID="lblPONo" runat="server" Text='<%#Eval("PO_No") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" >
                        <HeaderStyle CssClass="small" Width="18%" />
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Machine No" >
                        <HeaderStyle CssClass="small" Width="15%" />
                        <ItemTemplate>
                            <asp:Label ID="lblMachineNo" runat="server" Text='<%#Eval("Machine_No") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shift" >
                        <HeaderStyle CssClass="small" Width="12%" />
                        <ItemTemplate>
                            <asp:Label ID="lblShift" runat="server" Text='<%#Eval("Shift") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Lot No" >
                        <HeaderStyle CssClass="small" Width="15%" />
                        <ItemTemplate>
                            <asp:Label ID="lblLotNo" runat="server" Text='<%#Eval("Lot_No") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Trolly No" >
                        <HeaderStyle CssClass="small" Width="15%"/>
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
                <AlternatingRowStyle BackColor="#E5E4E4" ForeColor="Black" />
            </asp:GridView>
        </div>
              </div>
    </div>
            </div>
    </body>
    </html>
</asp:Content>
