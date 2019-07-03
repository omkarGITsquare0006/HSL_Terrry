<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AdminSupPanel.aspx.cs" Inherits="HSL_Terrry.HomePages.AdminSupPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="../content/bootstrap.min.css" rel="stylesheet" />
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
            <div class="col-md-2" id="usercard" runat="server">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/users.png" style="width: 100%; height: 150px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4" style="font-size:large">Manage Users<i class="close" aria-label="close"></i></span>
                        <p><a href="frmManageUsersList.aspx">click here</a></p>
                    </div>
                    <div class="card-reveal p-0">
                        <span class="card-title grey-text text-darken-4 font-weight-bold" style="font-size:large">Manage Users<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>Here is information about supervisors and operators. You can manage users here.</p>
                    </div>
                </div>
            </div>

            <%-- Manage PO Working --%>
            <div class="col-md-2" id="pocard" runat="server">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/orders.png" style="width: 100%; height: 150px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4" style="font-size:larger">Manage PO<i class="material-icons right"></i></span>
                        <p><a href="frmPOManageClose.aspx">click here</a></p>
                    </div>
                    <div class="card-reveal p-0">
                        <span class="card-title grey-text text-darken-4 font-weight-bold" style="font-size:large">Manage PO<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>Here is information about product orders and productions. You can close PO's here.</p>
                    </div>
                </div>
            </div>

            <%-- Manage Machines --%>
            <div class="col-md-2" id="Div1" runat="server">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/machine.png" style="width: 100%; height: 150px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4" style="font-size:larger">Add Machine<i class="material-icons right"></i></span>
                        <p><a href="frmManageMachine.aspx">click here</a></p>
                    </div>
                    <div class="card-reveal p-0">
                        <span class="card-title grey-text text-darken-4 font-weight-bold" style="font-size:large">Add Machine<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>If you want to add machine for specific operetion go for here.</p>
                    </div>
                </div>
            </div>

            <%-- Manage Trolley --%>
            <div class="col-md-2" id="Div2" runat="server">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/trolley.png" style="width: 100%; height: 150px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4" style="font-size:larger">Add Trolley<i class="material-icons right"></i></span>
                        <p><a href="frmManageTrolley.aspx">click here</a></p>
                    </div>
                    <div class="card-reveal p-0">
                        <span class="card-title grey-text text-darken-4 font-weight-bold" style="font-size:large">Add Trolley<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>To add the new trolley go here.</p>
                    </div>
                </div>
            </div>

            <%-- Manage Reject --%>
            <div class="col-md-2" id="Div3" runat="server">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/reject.png" style="width: 100%; height: 150px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4" style="font-size:larger">Rejections<i class="material-icons right"></i></span>
                        <p><a href="frmManageRejection.aspx">click here</a></p>
                    </div>
                    <div class="card-reveal p-0">
                        <span class="card-title grey-text text-darken-4 font-weight-bold" style="font-size:large">Rejections<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>To add specific reject reson with their unique code go here</p>
                    </div>
                </div>
            </div>

            <%-- Manage Stoppage --%>
            <div class="col-md-2" id="Div4" runat="server">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/stop.png" style="width: 100%; height: 150px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4" style="font-size:larger">Stoppage<i class="material-icons right"></i></span>
                        <p><a href="frmManageStoppage.aspx">click here</a></p>
                    </div>
                    <div class="card-reveal p-0">
                        <span class="card-title grey-text text-darken-4 font-weight-bold" style="font-size:large">Stoppage<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>To add specific stop reason with their unique code go here</p>
                    </div>
                </div>
            </div>

            <div class="col-md-2" id="Div5" runat="server">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="../images/orders.png" style="width: 100%; height: 150px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4" style="font-size:larger">WIP<i class="material-icons right"></i></span>
                        <p><a href="frmWipReport.aspx">click here</a></p>
                    </div>
                    <div class="card-reveal p-0">
                        <span class="card-title grey-text text-darken-4 font-weight-bold" style="font-size:large">WIP Report<i class="material-icons right close" aria-label="Close">x</i></span>
                        <p>To View the WIP Report go here</p>
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
