<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="WebApp.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdnUbicaciones" runat="server" />
    <div style="background-image:url('/Imagenes/Generales/ProyectoDonAr.jpg') ;background-attachment: fixed; background-repeat:no-repeat; width:100%; height:400px; background-size:100%;">
    </div>
    <div class="mainPortfolio container">        
        <div class="row">
            <div id="myBtnContainer">
                <div id="map" style="width: 100%; height: 250px; border-radius:5px;"></div>
                <br />
                <button type="button" style="border-radius:5px; border-style:solid; border-width:1px; border-color:lightgray" class="btnPortfolio active" onclick="filterSelection('all')">Todos</button>
                <asp:Repeater ID="rptTiposProyectos" runat="server">
                    <ItemTemplate>
                        <button type="button" style="border-radius:5px; border-style:solid; border-width:1px; border-color:lightgray" class="btnPortfolio" onclick="filterSelection('<%#Eval("Descripcion") %>')"><%#Eval("Descripcion") %></button>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="rowPortfolio">
            <asp:Repeater ID="rptProyectos" runat="server">
                <ItemTemplate>
                    <div class="columnPortfolio <%#Eval("Proyecto.TiposProyecto.Descripcion")%>  idOrg<%#Eval("Proyecto.Organizacione.idOrganizacion")%>">
                        <div class="contentPortfolio" style="display:table-cell; vertical-align:middle; text-align:center; border-radius:5px; border-style:solid; border-width:1px; border-color:lightgray">
                            <a href="DetalleProyecto.aspx?idProyecto=<%#Eval("idProyecto") %>">
                                <img class="img-responsive" style="border-radius:5px;" src="<%#Eval("URL") %>" />
                            </a>
                            <h4><%#Eval("Proyecto.Nombre") %></h4>
                            <p><%#Eval("Proyecto.Organizacione.Nombre") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <script src="Scripts/Portfolio.js"></script>
    <script>
        function initMap() {
            var myLatlng = { lat: -34.707, lng: -58.396 };
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 4,
                center: myLatlng
            });
            var u = jQuery.parseJSON($("#MainContent_hdnUbicaciones").val())
            $.each(u, function (i, val) {
                var marker = new google.maps.Marker({
                    position: { lat: parseInt(val.Latitud), lng: parseInt(val.Longitud) },
                    map: map,
                    title: 'Click to zoom',
                    id: 'idOrg' + val.idOrganizacion.toString()
                });
                marker.addListener('click', function () {
                    if (map.zoom < 10) {
                        map.setZoom(10);
                    }
                    else {
                        map.setZoom(map.zoom * 1.2);
                    } 
                    map.setCenter(marker.getPosition());
                    filterSelection(marker.id);
                    $(".btnPortfolio").removeClass("active");
                });
            });            
        }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAPliukCOBnMfDQbiqY0fMpmeC1ZdeXjN8&callback=initMap"></script>
</asp:Content>
