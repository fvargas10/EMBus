using Embus.Metodos;
using Project;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMBus
{
    public partial class AdministrarBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.gridBuses.DataBind();
            this.datosBuses.DataBind();
        }

        protected void btnagregarbus_Click(object sender, EventArgs e)
        {
            try
            {
                CatalogBus catbus = new CatalogBus();
                int marca = ddmarca.SelectedIndex;
                int id_oficina = int.Parse(ddidoficina.SelectedValue.ToString());
                int cap = Int32.Parse(capacidad.Text);

                Bus bus_temp = new Bus(patente.Text, marca, id_oficina, apodo.Text, cap, true);

                if (catbus.VerificarPatenteExistente(patente.Text) == 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error, El bus ya se encuentra registrado');window.location='AdministrarBus.aspx';</script>'");
                }
                else
                {
                    catbus.agregarBus(bus_temp);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Bus agregado satisfactoriamente');window.location='AdministrarBus.aspx';</script>'");
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Agregue los datos correspondientes');window.location='AdministrarBus.aspx';</script>'");
            }
        }

        protected void btncambiarestado_Click(object sender, EventArgs e)
        {
            try
            {
                CatalogBus catalog_bus = new CatalogBus();
                string patente = ddpatente.SelectedValue;
                bool estado;
                if (ddestado.SelectedValue == "0")
                {
                    estado = false;
                    catalog_bus.cambiarEstadoBus(patente, estado);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Bus Dado de Baja correctamente');window.location='AdministrarBus.aspx';</script>'");
                }
                else
                {
                    if (ddestado.SelectedValue == "1")
                    {
                        estado = true;
                        catalog_bus.cambiarEstadoBus(patente, estado);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Bus Dado de Alta correctamente');window.location='AdministrarBus.aspx';</script>'");
                    }
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Agregue los datos correspondientes');window.location='AdministrarBus.aspx';</script>'");
            }
        }
    }
}