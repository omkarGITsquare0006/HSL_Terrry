<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserLogin.aspx.cs" Inherits="HSL_Terrry.frmUserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--    <script src="Scripts/jquery-3.3.1.min.js"></script>--%>
    <%--    <script src="Scripts/bootstrap.min.js"></script>--%>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery.validate.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/png" href="Assets/favicon.png"/>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0"/>--%>
    <style>
        .imgBackground {
            background-image: url('images/bg2.png');
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#btnLogin').click(function () {
                $('#DisableDiv').fadeTo('slow', .6);
                $('#DisableDiv').append('<div style="background-color:#E6E6E6;position: absolute;top:0;left:0;width: 100%;height:300%;z-index:1001;-moz-opacity: 0.8;opacity:.80;filter: alpha(opacity=80);"><img src="loading.gif" style="background-color:Aqua;position:fixed; top:40%; left:46%;"/></div>');
                setTimeout(1000)
            });
        });
    </script>
    <script type="text/javascript" src="ValidationScript.js"></script>
</head>

<%--<body >
    <div class="Container-fluid imgBackground">--%>
<%--background="images/bg3.png" style="background-repeat: no-repeat; background-size: 100% auto">--%>
<body>
    <%--    <div class="justify-content-center align-items-center align-self-center">--%>
    <%--        <div class="row h-100 justify-content-center align-items-center">--%>
    <%--            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">--%>
    <div class="container py-5">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="container-fluid col-md-6 mx-auto">
                        <div class="mt-5 bg-warning rounded-right">
                            <img src="Assets/logo.png" class="rounded img-fluid mt-0 mb-0" alt="Cinque Terre" />
                            <label class="h2 align-middle text-white">OCTANE</label>
                        </div>
                        <div class="card">
                            <div class="panel-heading h4 text-body card-header">
                                Login panel
                            </div>
                            <div class="card-body">
                                <form runat="server">
                                    <div class="form-group">
                                        <label for="email">Username:</label>
                                        <asp:TextBox class="form-control" ID="username" placeholder="Enter Username" runat="server" AutoComplete="Off"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd">Password:</label>
                                        <asp:TextBox class="form-control" ID="pwd" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <asp:Button class="btn btn-warning" ID="btnLogin" runat="server" Text="Sign in" OnClientClick="javascript:return userValid();" OnClick="btn_signin"></asp:Button>

                                </form>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3"></div>--%>
                </div>
            </div>
        </div>
    </div>
    <%-- </div>--%>
</body>
</html>
