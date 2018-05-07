<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Intereses.aspx.cs" Inherits="WebApp.Account.Intereses" EnableViewState="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <title>Registrarse</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" />
    <link href="../Content/Login.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
        span.bigcheck-target {
            font-family: FontAwesome; /* use an icon font for the checkbox */
        }

        input[type='checkbox'].bigcheck {
            position: relative;
            left: -999em; /* hide the real checkbox */
        }

            input[type='checkbox'].bigcheck + span.bigcheck-target:after {
                content: "\f096"; /* In fontawesome, is an open square (fa-square-o) */
            }

            input[type='checkbox'].bigcheck:checked + span.bigcheck-target:after {
                content: "\f046"; /* fontawesome checked box (fa-check-square-o) */
            }

        /* ==== optional - colors and padding to make it look nice === */
        body {
            color:white;
            font-family: sans-serif;
            font-weight: 500;
            font-size: 1.5em; /* set this to whatever size you want */
        }

        span.bigcheck {
            display: block;
            padding: 0.5em;
            display: table-cell;
            vertical-align: middle;
        }

        .divImagen {
            background-attachment: scroll;
            background-position: center;
            background-repeat: no-repeat;
            background-size: 100%;
            width: 100%;
            height: 120px;
            text-align: center;
            vertical-align: central !important;
            display: table;
        }
    </style>
</head>
<body>

    <form id="frmIntereses" runat="server">
        <div>
         <span>Elegí tus principales intereses</span> 
            </div>
       <asp:Repeater runat="server" ID="rptIntereses" OnItemDataBound="rptIntereses_ItemDataBound">
            <ItemTemplate>
                <div style="background-image: url('<%#Eval("URLImagen") %>');" class="divImagen">
                    <span class="bigcheck">
                        <label class="bigcheck">
                            <%#Eval("Descripcion") %>
                            <input type="checkbox" id="chbInteres" class="bigcheck" name="chbInteres" runat="server" />
                            <span class="bigcheck-target"></span>
                        </label>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div id="login">
            <fieldset class="clearfix">
                <asp:Button runat="server" ID="btnListo" CssClass="btn btn-default" OnClick="btnListo_Click" Text="Listo!" />
            </fieldset>
        </div>



    </form>


</body>
</html>
