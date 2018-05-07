using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApp.Account
{
    public partial class Intereses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                using (ProyectoDonArEntities ent = new ProyectoDonArEntities())
                {
                    rptIntereses.DataSource = ent.TiposProyectos.ToArray();
                    rptIntereses.DataBind();
                }
            }
        }

        protected void btnListo_Click(object sender, EventArgs e)
        {
            //string idUsuario = "294f5ded-2707-4c3a-b1f5-e4a79a0212cc";
            using (ProyectoDonArEntities ent = new ProyectoDonArEntities())
            {
                foreach (RepeaterItem item in rptIntereses.Items)
                {

                    HtmlInputCheckBox chbInteres = (HtmlInputCheckBox)item.FindControl("chbInteres");
                    if (chbInteres.Checked)
                    {
                        Interes i = new Interes
                        {
                            idUsuario = ent.AspNetUsers.Where(u=> u.Email == HttpContext.Current.User.Identity.Name).First().Id,
                            idTipoProyecto = int.Parse(chbInteres.Value)
                        };
                        ent.Intereses.Add(i);
                    }
                }
                ent.SaveChanges();
            }

            ClientScript.RegisterClientScriptBlock(this.GetType(), "listo", "window.close();", true);

        }

        protected void rptIntereses_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            var a = (HtmlInputCheckBox)e.Item.FindControl("chbInteres");
            a.Value = ((TiposProyecto)e.Item.DataItem).idTipoProyecto.ToString();
        }
    }
}