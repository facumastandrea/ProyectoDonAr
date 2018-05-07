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
            using (ProyectoDonArEntities ent = new ProyectoDonArEntities())
            {
                //Si hay alguien logueado y no tiene intereses cargados, redirige a la página para que los elija
                if(ent.Intereses.Where(i => i.AspNetUser.Email == HttpContext.Current.User.Identity.Name).Count() == 0 && HttpContext.Current.User.Identity.Name != "")
                    Response.Redirect("Account/Intereses.aspx");
            }
        }
    }
}
