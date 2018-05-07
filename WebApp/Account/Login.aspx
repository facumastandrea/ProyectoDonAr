<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Account.Login" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc1" TagName="OpenAuthProviders" %>


<!DOCTYPE html>

<html lang="en-US">
<head>
    <meta charset="utf-8" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" />
    <link href="../Content/Login.css" rel="stylesheet" />

</head>

<body>
    <div id="login">
        <form method="post" runat="server" action="./Account/Login" onsubmit="javascript:return WebForm_OnSubmit();">
            <fieldset class="clearfix">
                <table>
                    <tr>
                        <td>
                            <p>
                                <span class="fontawesome-user"></span>
                                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Email"
                                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                                <%--<input runat="server" type="text" value="Username" onblur="if(this.value == '') this.value = 'Username'" onfocus="if(this.value == 'Username') this.value = ''" required>--%>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!-- JS because of IE support; better: placeholder="Username" -->
                            <p>
                                <span class="fontawesome-lock"></span>
                                <%--<input type="password" value="Password" onblur="if(this.value == '') this.value = 'Password'" onfocus="if(this.value == 'Password') this.value = ''" required>--%>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                            </p>
                            <!-- JS because of IE support; better: placeholder="Password" -->

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">¿Recordar cuenta?</asp:Label>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                <asp:Button runat="server" OnClick="LogIn" Text="Iniciar sesión" CssClass="btn btn-default" />

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <section id="socialLoginForm">
                                <uc1:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
                            </section>
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse como usuario nuevo</asp:HyperLink>
                </p>
            </fieldset>

        </form>



    </div>
    <!-- end login -->

</body>
</html>
<script type="text/javascript">
        
    $(document).ready(function () {
        $('#Email').blur(function () { if (this.value == '') this.value = 'Email' });
        $('#Email').focus(function () { if (this.value == 'Email') this.value = '' });

        //$("#Password").val("12345678");
        $('#Email').blur(function () { if (this.value == '') this.value = '12345678' });
        $('#Email').focus(function () { if (this.value == '12345678') this.value = '' });

    });
    //<input type="text" value="Username" onblur="if(this.value == '') this.value = 'Username'" onfocus="if(this.value == 'Username') this.value = ''" required>
</script>


