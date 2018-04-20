using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class DetalleProyecto : System.Web.UI.Page
    {
        public string porcentaje;
            
        protected void Page_Load(object sender, EventArgs e)
        {
            //int idproyecto = int.Parse(Request["idProyecto"]);
            int idproyecto = 4;

            //TODO: Pasar a sus respectivas clases y hacer métodos lindos, tengo que ver cómo hacer para que no se rompa al actualizar el model.
            using (ProyectoDonArEntities ent = new ProyectoDonArEntities())
            {
                Proyecto proyecto = (from p in ent.Proyectos select p).Where(p => p.idProyecto == idproyecto) .First();
                //Proyecto proyecto = (from p in ent.Proyectos select p).Where(p => p.idProyecto == 4).First();

                Rgallary.DataSource = proyecto.Imagenes.Where(t => t.IdTipoImagen == 3).ToArray(); //Slides
                Rgallary.DataBind();

                imgPrincipal.ImageUrl = proyecto.Imagenes.Where(t => t.IdTipoImagen == 4).First().URL; //Principal

                porcentaje = ((proyecto.MontoActual * 100) / proyecto.MontoDeseado).ToString().Replace(",", ".");

                lblProyecto.Text = proyecto.Nombre;
                lblOrganizacion.Text = proyecto.Organizacione.Nombre;
                lblDescripcionOrganizacion.Text = proyecto.Organizacione.Descripcion;

                lblDerecha.Text = proyecto.Textos.Where(t => t.idTipoTexto == 4).First().Texto1; //texto derecha
                lblIzquierda.Text = proyecto.Textos.Where(t => t.idTipoTexto == 3).First().Texto1; //texto izquierda
            }
        }
    }
}