using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;

namespace EMBus
{
    public partial class AdministrarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnagregarcontador_Click(object sender, EventArgs e)
        {
            try
            {

                CatalogUsuario cat_usuario = new CatalogUsuario();
                int telefono = Int32.Parse(txt_telefono.Text);

                string rut = this.txt_rut_usuario.Text; //obtengo el rut del contador registrado           
                Console.Write(rut);

                string[] cortar_digito_rut = rut.Split('-');
                Console.Write(cortar_digito_rut);

                string rut_sin_digito = cortar_digito_rut[0];
                Console.Write(rut_sin_digito);

                string clave_encriptada = cat_usuario.encriptar(rut_sin_digito);
                Console.Write(clave_encriptada);


                Usuario usuario = new Usuario(txt_rut_usuario.Text, 1, clave_encriptada, txt_primer_nombre.Text, txt_segundo_nombre.Text, txt_primer_apellido.Text, txt_segundo_apellido.Text, telefono, txt_direccion.Text, txt_correo_usuario.Text, 1);
                cat_usuario.agregarUsuario(usuario);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Contador agregado satisfactoriamente');window.location='AdministrarUsuario.aspx';</script>'");
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error al agregar el contador, Usuario ya existe');window.location='AdministrarUsuario.aspx';</script>'");
            }
        }
    }
}