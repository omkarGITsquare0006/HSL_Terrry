<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmManageUsers.aspx.cs" Inherits="HSL_Terrry.HomePages.frmManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
            <script src="Scripts/jquery-3.3.1.min.js"></script>
        <%--    <script src="Scripts/bootstrap.min.js"></script>--%>
        <%--        <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-xl-5">
                <h3 class="mt-xl-3"></h3>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                 <div class="max_min_button" style="font-weight: 600; font-size: 28px; margin-top: -13px;">
                    </div>
                <h3 class="panel-title">
                    Operator Details</h3>
            </div>
            <div class="row" style="padding-top: 20px;">
                <div class="col-md-2">
                    <asp:Label ID="lblSupId" runat="server" Text="User ID"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSupID" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqSupId" ControlToValidate="txtSupID"
                        ErrorMessage="Enter ID!" Style="color: Red;" />--%>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSupID"
                        ErrorMessage="Enter ID!" Style="color: Red;"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblSupName" runat="server" Text="Name"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSupName" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqSupName" ControlToValidate="txtSupName"
                        ErrorMessage="Enter Name!" Style="color: Red;" />--%>
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
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqPwd" ControlToValidate="txtPassword"
                        ErrorMessage="Enter Password!" Style="color: Red;" />--%>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblDept" runat="server" Text="Department"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlDept" class="form-control" runat="server">
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="reqDept" runat="server" ControlToValidate="ddlDept"
                        ErrorMessage="Select Department!" InitialValue="-1" ForeColor="Red"></asp:RequiredFieldValidator>--%>
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
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqEmailID" ControlToValidate="txtEmailID"
                        ErrorMessage="Enter Email Id!" Style="color: Red;" />--%>
                    <br />
                    <%--<asp:RegularExpressionValidator ID="REVEmailId" runat="server" ControlToValidate="txtEmailID"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email Format!"
                        Style="color: Red;" />--%>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                <asp:Label ID="lblAdmin" runat="server" Text="Administrator"></asp:Label>
                </div>
                <div class="col-md-3">
                <asp:CheckBox ID="chkAdmin" runat="server" Checked="false" />
                </div>
                <div class="col-md-1">
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" />
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-1">
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" OnClick="btnAdd_Click"
                        Style="width: 100px; font-size: 16px; margin-left: 155%;" Text="Save" />
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
        </div>
    </div>
        </body>
        </html>
    
</asp:Content>
