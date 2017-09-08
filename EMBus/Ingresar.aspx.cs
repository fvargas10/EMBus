using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;

namespace EMBus
{
    public partial class Ingresar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            CatalogAdministrador catdmin = new CatalogAdministrador();
            Administrador admin = new Administrador();
            int rut = Int32.Parse(txtrut.Text);
            bool ok = catdmin.IngresoAdmin(rut, txtclave.Text);
            if (ok)
            {
                Session["ok"] = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('LOGIN OK')", true);
                admin = catdmin.GetNameAdmin(rut, txtclave.Text);
                Session["NOM_ADMIN"] = admin.Nom_admin.ToString();
                Response.Redirect("AgregarBus.aspx");

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('LOGIN IS WRONG')", true);
            }
        }
    }
}
