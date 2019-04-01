<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmHome.aspx.cs" Inherits="HSL_Terrry.HomePages.frmHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <html>
    <head>
        <title></title>
    </head>

    <body>
        <div class="mt-xl-5">
            <div class="mt-xl-5">
                <div class="jumbotron jumbotron-fluid mt-5">
                    <div class="container text-center">
                        <h3>WELCOME TO HIMATSINGKA</h3>
                        <div class="card bg-light d-flex flex-wrap ">
                        <asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="updatepanel1" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="timer1" runat="server" Interval="1000"></asp:Timer>
                                <asp:Label ID="lbltime" CssClass="text-black-50 font-weight-bold" runat="server"></asp:Label>
                            </ContentTemplate>

                        </asp:UpdatePanel>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    </html>
</asp:Content>
