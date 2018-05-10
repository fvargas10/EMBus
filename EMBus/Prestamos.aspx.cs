using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;

namespace EMBus
{
    public partial class Prestamos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnguardarprestamo_Click(object sender, EventArgs e)
        {
            try
            {
                int valor_prestamo = Int32.Parse(txtvalorprestamo.Text);
                DateTime fecha_prestamo = Convert.ToDateTime(txtfechaprestamo.Text);
                CatalogPrestamo cat_prestamo = new CatalogPrestamo();
                string trabajador = ddTrabajadores.SelectedValue;
                Prestamo prestamo = new Prestamo(valor_prestamo, fecha_prestamo, trabajador);

                cat_prestamo.agregarPrestamo(prestamo);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Prestamo agregado satisfactoriamente');window.location='Prestamos.aspx';</script>'");
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error al agregar prestamo, faltan datos');window.location='Prestamos.aspx';</script>'");
            }
        }
    }
}