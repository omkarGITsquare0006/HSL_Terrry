<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmManageUsersList.aspx.cs" Inherits="HSL_Terrry.HomePages.frmManageUsersList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>JavaScript - read JSON from URL</title>
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    </head>

    <body>
        <br />
        <br />
        <br />
        <div class="container" style="width: 100%">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="max_min_button" style="font-weight: 600; font-size: 28px; margin-top: -13px;">
                    </div>
                    
                    <h2 class="panel-title">MASTER DATA</h2>
                </div>
            </div>


            <%-- <form id="formSupplierList" runat="server">--%>
            <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color: Orange">
        <div class="container">
            <div class="navbar-header">
                <div style="color: #fff;">
                    <img src="images/logo2.png" alt="logo" style="width: 31%;" /><b>
                        <asp:Label ID="lblUsername" runat="server" Text="Label" Style="color: Black; font-size: 18px;
                            margin-left: 15%; font-family: Times New Roman, Times;">
                        </asp:Label></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="LogOUT.aspx" title="Logout"
                            style="color: black">
                            <img src="images/logout1.png" alt="logo" style="width: 3%; float: right; margin-top: 20px;" /></a>
                    <a href="MasterPage.aspx" title="Home" style="color: black">
                        <img src="images/home-icon.png" alt="logo" style="width: 3%; float: right; margin-top: 20px;" /></a>
                </div>
            </div>
        </div>
    </div>--%>
            <%-- <asp:Label ID="lblDateTime" runat="server" Style="float: right; font-size: 16px;"></asp:Label>--%>
            <div class="container">
                <div class="panel panel-primary" style="border-color: #fff;">
                    &nbsp;&nbsp;
            <asp:GridView ID="BeamList" runat="server" DataKeyNames="Sup_ID" AutoGenerateColumns="false"
                AllowSorting="true" CssClass="Gridview" HeaderStyle-BackColor="Orange" ForeColor="white"
                CellPadding="5" HeaderStyle-Font-Bold="true" HeaderStyle-Height="35px" HeaderStyle-ForeColor="White"
                HeaderStyle-Font-Size="18px" HeaderStyle-Width="20px" Style="text-align: center;"
                OnRowCommand="gvSupList_RowCommand" OnRowDataBound="gvSupList_RowDataBound" OnRowDeleted="gvSupList_RowDeleted"
                OnRowDeleting="gvSupList_RowDeleting">
                <RowStyle ForeColor="Black" BackColor="White" HorizontalAlign="Center" Height="27px"></RowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="User ID">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkSupID" runat="server" Text='<%#Eval("Sup_ID") %>' PostBackUrl='<%# String.Format("~/HomePages/frmManageUsers.aspx?Sup_Id={0}", Eval("Sup_Id"))%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="lblSupName" runat="server" Width="120px" Text='<%#Eval("Sup_Name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="lblDept" runat="server" Width="120px" Text='<%#Eval("Dept_Name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email ID">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="lblEmailID" runat="server" Text='<%#Eval("EmailID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role Name">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:Label ID="chkAdmin" runat="server" Width="120px" Text='<%# Eval("RoleName").ToString() %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active">
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkActive" runat="server" Width="120px" Checked='<%# bool.Parse(Eval("Active").ToString()) %>'
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle CssClass="small" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnDelete" runat="server" Width="120px" CommandName="Delete" CommandArgument='<%#Eval("Sup_ID") %>'>Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="#E5E4E4" ForeColor="Black" />
            </asp:GridView>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    <br />
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" OnClick="btnAdd_Click"
                        Style="width: 100px; font-size: 16px; margin-left: 30%;" Text="Add New" />
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                </div>
            </div>
        </div>

        <%--</form>--%>
    </body>
    </html>

</asp:Content>
