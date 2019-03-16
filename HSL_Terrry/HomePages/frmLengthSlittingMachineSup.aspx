<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmLengthSlittingMachineSup.aspx.cs" Inherits="HSL_Terrry.HomePages.frmLengthSlittingMachineSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>JavaScript - read JSON from URL</title>
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
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
        <div class="container" style="width: 80%">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <%--<div class="max_min_button" style="font-weight: 600; font-size: 28px; margin-top: -13px;">
                    </div>--%>
    <h2 class="panel-title" > 
                       SERVER ENTRY</h2>
             </div>
        <br />
        <br />
          <div class="container" style="width: 90%; overflow: auto; height: 100%;">
        <div class="panel panel-primary" style="border-color: #fff;">
            <asp:GridView ID="gvBeamList" runat="server" DataKeyNames="ID" AutoGenerateColumns="false"
                AllowSorting="true" CssClass="Gridview" HeaderStyle-BackColor="orange" ForeColor="white"
                OnRowCancelingEdit="gvDetails_RowCancelingEdit" OnRowEditing="gvDetails_RowEditing"
                OnRowUpdating="gvDetails_RowUpdating" CellPadding="5" HeaderStyle-Font-Bold="true"
                HeaderStyle-Height="35px" HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="14px"
                HeaderStyle-Width="100px" Style="text-align: center;">
                <RowStyle ForeColor="Black" BackColor="#E5E4E4" HorizontalAlign="Center" Height="27px">
                </RowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Transaction #">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkID" runat="server" Text='<%#Eval("ID") %>' PostBackUrl='<%# String.Format("~/frmLengthSlittingMachine.aspx?ID={0}", Eval("ID"))%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Machine No">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="lblMachineNo" runat="server" Text='<%#Eval("Machine_No") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Purpose of Visit">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="lblPurpose" runat="server" Text='<%#Eval("Purpose") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company Name">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("Company") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Time-In">
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
                    <asp:TemplateField HeaderText="Active">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField>
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("Beam_No") %>'>Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
                <AlternatingRowStyle BackColor="#E5E4E4" ForeColor="Black" />
            </asp:GridView>
        </div>
              </div>
    </div>
            </div>
    </body>
    </html>
</asp:Content>
