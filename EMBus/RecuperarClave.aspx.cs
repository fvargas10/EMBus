using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;

namespace EMBus
{
    public partial class RecuperarClave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnrecuperarclave_Click(object sender, EventArgs e)
        {
            CatalogUsuario cat_usuario = new CatalogUsuario();
            string correo = cat_usuario.obtenerCorreo(txt_rut_usuario.Text);            
            cat_usuario.recuperarClave(txt_rut_usuario.Text, correo);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Se ha enviado una nueva clave a su dirección de correo electrónico');window.location='RecuperarClave.aspx';</script>'");

        }
    }
}