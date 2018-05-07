<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApp.Account.Register" %>

<!DOCTYPE html>

<html lang="en-US">
<head>
    <meta charset="utf-8" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <title>Registrarse</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" />
    <link href="../Content/Login.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    
        <form runat="server">
            <div id="login">
            <fieldset class="clearfix">
                <table>
                    <tr>
                        <td>
                            <p>
                                <span class="fontawesome-user"></span>
                                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" Text="Email" />
                                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Email"
                                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                <span class="fontawesome-lock"></span>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" Text="Contraseña" />
                                <asp:RequiredFieldValidator Display="None" runat="server" ControlToValidate="Password"
                                    CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                <span class="fontawesome-lock"></span>
                                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" Text="Repetir Contraseña" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                    CssClass="text-danger" Display="None" ErrorMessage="El campo de confirmación de contraseña es obligatorio." />
                                <asp:CompareValidator Display="None" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                    CssClass="text-danger" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrarse" CssClass="btn btn-default" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="ErrorMessage" />
                            </p>
                            <asp:ValidationSummary runat="server" CssClass="text-danger" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            </div>
        </form>
    
</body>

</html>
<script type="text/javascript">

    $(document).ready(function () {
        $('#Email').blur(function () { if (this.value == '') this.value = 'Email' });
        $('#Email').focus(function () { if (this.value == 'Email') this.value = '' });

    });
    
</script>