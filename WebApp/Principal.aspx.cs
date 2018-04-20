using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Principal : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            using (ProyectoDonArEntities ent = new ProyectoDonArEntities())
            {
                int i = 1;
                rptTiposProyectos.DataSource = ent.TiposProyectos.ToArray();
                rptTiposProyectos.DataBind();

                
                rptProyectos.DataSource = ent.Imagenes.Where(ti =>ti.IdTipoImagen == 4).ToArray();
                rptProyectos.DataBind();
            }
        }
    }
}