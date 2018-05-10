using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;
using System.Data;


namespace EMBus
{
    public partial class MiembrosEmpresa : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            this.gridMiembros.DataBind();
            this.datosMiembros.DataBind();
            this.gridMiembros2.DataBind();
            this.datosMiembros2.DataBind();

        }

        protected void btnagregarmiembro_Click(object sender, EventArgs e)
        {

            try
            {
                int id_oficina = int.Parse(ddidoficina.SelectedValue.ToString());
                int tipousuario = int.Parse(ddidtipousuario.SelectedValue.ToString());
                int tel = Int32.Parse(txttel.Text);
                if (tipousuario == 2)//conductor
                {
                    CatalogConductor catcon = new CatalogConductor();
                    Conductor conductor = new Conductor(txtrutconductor.Text, id_oficina, tipousuario, txtprimernombre.Text, txtsegundonombre.Text, txtprimerapellido.Text, txtsegundoapellido.Text, tel, true);
                    catcon.agregarConductor(conductor);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Conductor creado satisfactoriamente');window.location='MiembrosEmpresa.aspx';</script>'");
                }
                else
                {
                    CatalogAuxiliar cataux = new CatalogAuxiliar();
                    Auxiliar auxiliar = new Auxiliar(txtrutconductor.Text, tipousuario, id_oficina, txtprimernombre.Text, txtsegundonombre.Text, txtprimerapellido.Text, txtsegundoapellido.Text, tel, true);
                    cataux.agregarAuxiliar(auxiliar);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Auxiliar creado satisfactoriamente');window.location='MiembrosEmpresa.aspx';</script>'");
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error al ingresar datos, miembro ya existe');window.location='MiembrosEmpresa.aspx';</script>'");
            }

        }

        protected void ddruttrabajador_SelectedIndexChanged(object sender, EventArgs e)
        {

            CatalogConductor catalogConductor = new CatalogConductor();
            string rut_conductor = ddruttrabajador.SelectedValue;

            txtprimernombreupdate.Text = Convert.ToString(catalogConductor.RellenarCamposRutConductor(rut_conductor, 1).Primer_nombre_con.ToString());
            txtsegundonombreupdate.Text = Convert.ToString(catalogConductor.RellenarCamposRutConductor(rut_conductor, 2).Segundo_nombre_con.ToString());
            txtprimerapellidoupdate.Text = Convert.ToString(catalogConductor.RellenarCamposRutConductor(rut_conductor, 3).Primer_apellido_con.ToString());
            txtsegundoapellidoupdate.Text = Convert.ToString(catalogConductor.RellenarCamposRutConductor(rut_conductor, 4).Segundo_apellido_con.ToString());
            txttelefonoupdate.Text = Convert.ToString(catalogConductor.RellenarCamposRutConductor(rut_conductor, 5).Tel_con.ToString());
        }

        protected void btnactualizarmiembro_Click(object sender, EventArgs e)
        {
            try
            {
                string rut_trabajador = ddruttrabajador.SelectedValue;
                CatalogConductor catalogConductor = new CatalogConductor();

                if (catalogConductor.VerificarTipoTrabajador(rut_trabajador) == "Auxiliar")
                {
                    CatalogAuxiliar catalogAuxiliar = new CatalogAuxiliar();
                    catalogAuxiliar.ActualizarDatosAuxiliar(rut_trabajador, txtprimernombreupdate.Text, txtsegundonombreupdate.Text, txtprimerapellidoupdate.Text, txtsegundoapellidoupdate.Text, Int32.Parse(txttelefonoupdate.Text));
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Auxiliar actualizado correctamente');window.location='MiembrosEmpresa.aspx';</script>'");
                }
                else
                {
                    catalogConductor.ActualizarDatos(rut_trabajador, txtprimernombreupdate.Text, txtsegundonombreupdate.Text, txtprimerapellidoupdate.Text, txtsegundoapellidoupdate.Text, Int32.Parse(txttelefonoupdate.Text));
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Conductor actualizado correctamente');window.location='MiembrosEmpresa.aspx';</script>'");
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('No ha seleccionado un miembro');window.location='MiembrosEmpresa.aspx';</script>'");
            }
        }

        protected void btncambiarestadomiembro_Click(object sender, EventArgs e)
        {
            try
            {
                CatalogConductor catalog_con = new CatalogConductor();
                CatalogAuxiliar catalog_aux = new CatalogAuxiliar();
                string rut = ddbajamiembros.SelectedValue;
                bool estado;

                if (catalog_con.VerificarTipoTrabajador(rut) == "Auxiliar" && ddcambiarestadomimebro.SelectedValue == "0")
                {
                    estado = false;
                    catalog_aux.cambiarEstadoAuxiliar(rut, estado);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Miembro Dado de Baja correctamente');window.location='MiembrosEmpresa.aspx';</script>'");
                }
                else
                {
                    if (catalog_con.VerificarTipoTrabajador(rut) == "Auxiliar" && ddcambiarestadomimebro.SelectedValue == "1")
                    {
                        estado = true;
                        catalog_aux.cambiarEstadoAuxiliar(rut, estado);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Miembro Dado de Alta correctamente');window.location='MiembrosEmpresa.aspx';</script>'");
                    }

                    if (catalog_con.VerificarTipoTrabajador(rut) == "Conductor" && ddcambiarestadomimebro.SelectedValue == "0")
                    {
                        estado = false;
                        catalog_con.cambiarEstadoConductor(rut, estado);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Miembro Dado de Baja correctamente');window.location='MiembrosEmpresa.aspx';</script>'");
                    }

                    if (catalog_con.VerificarTipoTrabajador(rut) == "Conductor" && ddcambiarestadomimebro.SelectedValue == "1")
                    {
                        estado = true;
                        catalog_con.cambiarEstadoConductor(rut, estado);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Miembro Dado de Alta correctamente');window.location='MiembrosEmpresa.aspx';</script>'");
                    }
                }
            }
            catch
            {
            }
        }
    }
}
