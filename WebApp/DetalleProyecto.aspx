<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleProyecto.aspx.cs" Inherits="WebApp.DetalleProyecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-md-12 text-center" style="line-height: 30px;">
                            <asp:Label runat="server" Font-Size="XX-Large" ID="lblProyecto"></asp:Label>
                            <br />
                            <asp:Label runat="server" Font-Size="medium" ID="lblOrganizacion"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-centered text-left">
                            <asp:Label runat="server" Font-Size="Small" ID="lblDescripcionOrganizacion">lalalal</asp:Label>
                        </div>
                    </div>
                    <div class="row" style="vertical-align: middle">
                        <div class="col-md-3" style="vertical-align: middle">
                            <div class="wrapper" style="vertical-align: middle">
                                <asp:Image ID="imgPrincipal" runat="server" Height="175" Width="175" />
                                <div id="bar" style="vertical-align: middle">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="progress skill-bar">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="<%=this.porcentaje %>" aria-valuemin="0" aria-valuemax="100">
                                    <span><%=this.porcentaje %>%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div class="row">
            <div class="col-md-6">
                <asp:Label runat="server" TextMode="MultiLine" ID="lblIzquierda"></asp:Label>
            </div>
            <div class="col-md-6">
                <div id="myCarousel" class="carousel slide">
                    <div class="carousel-inner">
                        <asp:Repeater ID="Rgallary" runat="server">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="item active">
                                        <asp:Image ID="imgId" Height="300" Width="300" runat="server" ImageUrl='<%#Eval("URL") %>' />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
                </div>
                <asp:Label runat="server" TextMode="MultiLine" ID="lblDerecha"></asp:Label>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var porcentaje;
        $(document).ready(function () {

            $('.carousel').carousel({
                interval: 2500
            })
            porcentaje = <%=this.porcentaje%>;

            $('.progress .progress-bar').css("width",
                function () {
                    return $(this).attr("aria-valuenow") + "%";
                }
            )
        });

    </script>
</asp:Content>
