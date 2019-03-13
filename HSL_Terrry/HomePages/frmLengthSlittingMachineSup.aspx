<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmLengthSlittingMachineSup.aspx.cs" Inherits="HSL_Terrry.HomePages.frmLengthSlittingMachineSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>JavaScript - read JSON from URL</title>
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
    </head>

    <body>
        <div class="mypanel"></div>

        <script>
            $.getJSON('http://time.jsontest.com', function (data) {

                var text = `Date: ${data.date}<br>
                    Time: ${data.time}<br>
                    Unix time: ${data.milliseconds_since_epoch}`


                $(".mypanel").html(text);
            });
        </script>

    </body>
    </html>
</asp:Content>
