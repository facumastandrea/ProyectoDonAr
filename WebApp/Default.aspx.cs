using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtPrueba.Text = Context.User.Identity.Name;



            using (ProyectoDonArEntities ent = new ProyectoDonArEntities())
            {
                txtPrueba.Text = (from i in ent.Imagenes select i).First().URL;
            }
        }
    }
}
