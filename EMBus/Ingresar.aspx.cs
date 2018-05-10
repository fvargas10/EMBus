using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace EMBus
{
    public partial class Ingresar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["RUT_USUARIO"] = txtrut.Text;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                CatalogUsuario Catusuario = new CatalogUsuario();
                string clave_encriptada = Catusuario.encriptar(txtclave.Text);
                Usuario usuario = new Usuario();
                int tipousuario = Catusuario.ObtenerIdTipoUsuario(txtrut.Text, clave_encriptada);
                string rol_usuario;
                bool estado = Convert.ToBoolean(Catusuario.ObtenerEstadoUsuario(txtrut.Text));

                if (Catusuario.LoginUsuario(txtrut.Text, clave_encriptada) == true && tipousuario == 0 && estado == true)
                {
                    rol_usuario = Catusuario.ObtenerRolTipoUsuario(txtrut.Text, clave_encriptada);
                    Session["ROL_TIPO_USUARIO"] = rol_usuario.ToString();
                    Response.Redirect("Inicio.aspx");
                }

                else
                {
                    if (Catusuario.LoginUsuario(txtrut.Text, clave_encriptada) == true && tipousuario == 1 && estado == true)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Ingreso Satisfactorio Contador')", true);
                        rol_usuario = Catusuario.ObtenerRolTipoUsuario(txtrut.Text, clave_encriptada);
                        Session["ROL_TIPO_USUARIO"] = rol_usuario.ToString();
                        Response.Redirect("Inicio.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Lo sentimos, su cuenta se encuentra bloqueada, contacte al administrador');window.location='Ingresar.aspx';</script>'");
                    }
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Rut y/o clave inválida');window.location='Ingresar.aspx';</script>'");
            }
        }
    }
}
