<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleProyecto.aspx.cs" Inherits="WebApp.DetalleProyecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<style>

	.tabla-detalle{
		 height:175px; 
		 width:100%
	}
	
	.bar-margin{
		margin-bottom:0px;
	}
	
	.div-monto{
		line-height:175px;
	}
	
	.btn-donar{
		width:100%;
	}
	
	.col-jumbotron{
		padding:0px;
	}
	.monto-text{
			width:100%;
	}
	
	.row-donar{
		padding-bottom:30px;
	}
	
	.jumbotron{
		background-image: url("imagenes/bg.png") !important;
		background-repeat: repeat-x repeat-y !important;
	}
	
	@media (max-width: 992px) {
		.tabla-detalle{
			height:auto;
		}
		.div-monto{
			line-height:60px;
		}
		.wrapper > #bar, .wrapper > img{
			top:auto;
			left:auto;
		}
	
	}
	
	

</style>    
    <div class="container">
    				<div class="row">
					<div class="jumbotron">
						<div class="row">
							<div class="col-md-3 text-center col-jumbotron">
								<div class="wrapper">
                                    <asp:Image CssClass="img-thumbnail" ID="imgPrincipal" runat="server" Height="175" Width="175" />
									<div id="bar">
									</div>
								</div>
							</div>
							<div class="col-md-6 text-center">
								<div class="row">
									<div class="col-md-12">
										<asp:Label runat="server" Font-Size="XX-Large" ID="lblProyecto"></asp:Label>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<asp:Label runat="server" Font-Size="medium" ID="lblOrganizacion"></asp:Label>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<asp:Label runat="server" Font-Size="Small" ID="lblDescripcionOrganizacion">lalalal</asp:Label>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-jumbotron">
								<table class="tabla-detalle">
									<tr>
										<td>
											<div class="progress skill-bar bar-margin">
												<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="<%=this.porcentaje %>" aria-valuemin="0" aria-valuemax="100">
													<span><%=this.porcentaje %>%</span>
												</div>
												
											</div>
											<span class="btn btn-success monto-text">Monto deseado $100</span>
										</td>
									</tr>
                                    <tr>
                                        <td>
                                            <button class="btn btn-info btn-donar btn-lg">Donar</button>
                                        </td>
                                    </tr>
								</table>
							</div>
						</div>
						
					</div>
				</div>
    
    
<%--            <div class="row">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-md-12 text-center col-jumbotron" style="line-height: 30px;">
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
                                    <span class="btn btn-success monto-text"><%=this.porcentaje %>%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
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
                                        <asp:Image ID="imgId" Height="350" Width="100%" runat="server" ImageUrl='<%#Eval("URL") %>' />
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
            $('.carousel').carousel('next');
            porcentaje = <%=this.porcentaje%>;

            $('.progress .progress-bar').css("width",
                function () {
                    return $(this).attr("aria-valuenow") + "%";
                }
            )
        });

    </script>
</asp:Content>
