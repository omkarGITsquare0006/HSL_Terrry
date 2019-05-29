<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmMCrossCuttingSup.aspx.cs" Inherits="HSL_Terrry.HomePages.frmMCrossCuttingSup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>JavaScript - read JSON from URL</title>
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
        <link href="../Styles/css/paging.css" rel="stylesheet" />
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
         <br />
        <div class="container-fluid">
            <div class="card border-warning">
                <div class="card-header bg-warning" style="height: 50px;">
                    <p>MANUAL CROSS CUTTING</p>
                </div>
                <div class="card-body">
                    <span class="text-danger font-weight-lighter font-italic">Please input PO hit Enter!!</span>
                    <%-- Filtering Gridview Using TextBox --%>
                    <div class="form-inline mb-1">
                        <%--                            <div class="col">--%>
                        <label for="txtshift" class="col-form-label mr-sm-2">PO Number:</label>
                        <asp:TextBox ID="txtPoSearch" class="form-control  mr-sm-2" AutoComplete="Off" AutoPostBack="true" OnTextChanged="txtPoSearch_TextChanged" placeholder="Enter PO" runat="server" />
                        <br />
                    </div>
                    <%-- Gridview --%>
                    <asp:GridView ID="gvBeamList" runat="server" DataKeyNames="ID" AutoGenerateColumns="false" 
                        AllowSorting="true" CssClass="table-responsive table-striped w-auto pagination-ys" ForeColor="Black" HorizontalAlign="justify"
                        OnRowCancelingEdit="gvDetails_RowCancelingEdit" OnRowEditing="gvDetails_RowEditing"
                        OnRowUpdating="gvDetails_RowUpdating" CellPadding="5" HeaderStyle-Font-Bold="true"
                        HeaderStyle-Height="30px" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Size="10px"
                        HeaderStyle-Width="100px" AllowPaging="true"
                        OnPageIndexChanging="OnPageIndexChanging" PageSize="20">

                        <HeaderStyle Font-Bold="True" Font-Size="20px" ForeColor="Black" Height="30px" Width="100px" HorizontalAlign="Center"></HeaderStyle>

                        <RowStyle ForeColor="Black" CssClass="table-hover" BackColor="#E5E4E4" HorizontalAlign="Center" Font-Size="Small"></RowStyle>
                        <Columns>
                            <asp:TemplateField HeaderText="Transaction #">
                                <HeaderStyle CssClass="small"  /><%--Width="15%"--%>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkID" runat="server" Text='<%#Eval("ID") %>' PostBackUrl='<%# String.Format("frmMCrossCutting.aspx?ID={0}", Eval("ID"))%>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Po Number">
                                <HeaderStyle CssClass="small" Width="15%" /><%-- --%>
                                <ItemTemplate>
                                    <asp:Label ID="lblPONo" runat="server" Text='<%#Eval("Prod_Order_no") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Date">
                                <HeaderStyle CssClass="small" Width="18%" /><%--Width="18%"--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Shift">
                                <HeaderStyle CssClass="small" Width="18%" /><%--Width="18%"--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblshift" runat="server" Text='<%#Eval("Shift") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Machine #">
                                <HeaderStyle CssClass="small" Width="15%" /><%--Width="15%"--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblMachineNo" runat="server" Text='<%#Eval("Machine_No") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trolly #">
                                <HeaderStyle CssClass="small" Width="15%" /><%--Width="15%"--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblTrollyNo" runat="server" Text='<%#Eval("Trolly_No") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Confirmed Qty">
                                <HeaderStyle CssClass="small" Width="12%" /><%--Width="12%"--%> 
                                <ItemTemplate>
                                    <asp:Label ID="lblProd_pcs" runat="server" Text='<%#Eval("Prod_pcs") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scrapped Qty">
                                <HeaderStyle CssClass="small" Width="15%" /><%--Width="15%"--%> 
                                <ItemTemplate>
                                    <asp:Label ID="lblRejected_Qty" runat="server" Text='<%#Eval("Rejected_Qty") %>' />
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
