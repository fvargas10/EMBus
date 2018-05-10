using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;

namespace EMBus
{
    public partial class AgregarMarcaBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnagregarmarca_Click(object sender, EventArgs e)
        {

            try
            {
            CatalogMarca catalog_marca = new CatalogMarca();
            Marca marca = new Marca(txtmarca.Text);
            int verificar_marca = catalog_marca.VerificarMarcaExistente(txtmarca.Text.ToUpper());

            if (verificar_marca == 1 || txtmarca.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Ésta marca ya existe o no ha ingresado los datos correctamente');window.location='AgregarMarcaBus.aspx';</script>'");
            }
            else
            {
                if (verificar_marca == 0 && txtmarca.Text != "") 
                {
                    catalog_marca.agregarMarca(marca);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Marca agregada satisfactoriamente');window.location='AgregarMarcaBus.aspx';</script>'");
                }
            }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error al agregar marca, faltan datos');window.location='AgregarMarcaBus.aspx';</script>'");
            }

        }


        protected void btneliminarmarca_Click(object sender, EventArgs e)
        {
            try
            {

                CatalogMarca catalogMarca = new CatalogMarca();
                string marca = ddnombremarca.SelectedValue;
                catalogMarca.eliminarMarca(marca);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Marca eliminada satisfactoriamente');window.location='AgregarMarcaBus.aspx';</script>'");
            }
            catch
            {
            }
        }
    }
}