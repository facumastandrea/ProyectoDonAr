<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="WebApp.Account.OpenAuthProviders" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.btnFacebook {
    background-color: DodgerBlue; /* Blue background */
    border: none; /* Remove borders */
    color: white; /* White text */
    padding: 12px 16px; /* Some padding */
    font-size: 16px; /* Set a font size */
    cursor: pointer; /* Mouse pointer on hover */
    border-radius: 3px;
    width:280px;
    text-align:left;
}

.btnGoogle {
    background-color: #dd4b39;
    border: none; /* Remove borders */
    color: white; /* White text */
    padding: 12px 16px; /* Some padding */
    font-size: 16px; /* Set a font size */
    cursor: pointer; /* Mouse pointer on hover */
    border-radius: 3px;
    width:280px;
    text-align:left;
}

/* Darker background on mouse-over */
.btnFacebook:hover {
    background-color: RoyalBlue;
}
/* Darker background on mouse-over */
.btnGoogle:hover {
    background-color: #c75244;
}
</style>
<div id="socialLoginList">
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <p>
                <button type="submit" class="btn<%#: Item %>" name="provider" value="<%#: Item %>"
                    title="Inicie sesión con su <%#: Item %> cuenta.">
                    <i class="fa fa-<%#: Item.ToLower() %>" style="text-align:center"></i>
                    &emsp;<%#: Item %>    
                </button>
            </p>
            <br />
        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>No existen servicios de autenticación externos configurados. Consulte <a href="https://go.microsoft.com/fwlink/?LinkId=252803">este artículo</a> para obtener información sobre cómo configurar esta aplicación ASP.NET para admitir el inicio de sesión a través de servicios externos.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>
