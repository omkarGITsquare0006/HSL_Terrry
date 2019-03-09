<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserLogin.aspx.cs" Inherits="HSL_Terrry.frmUserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--    <script src="Scripts/jquery-3.3.1.min.js"></script>--%>
    <%--    <script src="Scripts/bootstrap.min.js"></script>--%>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="align-middle">
    <div class="row">
        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
            <div class="row">
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"></div>
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4 mt-5">
                    <div class="mt-5">
                        <img src="Assets/logo.png" class="rounded" alt="Cinque Terre" />
                    </div>
                    <div class="card">
                        <div class="panel-heading h4 text-primary text-center card-header">
                            Login panel
                        </div>
                        <form action="/action_page.php" runat="server" class="card-body">
                            <div class="form-group">
                                <label for="email">Username:</label>
                                <asp:TextBox class="form-control" ID="txtmobile" placeholder="Enter Username" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <asp:TextBox class="form-control" ID="txtpwd" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:Button class="btn btn-success" ID="btnLogin" runat="server" Text="Submit"></asp:Button>
                        </form>
                    </div>
                </div>
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"></div>
            </div>
        </div>
    </div>
</body>
</html>
