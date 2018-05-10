using Embus.Metodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMBus
{
    public partial class ModificarTarifas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnactualizartarifa_Click(object sender, EventArgs e)
        {
            try
            {
                CatalogBoleto catalogBoleto = new CatalogBoleto();
                int valor_antiguo = Int32.Parse(ddtarifas.SelectedValue);
                int valor_nuevo = Int32.Parse(txttarifanueva.Text);

                if (catalogBoleto.VerificarTarifaExistente(valor_nuevo) == 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error, ya existe una tarifa con éste valor');window.location='ModificarTarifas.aspx';</script>'");
                }
                else
                {
                    catalogBoleto.cambiarTarifas(valor_antiguo, valor_nuevo);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Tarifa modificada exitosamente');window.location='ModificarTarifas.aspx';</script>'");
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('No ha ingresado un valor válido);window.location='ModificarTarifas.aspx';</script>'");
            }

        }
    }
}