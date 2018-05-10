using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Drawing;
using iTextSharp.text.html;

namespace EMBus
{
    public partial class Caja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string id_tipo_usuario = Session["ID_TIPO_USUARIO"].ToString();

            }
            catch
            {
                Response.Redirect("Ingresar.aspx");
            }
        }

        protected void btnagregarcaja_Click(object sender, EventArgs e)
        {
            try
            {

                CatalogCaja catcaj = new CatalogCaja();//para utilizar el metodo que agrega la caja diaria por bus

                DateTime fecha_arqueo = Convert.ToDateTime(txtfechaarqueo.Text);//fecha del arqueo

                //DEFINICIÓN DE LOS BOLETOS A UTILIZAR EN EL ARQUEO DESDE 1200 A 300
                //BOLETOS DE 1200
                CatalogBoleto cbol1200 = new CatalogBoleto();//POO
                Boleto bol1200 = cbol1200.buscarBoletoId(Int32.Parse(ddvalor1.SelectedValue));

                //BOLETOS DE 1000
                CatalogBoleto cbol1000 = new CatalogBoleto();//POO
                Boleto bol1000 = cbol1200.buscarBoletoId(Int32.Parse(ddvalor2.SelectedValue));

                //BOLETOS DE 800
                CatalogBoleto cbol800 = new CatalogBoleto();//POO
                Boleto bol800 = cbol800.buscarBoletoId(Int32.Parse(ddvalor3.SelectedValue));

                //BOLETOS DE 700
                CatalogBoleto cbol700 = new CatalogBoleto();//POO
                Boleto bol700 = cbol700.buscarBoletoId(Int32.Parse(ddvalor4.SelectedValue));

                //BOLETOS DE 600
                CatalogBoleto cbol600 = new CatalogBoleto();//POO
                Boleto bol600 = cbol700.buscarBoletoId(Int32.Parse(ddvalor5.SelectedValue));

                //BOLETOS DE 500
                CatalogBoleto cbol500 = new CatalogBoleto();//POO
                Boleto bol500 = cbol500.buscarBoletoId(Int32.Parse(ddvalor6.SelectedValue));

                //BOLETOS DE 400
                CatalogBoleto cbol400 = new CatalogBoleto();//POO
                Boleto bol400 = cbol400.buscarBoletoId(Int32.Parse(ddvalor7.SelectedValue));

                //BOLETOS DE 300
                CatalogBoleto cbol300 = new CatalogBoleto();//POO
                Boleto bol300 = cbol300.buscarBoletoId(Int32.Parse(ddvalor8.SelectedValue));
                //FIN DEFINICIÓN DE BOLETOS A UTILIZAR EN EL ARQUEO

                //OBTENER EL AUXILIAR EN EL ARQUEO
                CatalogAuxiliar cataux = new CatalogAuxiliar();//POO
                Auxiliar aux = cataux.buscarAuxiliarRut(ddauxiliar.SelectedValue.ToString());

                //OBTENER PATENTE DEL BUS EN EL ARQUEO
                CatalogBus catbus = new CatalogBus();//POO
                Bus bus = catbus.buscarBusPorPatente(ddpatentebus.SelectedValue.ToString());

                //OBTENER CONDUCTOR EN EL ARQUEO
                CatalogConductor catcon = new CatalogConductor();//POO
                Conductor con = catcon.buscarConductorRut(ddconductor.SelectedValue.ToString());

                //CAJA
                //A CONTINUACIÓN SE ALMACENAN TODAS LAS SERIES INGRESADAS
                //SERIES DE 1200
                string si1200 = serieInicio1200.Text;//seteo la serie ingresada a una variable
                string sf1200 = serieFin1200.Text;//seteo la serie ingresada a una variable
                int bol_cor1200 = Int32.Parse(boletosCortados1200.Text);//transformo los boletos cortados a entero

                int total_boletos_1200 = Int32.Parse(total1200.Text);//transormo el total de 1200 a entero

                //SERIES DE 1000
                string si1000 = serieInicio1000.Text;
                string sf1000 = serieFin1000.Text;
                int bol_cor1000 = Int32.Parse(boletosCortados1000.Text);
                int total_boletos_1000 = Int32.Parse(total1000.Text);

                //SERIES DE 800
                string si800 = serieInicio800.Text;
                string sf800 = serieFin800.Text;
                int bol_cor800 = Int32.Parse(boletosCortados800.Text);
                int total_boletos_800 = Int32.Parse(total800.Text);

                //SERIES DE 700
                string si700 = serieInicio700.Text;
                string sf700 = serieFin700.Text;
                int bol_cor700 = Int32.Parse(boletosCortados700.Text);
                int total_boletos_700 = Int32.Parse(total700.Text);

                //SERIES DE 600
                string si600 = serieInicio600.Text;
                string sf600 = serieFin600.Text;
                int bol_cor600 = Int32.Parse(boletosCortados600.Text);
                int total_boletos_600 = Int32.Parse(total600.Text);

                //SERIES DE 500
                string si500 = serieInicio500.Text;
                string sf500 = serieFin500.Text;
                int bol_cor500 = Int32.Parse(boletosCortados500.Text);
                int total_boletos_500 = Int32.Parse(total500.Text);

                //SERIES DE 400
                string si400 = serieInicio400.Text;
                string sf400 = serieFin400.Text;
                int bol_cor400 = Int32.Parse(boletosCortados400.Text);
                int total_boletos_400 = Int32.Parse(total400.Text);

                //SERIES DE 300
                string si300 = serieInicio300.Text;
                string sf300 = serieFin300.Text;
                int bol_cor300 = Int32.Parse(boletosCortados300.Text);
                int total_boletos_300 = Int32.Parse(total300.Text);
                //FIN SERIES DE BOLETOS


                //DEPENDEN DE LAS SERIES LOS SIGUIENTES ELEMENTOS:
                //TOTAL VENDIDO SIN BOLETOS-TOTAL DE INGRESOS-TOTAL DE GASTOS-TOTAL FINAL-BONO CONDUCTOR-BONO AUXILIAR-TURNO            
                //SE ALMACENAN ESTOS ELEMENTOS YA CALCULADOS EN EL SISTEMA
                int sin_bol = Int32.Parse(txtsinboletos.Text);
                int t_ingresos = Int32.Parse(txttotalingresos.Text);
                int t_gastos = Int32.Parse(txttotalgastos.Text);
                int t_final = Int32.Parse(txttotalfinal.Text);
                int bono_con = Int32.Parse(txtbonoconductor.Text);
                int bono_aux = Int32.Parse(txtbonoauxiliar.Text);
                int turno = Int32.Parse(ddturnos.SelectedValue);
                string numero_vueltas = ddnumerovueltas.SelectedValue.ToString();

                //DECLARACIÓN DE LOS GASTOS DE UN BUS POR DIA
                CatalogDetalleGasto catdetgasto = new CatalogDetalleGasto();//metodo que guarda los gastos de cada bus por dia
                string patente = ddpatentebus.SelectedValue.ToString();

                //GASTOS PETROLEO
                int petroleo = Int32.Parse(ddpetroleo.SelectedValue);
                int valor_petroleo = Int32.Parse(txtpetroleo.Text);
                string detalle_petroleo = txtobservacionespetroleo.InnerText;

                //GASTOS ANDENES
                int andenes = Int32.Parse(ddandenes.SelectedValue);
                int valor_andenes = Int32.Parse(txtandenes.Text);
                string detalle_andenes = txtobservacionesandenes.InnerText;

                //GASTOS COLACIONES
                int colaciones = Int32.Parse(ddcolaciones.SelectedValue);
                int valor_colaciones = Int32.Parse(txtcolaciones.Text);
                string detalle_colaciones = txtobservacionescolaciones.InnerText;

                //GASTOS ASEO
                int aseo = Int32.Parse(ddaseo.SelectedValue);
                int valor_aseo;
                if (txtaseo.Text == "")
                {
                    txtaseo.Text = "0";
                    valor_aseo = Int32.Parse(txtaseo.Text);
                }
                else
                {
                    valor_aseo = Int32.Parse(txtaseo.Text);
                }
                valor_aseo = Int32.Parse(txtaseo.Text);
                string detalle_aseo = txtobservacionesaseo.InnerText;

                //GASTOS MANTENCION
                int mantencion = Int32.Parse(ddmantencion.SelectedValue);
                int valor_mantencion;
                if (txtmantencion.Text == "")
                {
                    txtmantencion.Text = "0";
                    valor_mantencion = Int32.Parse(txtmantencion.Text);
                }
                else
                {
                    valor_aseo = Int32.Parse(txtaseo.Text);
                }
                valor_mantencion = Int32.Parse(txtmantencion.Text);
                string detalle_mantencion = txtobservacionesmantencion.InnerText;

                //GASTOS PEAJES
                int peajes = Int32.Parse(ddpeajes.SelectedValue);
                int valor_peajes;
                if (txtpeajes.Text == "")
                {
                    txtpeajes.Text = "0";
                    valor_peajes = Int32.Parse(txtpeajes.Text);
                }
                else
                {
                    valor_peajes = Int32.Parse(txtpeajes.Text);
                }
                valor_peajes = Int32.Parse(txtpeajes.Text);
                string detalle_peajes = txtobservacionespeajes.InnerText;

                //GASTOS NOQUERAS
                int noqueras = Int32.Parse(ddnoqueras.SelectedValue);
                int valor_noqueras;
                if (txtnoqueras.Text == "")
                {
                    txtnoqueras.Text = "0";
                    valor_noqueras = Int32.Parse(txtnoqueras.Text);
                }
                else
                {
                    valor_noqueras = Int32.Parse(txtnoqueras.Text);
                }
                valor_noqueras = Int32.Parse(txtnoqueras.Text);
                string detalle_noqueras = txtobservacionesnoqueras.InnerText;

                //GASTOS UTILES DE OFICINA
                int utiles_oficina = Int32.Parse(ddutilesoficina.SelectedValue);
                int valor_utiles_oficina;
                if (txtutilesoficina.Text == "")
                {
                    txtutilesoficina.Text = "0";
                    valor_utiles_oficina = Int32.Parse(txtutilesoficina.Text);
                }
                else
                {
                    valor_utiles_oficina = Int32.Parse(txtutilesoficina.Text);
                }
                valor_utiles_oficina = Int32.Parse(txtutilesoficina.Text);
                string detalle_utiles_oficina = txtobservacionesutiles.InnerText;


                //DECLARACIÓN DE GASTOS SEGÚN EL TIPO
                DetalleGasto gasto1 = new DetalleGasto(patente, petroleo, fecha_arqueo, valor_petroleo, detalle_petroleo);
                DetalleGasto gasto2 = new DetalleGasto(patente, andenes, fecha_arqueo, valor_andenes, detalle_andenes);
                DetalleGasto gasto3 = new DetalleGasto(patente, colaciones, fecha_arqueo, valor_colaciones, detalle_colaciones);
                DetalleGasto gasto4 = new DetalleGasto(patente, aseo, fecha_arqueo, valor_aseo, detalle_aseo);
                DetalleGasto gasto5 = new DetalleGasto(patente, mantencion, fecha_arqueo, valor_mantencion, detalle_mantencion);
                DetalleGasto gasto6 = new DetalleGasto(patente, peajes, fecha_arqueo, valor_peajes, detalle_peajes);
                DetalleGasto gasto7 = new DetalleGasto(patente, noqueras, fecha_arqueo, valor_noqueras, detalle_noqueras);
                DetalleGasto gasto8 = new DetalleGasto(patente, utiles_oficina, fecha_arqueo, valor_utiles_oficina, detalle_utiles_oficina);

                //AGREGANDO LOS TIPOS DE GASTOS A LA BASE DE DATOS
                catdetgasto.agregarDetalleGasto(gasto1);
                catdetgasto.agregarDetalleGasto(gasto2);
                catdetgasto.agregarDetalleGasto(gasto3);
                catdetgasto.agregarDetalleGasto(gasto4);
                catdetgasto.agregarDetalleGasto(gasto5);
                catdetgasto.agregarDetalleGasto(gasto6);
                catdetgasto.agregarDetalleGasto(gasto7);
                catdetgasto.agregarDetalleGasto(gasto8);

                //CREACIÓN DEL ARQUEO CON TODOS LOS ELEMENTOS YA CALCULADOS Y LISTOS PARA GUARDAR EN LA BASE DE DATOS
                Arqueo arq1200 = new Arqueo(bol1200, aux, bus, con, si1200, sf1200, bol_cor1200, total_boletos_1200, fecha_arqueo, sin_bol, t_ingresos, t_gastos, t_final, bono_con, bono_aux, turno, numero_vueltas);
                Arqueo arq1000 = new Arqueo(bol1000, aux, bus, con, si1000, sf1000, bol_cor1000, total_boletos_1000, fecha_arqueo, sin_bol, t_ingresos, t_gastos, t_final, bono_con, bono_aux, turno, numero_vueltas);
                Arqueo arq800 = new Arqueo(bol800, aux, bus, con, si800, sf800, bol_cor800, total_boletos_800, fecha_arqueo, sin_bol, t_ingresos, t_gastos, t_final, bono_con, bono_aux, turno, numero_vueltas);
                Arqueo arq700 = new Arqueo(bol700, aux, bus, con, si700, sf700, bol_cor700, total_boletos_700, fecha_arqueo, sin_bol, t_ingresos, t_gastos, t_final, bono_con, bono_aux, turno, numero_vueltas);
                Arqueo arq600 = new Arqueo(bol600, aux, bus, con, si600, sf600, bol_cor600, total_boletos_600, fecha_arqueo, sin_bol, t_ingresos, t_gastos, t_final, bono_con, bono_aux, turno, numero_vueltas);
                Arqueo arq500 = new Arqueo(bol500, aux, bus, con, si500, sf500, bol_cor500, total_boletos_500, fecha_arqueo, sin_bol, t_ingresos, t_gastos, t_final, bono_con, bono_aux, turno, numero_vueltas);
                Arqueo arq400 = new Arqueo(bol400, aux, bus, con, si400, sf400, bol_cor400, total_boletos_400, fecha_arqueo, sin_bol, t_ingresos, t_gastos, t_final, bono_con, bono_aux, turno, numero_vueltas);
                Arqueo arq300 = new Arqueo(bol300, aux, bus, con, si300, sf300, bol_cor300, total_boletos_300, fecha_arqueo, sin_bol, t_ingresos, t_gastos, t_final, bono_con, bono_aux, turno, numero_vueltas);

                //AGREGANDO LOS ARQUEOS A LA BASE DE DATOS
                catcaj.agregarArqueo(arq1200);
                catcaj.agregarArqueo(arq1000);
                catcaj.agregarArqueo(arq800);
                catcaj.agregarArqueo(arq700);
                catcaj.agregarArqueo(arq600);
                catcaj.agregarArqueo(arq500);
                catcaj.agregarArqueo(arq400);
                catcaj.agregarArqueo(arq300);

                /*################################  PDF  ############################################*/
                /*Generación del documento pdf*/
                Document pdfDocument = new Document(PageSize.A4.Rotate(), 10f, 10f, 10f, 10f);
                PdfWriter.GetInstance(pdfDocument, Response.OutputStream);
                pdfDocument.AddAuthor("EMBus Los Muermos");
                pdfDocument.Open();

                iTextSharp.text.Font _standardFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 12, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
                var boldFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12);
                var boldFontFecha = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 10);

                iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(MapPath("/img/logopdf.png"));
                logo.Alignment = iTextSharp.text.Image.ALIGN_CENTER;
                logo.ScaleAbsolute(100f, 30f);

                Paragraph paragraph_fecha_hoy = new Paragraph("FECHA CREACION: " + DateTime.Now, boldFontFecha);
                paragraph_fecha_hoy.Alignment = Element.ALIGN_LEFT;

                Paragraph paragraph_empresa = new Paragraph("TRANSPORTE EMBUS S.P.A", boldFontFecha);
                paragraph_empresa.Alignment = Element.ALIGN_LEFT;

                Paragraph paragraph_fecha_caja = new Paragraph("FECHA CAJA: " + txtfechaarqueo.Text, boldFontFecha);
                paragraph_fecha_caja.Alignment = Element.ALIGN_LEFT;

                Paragraph paragraph_bus = new Paragraph("BUS: " + ddpatentebus.SelectedValue, boldFontFecha);
                paragraph_bus.Alignment = Element.ALIGN_LEFT;

                Paragraph vueltas = new Paragraph("NUMERO DE VUELTAS: " + ddnumerovueltas.SelectedItem, boldFontFecha);
                vueltas.Alignment = Element.ALIGN_LEFT;

                Paragraph turnos = new Paragraph("TURNO: " + ddturnos.SelectedItem, boldFontFecha);
                turnos.Alignment = Element.ALIGN_LEFT;

                Paragraph paragraph = new Paragraph("CAJA DIARIA TRANSPORTES EMBUS LOS MUERMOS", boldFont);
                paragraph.Alignment = Element.ALIGN_CENTER;

                /*creacion de la tabla de caja diaria*/
                //creacion tabla numero 1, obtener dias trabajados
                PdfPTable pdfTableCaja = new PdfPTable(5);
                pdfTableCaja.WidthPercentage = 80;
                pdfTableCaja.HorizontalAlignment = Element.ALIGN_CENTER;

                /*PRIMERA FILA*/
                PdfPCell Boletos = new PdfPCell(new Phrase("Boletos", _standardFont));
                Boletos.BorderWidth = 0;
                Boletos.BorderWidthBottom = 0.75f;
                Boletos.BackgroundColor = new BaseColor(52, 209, 176);
                pdfTableCaja.AddCell(Boletos);

                PdfPCell Serie_inicio = new PdfPCell(new Phrase("Serie Fin", _standardFont));
                Serie_inicio.BorderWidth = 0;
                Serie_inicio.BorderWidthBottom = 0.75f;
                Serie_inicio.BackgroundColor = new BaseColor(52, 209, 176);
                pdfTableCaja.AddCell(Serie_inicio);

                PdfPCell Serie_fin = new PdfPCell(new Phrase("Serie Inicio", _standardFont));
                Serie_fin.BorderWidth = 0;
                Serie_fin.BorderWidthBottom = 0.75f;
                Serie_fin.BackgroundColor = new BaseColor(52, 209, 176);
                pdfTableCaja.AddCell(Serie_fin);

                PdfPCell Boletos_cortados = new PdfPCell(new Phrase("Boletos Cortados", _standardFont));
                Boletos_cortados.BorderWidth = 0;
                Boletos_cortados.BorderWidthBottom = 0.75f;
                Boletos_cortados.BackgroundColor = new BaseColor(52, 209, 176);
                pdfTableCaja.AddCell(Boletos_cortados);

                PdfPCell Total_dinero = new PdfPCell(new Phrase("Total En Dinero", _standardFont));
                Total_dinero.BorderWidth = 0;
                Total_dinero.BorderWidthBottom = 0.75f;
                Total_dinero.BackgroundColor = new BaseColor(52, 209, 176);
                pdfTableCaja.AddCell(Total_dinero);

                /*FIN PRIMERA FILA*/

                /*SEGUNDA FILA*/
                pdfTableCaja.AddCell(ddvalor1.Text);
                pdfTableCaja.AddCell(serieFin1200.Text);
                pdfTableCaja.AddCell(serieInicio1200.Text);
                pdfTableCaja.AddCell(boletosCortados1200.Text);
                pdfTableCaja.AddCell("$" + total1200.Text);
                /*FIN SEGUNDA FILA*/

                /*TERCERA FILA*/
                pdfTableCaja.AddCell(ddvalor2.Text);
                pdfTableCaja.AddCell(serieFin1000.Text);
                pdfTableCaja.AddCell(serieInicio1000.Text);
                pdfTableCaja.AddCell(boletosCortados1000.Text);
                pdfTableCaja.AddCell("$" + total1000.Text);
                /*FIN TERCERA FILA*/

                /*CUARTA FILA*/
                pdfTableCaja.AddCell(ddvalor3.Text);
                pdfTableCaja.AddCell(serieFin800.Text);
                pdfTableCaja.AddCell(serieInicio800.Text);
                pdfTableCaja.AddCell(boletosCortados800.Text);
                pdfTableCaja.AddCell("$" + total800.Text);
                /*FIN CUARTA FILA*/

                /*QUINTA FILA*/
                pdfTableCaja.AddCell(ddvalor4.Text);
                pdfTableCaja.AddCell(serieFin700.Text);
                pdfTableCaja.AddCell(serieInicio700.Text);
                pdfTableCaja.AddCell(boletosCortados700.Text);
                pdfTableCaja.AddCell("$" + total700.Text);
                /*FIN QUINTA FILA*/

                /*SEXTA FILA*/
                pdfTableCaja.AddCell(ddvalor5.Text);
                pdfTableCaja.AddCell(serieFin600.Text);
                pdfTableCaja.AddCell(serieInicio600.Text);
                pdfTableCaja.AddCell(boletosCortados600.Text);
                pdfTableCaja.AddCell("$" + total600.Text);
                /*FIN SEXTA FILA*/

                /*SEPTIMA FILA*/
                pdfTableCaja.AddCell(ddvalor6.Text);
                pdfTableCaja.AddCell(serieFin500.Text);
                pdfTableCaja.AddCell(serieInicio500.Text);
                pdfTableCaja.AddCell(boletosCortados500.Text);
                pdfTableCaja.AddCell("$" + total500.Text);
                /*FIN SEPTIMA FILA*/

                /*OCTAVA FILA*/
                pdfTableCaja.AddCell(ddvalor7.Text);
                pdfTableCaja.AddCell(serieFin400.Text);
                pdfTableCaja.AddCell(serieInicio400.Text);
                pdfTableCaja.AddCell(boletosCortados400.Text);
                pdfTableCaja.AddCell("$" + total400.Text);
                /*FIN OCTAVA FILA*/

                /*NOVENA FILA*/
                pdfTableCaja.AddCell(ddvalor8.Text);
                pdfTableCaja.AddCell(serieFin300.Text);
                pdfTableCaja.AddCell(serieInicio300.Text);
                pdfTableCaja.AddCell(boletosCortados300.Text);
                pdfTableCaja.AddCell("$" + total300.Text);
                /*FIN NOVENA FILA*/

                /*DECIMA FILA*/
                pdfTableCaja.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;
                pdfTableCaja.AddCell("TOTAL INGRESOS: ");
                pdfTableCaja.AddCell("$" + txttotalingresos.Text);
                /*FIN DECIMA FILA*/

                /*UNDECIMA FILA*/
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell("TOTAL ENTREGADO: ");
                pdfTableCaja.AddCell("$" + txttotalentregado.Text);
                /*FIN UNDECIMA FILA*/

                /*DUODECIMA FILA*/
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell("ESTADO (+/-): ");
                pdfTableCaja.AddCell("$" + txtsinboletos.Text);
                /*FIN DUODECIMA FILA*/

                /*DUODECIMA FILA*/
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell(" ");
                pdfTableCaja.AddCell("CAJA FINAL: ");
                pdfTableCaja.AddCell("$" + txttotalcaja.Text);
                /*FIN DUODECIMA FILA*/

                

                Paragraph rut_conductor = new Paragraph("CONDUCTOR: " + ddconductor.SelectedValue + " / " + ddconductor.SelectedItem + " / " + "20% : " + "$" + txtbonoconductor.Text, boldFontFecha);
                rut_conductor.Alignment = Element.ALIGN_LEFT;

                Paragraph rut_auxiliar = new Paragraph("AUXILIAR: " + ddauxiliar.SelectedValue + " / " + ddauxiliar.SelectedItem + " / " +  "$" + txtbonoauxiliar.Text, boldFontFecha);
                rut_auxiliar.Alignment = Element.ALIGN_LEFT;

                Paragraph titulo_gastos = new Paragraph("DECLARACION DE GASTOS DEL DIA", boldFontFecha);
                titulo_gastos.Alignment = Element.ALIGN_CENTER;

                PdfPTable pdfTableGastos = new PdfPTable(2);
                pdfTableGastos.WidthPercentage = 50;
                pdfTableGastos.HorizontalAlignment = Element.ALIGN_CENTER;

                /*PRIMERA FILA*/
                PdfPCell tipo_gasto = new PdfPCell(new Phrase("Tipo De Gasto", _standardFont));
                tipo_gasto.BorderWidth = 0;
                tipo_gasto.BorderWidthBottom = 0.75f;
                tipo_gasto.BackgroundColor = new BaseColor(78, 185, 232);
                pdfTableGastos.AddCell(tipo_gasto);

                PdfPCell valor_gasto = new PdfPCell(new Phrase("Valor", _standardFont));
                valor_gasto.BorderWidth = 0;
                valor_gasto.BorderWidthBottom = 0.75f;
                valor_gasto.BackgroundColor = new BaseColor(78, 185, 232);
                pdfTableGastos.AddCell(valor_gasto);

                /*PRIMERA FILA*/
                pdfTableGastos.AddCell(ddpetroleo.SelectedItem.Text);
                if (txtpetroleo.Text == "")
                    pdfTableGastos.AddCell("$0");
                else
                    pdfTableGastos.AddCell("$" + txtpetroleo.Text);
                /*FIN PRIMERA FILA*/

                /*SEGUNDA FILA*/
                pdfTableGastos.AddCell(ddandenes.SelectedItem.Text);
                if (txtandenes.Text == "")
                    pdfTableGastos.AddCell("$0");
                else
                    pdfTableGastos.AddCell("$" + txtandenes.Text);
                /*FIN SEGUNDA FILA*/

                /*TERCERA FILA*/
                pdfTableGastos.AddCell(ddcolaciones.SelectedItem.Text);
                if (txtcolaciones.Text == "")
                    pdfTableGastos.AddCell("$0");
                else
                    pdfTableGastos.AddCell("$" + txtcolaciones.Text);
                /*FIN TERCERA FILA*/

                /*CUARTA FILA*/
                pdfTableGastos.AddCell(ddaseo.SelectedItem.Text);
                if (txtaseo.Text == "")
                    pdfTableGastos.AddCell("$0");
                else
                    pdfTableGastos.AddCell("$" + txtaseo.Text);
                /*FIN CUARTA FILA*/

                /*QUINTA FILA*/
                pdfTableGastos.AddCell(ddmantencion.SelectedItem.Text + " (Rot. neomáticos)");
                if (txtmantencion.Text == "")
                    pdfTableGastos.AddCell("$0");
                else
                    pdfTableGastos.AddCell("$" + txtmantencion.Text);
                /*FIN QUINTA FILA*/

                /*SEXTA FILA*/
                pdfTableGastos.AddCell(ddpeajes.SelectedItem.Text);
                if (txtpeajes.Text == "")
                    pdfTableGastos.AddCell("$0");
                else
                    pdfTableGastos.AddCell("$" + txtpeajes.Text);
                /*FIN SEXTA FILA*/

                /*SEPTIMA FILA*/
                pdfTableGastos.AddCell(ddnoqueras.SelectedItem.Text);
                if (txtnoqueras.Text == "")
                    pdfTableGastos.AddCell("$0");
                else
                    pdfTableGastos.AddCell("$" + txtnoqueras.Text);
                /*FIN SEPTIMA FILA*/                

                /*FILA TOTAL GASTOS*/

                pdfTableGastos.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;
                pdfTableGastos.AddCell("TOTAL GASTOS");
                pdfTableGastos.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;
                pdfTableGastos.AddCell("$" + txttotalgastos.Text);
                /*FIN TOTAL GASTOS FILA*/

                /*fin creacion de la caja diaria*/

                pdfDocument.AddTitle("EMBus CAJA");
                pdfDocument.Add(logo);
                //pdfDocument.Add(paragraph_fecha_hoy);
                pdfDocument.Add(paragraph_empresa);
                pdfDocument.Add(paragraph_fecha_caja);
                pdfDocument.Add(vueltas);
                pdfDocument.Add(turnos);
                pdfDocument.Add(paragraph_bus);
                pdfDocument.Add(paragraph);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableCaja);
                pdfDocument.Add(rut_conductor);
                pdfDocument.Add(rut_auxiliar);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(titulo_gastos);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableGastos);

                pdfDocument.Close();

                Response.ContentType = "application/pdf";
                Response.AppendHeader("content-disposition", "attachment;filename=Caja " + DateTime.Now.ToString("dd-MM-yyyy-H.mmtt") + ".pdf");
                Response.Write(pdfDocument);
                Response.Flush();
                Response.End();
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Debe ingresar todos los datos correctamente');window.location='Caja.aspx';</script>'");
            }
        }
    }
}