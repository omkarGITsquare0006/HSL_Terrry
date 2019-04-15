﻿<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AdminSupPanel.aspx.cs" Inherits="HSL_Terrry.HomePages.AdminSupPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
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

            <div class="col">
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
            <div class="col">
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
            <div class="col"></div>
        </div>
    </body>
    </html>

</asp:Content>
