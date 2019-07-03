<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmManageUsers.aspx.cs" Inherits="HSL_Terrry.HomePages.frmManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <%--    <script src="Scripts/bootstrap.min.js"></script>--%>
        <%--        <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
        <script type="text/javascript" src="../ValidationScript.js"></script>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-xl-5">
                <h3 class="mt-xl-3"></h3>
            </div>
        </div>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="max_min_button" style="font-weight: 600; font-size: 28px; margin-top: -13px;">
                    </div>
                    <h3 class="panel-title">OPERATOR DETAILS</h3>
                </div>
            </div>
            <div class="row" style="padding-top: 20px;">
                <div class="col-md-2">
                    <asp:Label ID="lblSupId" runat="server" Text="User ID"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSupID" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblSupName" runat="server" Text="Name"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSupName" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                </div>
                <div class="col-md-1">
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblPwd" runat="server" Text="Password"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPassword" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblDept" runat="server" Text="Department"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlDept" class="form-control dropdown-toggle" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-md-1">
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblEmailID" runat="server" Text="Email Id"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmailID" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <asp:Label ID="Label1" runat="server" Text="Role"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlRole" class="form-control" runat="server">
                        <asp:ListItem Text="Operator" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Supervisor" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-1">
                </div>
            </div>
            <br />
            <div class="row container border-dark border pr-0" id="screenAccessDiv">
                <div class="col-2">
                    <asp:Label ID="Label2" CssClass="font-weight-bold" runat="server" Text="Assign Screen Access:"></asp:Label>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <asp:CheckBox ID="chkLSM" runat="server" Text="LSM" />
                    </div>
                    <div class="col-sm-2">
                        <asp:CheckBox ID="chkLHM" runat="server" Text="LHM" />
                    </div>
                    <div class="col-sm-2">
                        <asp:CheckBox ID="chkACCH" runat="server" Text="ACCH" />
                    </div>
                    <div class="col-sm-2">
                        <asp:CheckBox ID="chkMCC" runat="server" Text="MCC" />
                    </div>
                    <div class="col-sm-2">
                        <asp:CheckBox ID="chkMCH" runat="server" Text="MCH" />
                    </div>
                    <div class="col-sm-2">
                        <asp:CheckBox ID="chkEM" runat="server" Text="EM" />
                    </div>
                    <div class="col-sm-2">
                        <asp:CheckBox ID="chkPP" runat="server" Text="PP" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
            </div>
            <div class="col-md-3">
                <asp:CheckBox ID="chkActive" runat="server" Checked="true" />
            </div>
        </div>
        <div class="col-md-1">
        </div>
        <div class="col-md-3">
        </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Save" OnClientClick="return Validate();" OnClick="btnAdd_Click" />
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <br />
        <asp:Label ID="lblErrMessage" runat="server" Text="" Visible="true" ForeColor="Red"
            Style="padding-left: 30px;"></asp:Label>


        <script type="text/javascript">
            $("#<%=ddlRole.ClientID%>").change(function () {
                if (($("#<%=ddlRole.ClientID%>").val() == '1') || ($("#<%=ddlRole.ClientID%>").val() == '2')) {
                    $("#screenAccessDiv").hide();
                } else {
                    $("#screenAccessDiv").show();
                }
            });
        </script>
    </body>
    </html>

</asp:Content>
