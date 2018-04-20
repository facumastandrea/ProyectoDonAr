<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="WebApp.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainPortfolio">
        <h1>Proyecto DonAr</h1>
        <hr>
        <h2>Proyectos que buscan donaciones</h2>
        <div id="myBtnContainer">
            <button type="button" class="btnPortfolio active" onclick="filterSelection('all')">Todos</button>
            <asp:Repeater ID="rptTiposProyectos" runat="server">
                <ItemTemplate>
                    <button type="button" class="btnPortfolio" onclick="filterSelection('<%#Eval("Descripcion") %>')"><%#Eval("Descripcion") %></button>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="rowPortfolio">
            <asp:Repeater ID="rptProyectos" runat="server">
                <ItemTemplate>
                    <div class="columnPortfolio <%#Eval("Proyecto.TiposProyecto.Descripcion")%>">
                        <div class="contentPortfolio">
                            <a href="DetalleProyecto.aspx?idProyecto=<%#Eval("idProyecto") %>">
                                <img class="img-responsive" src="<%#Eval("URL") %>" />
                            </a>
                            <h4><%#Eval("Proyecto.Nombre") %></h4>
                            <p><%#Eval("Proyecto.Organizacione.Nombre") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
