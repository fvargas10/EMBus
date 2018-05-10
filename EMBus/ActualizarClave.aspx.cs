using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;

namespace EMBus
{
    public partial class ActualizarClave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string rut_usuario = Session["RUT_USUARIO"].ToString();

            }
            catch
            {
                Response.Redirect("Ingresar.aspx");
            }
        }

        protected void btnrecuperarclave_Click(object sender, EventArgs e)
        {
            try
            {

                CatalogUsuario cat_usuario = new CatalogUsuario();
                string rut_usuario = Session["RUT_USUARIO"].ToString();
                Console.Write(rut_usuario);

                if (txt_clave_nueva.Text == txt_clave_nueva_repeticion.Text)
                {
                    string clave_nueva_encriptada = cat_usuario.encriptar(txt_clave_nueva.Text);
                    string clave_actual_encriptada = cat_usuario.encriptar(txt_clave_actual.Text);

                    cat_usuario.actualizarClaveUsuario(rut_usuario, clave_actual_encriptada, clave_nueva_encriptada);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Clave actualizada exitosamente, vuelva a iniciar sesión para guardar los cambios');window.location='Salir.aspx';</script>'");
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error al actualizar la clave, inténtelo nuevamente');window.location='ActualizarClave.aspx';</script>'");
            }
        }
    }
}