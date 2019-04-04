<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserLogin.aspx.cs" Inherits="HSL_Terrry.frmUserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--    <script src="Scripts/jquery-3.3.1.min.js"></script>--%>
    <%--    <script src="Scripts/bootstrap.min.js"></script>--%>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery.validate.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
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
    <script type="text/javascript">                
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    //This section we need to place our custom rule for the control.  
                    <%=username.UniqueID %>:{
                    required: true
                },   
                },
            messages: {
                    //This section we need to place our custom validation message for each control.  
                      <%=username.UniqueID %>:{
                required: "Name is required."
            },  
                },  
            });  
        });
    </script>
</head>

<%--<body >
    <div class="Container-fluid imgBackground">--%>
        <%--background="images/bg3.png" style="background-repeat: no-repeat; background-size: 100% auto">--%>
        <body background="images/bg2.png" style="background-size: 100% 200%" class="img-fluid">
    <div class="row">
        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
            <div class="row" style="margin-left: -30%;">
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"></div>
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4 mt-5">
                    <div class="mt-5">
                        <img src="Assets/logo.png" class="rounded" alt="Cinque Terre" />
                    </div>
                    <div class="card">
                        <div class="panel-heading h4 text-body text-center card-header">
                            Login panel
                        </div>
                        <form runat="server" class="card-body">
                            <div class="form-group">
                                <label for="email">Username:</label>
                                <asp:TextBox class="form-control" ID="username" placeholder="Enter Username" runat="server" AutoComplete="Off"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <asp:TextBox class="form-control" ID="pwd" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:Button class="btn btn-success" ID="btnLogin" runat="server" Text="Sign in" OnClick="btn_signin"></asp:Button>

                        </form>
                    </div>
                </div>
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"></div>
            </div>
        </div>
    
   </div>     
<%-- </div>--%>
</body>
</html>
