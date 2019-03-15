<%@ Page Title="" Language="C#" MasterPageFile="~/HomePages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="frmLengthSlittingMachineSup.aspx.cs" Inherits="HSL_Terrry.HomePages.frmLengthSlittingMachineSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>JavaScript - read JSON from URL</title>
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
    </head>

    <body>
        <div class="container">
            <h1 class="mt-xl-5">List of data</h1>
            <ul class="list-group" id="lists">
                
            </ul>
        </div>

        <script>
            $(document).ready(function () {
                $.getJSON('http://localhost:8081/hplant/englab/tranformer_etp/get/all', function (data) {
                    var text = '';
                    $.each(data, function (key, value) {
                        text += '<li class="list-group-item list-group-item-warning">';
                        text += '<div class="row">';
                        text += '<div class="col">';
                        text += '<a href="frmLengthSlittingMachine.aspx">' + this.dateTime + '</a>';
                        text += '</div>';
                        text += '<div class="col">';
                        text += '<a>' + this.operatorName + '</a>';
                        text += '</div>';
                        text += '<div class="col">';
                        text += '<a>' + this.remarks + '</a>';
                        text += '</div>';
                        text += '</div>';
                        text += '</li>';
                    });
                    $('#lists').append(text);
                });
            });
        </script>

    </body>
    </html>
</asp:Content>
