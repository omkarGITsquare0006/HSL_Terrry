<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AdminSupPanel.aspx.cs" Inherits="HSL_Terrry.HomePages.AdminSupPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
<%--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">--%>
        <link href="../Styles/css/materialize.min.css" rel="stylesheet" />
        <link href="../Styles/css/simple-sidebar.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-left">
                <h3>MANAGEMENT PANEL</h3>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col" hidden>
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="../images/orders.png" alt="Avatar" style="width: 250px; height: 250px;">
                        </div>
                        <div class="flip-card-back">
                            <h1>Manage PO</h1>
                            <a href="frmPOManage.aspx">click for PO Manage</a>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Manage Users --%>
            <div class="col" hidden>
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="../images/users.png" alt="Avatar" style="width: 250px; height: 250px;">
                        </div>
                        <div class="flip-card-back">
                            <h1>Manage Users</h1>
                            <a href="frmManageUsersList.aspx">click for manage users</a>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Managing PO (Closing) Card --%>
            <div class="col" hidden>
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="../images/orders.png" alt="Avatar" style="width: 250px; height: 250px;">
                        </div>
                        <div class="flip-card-back">
                            <h1>Manage PO</h1>
                            <a href="frmPOManageClose.aspx">click for PO Manage(Close)</a>
                        </div>
                    </div>
                </div>
            </div>


            <%-- Manage Users Working --%>
            <div class="col-auto">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/users.png" style="width: 250px; height: 250px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">Manage Users<i class="close" aria-label="close"></i></span>
                        <p><a href="frmManageUsersList.aspx">click for manage users</a></p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4 font-weight-bold">Manage Users<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>Here is information about supervisors and operators. You can manage users here.</p>
                    </div>
                </div>
            </div>

            <%-- Manage PO Working --%>
            <div class="col-auto">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/orders.png" style="width: 250px; height: 250px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">Manage PO<i class="material-icons right"></i></span>
                        <p><a href="frmPOManageClose.aspx">click for PO Manage(Close)</a></p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4 font-weight-bold">Manage PO<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>Here is information about product orders and productions. You can close PO's here.</p>
                    </div>
                </div>
            </div>

            <div class="col"></div>
        </div>

<%--        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>--%>
        <script src="../materialize.min.js"></script>

    </body>
    </html>

</asp:Content>
