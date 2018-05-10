using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project;
using System.IO;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Text;
using System.Configuration;


namespace EMBus
{
    public partial class VerPorcentajesConductor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.generarPDF.Visible = false;
        }

        protected void btnMostrarPorcentajes_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.txtfechadesde.Text == "" || this.txtfechahasta.Text == "" || this.txtnumeroconductores.Text == "")
                {
                    this.btnMostrarPorcentajes.Visible = false;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error, No ha ingresado todos los datos');window.location='VerPorcentajesConductor.aspx';</script>'");
                }
                else
                {
                    //lista todos los bonos diarios del conductor
                    //CONDUCTOR1
                    datosConductor.DataBind();
                    gridPorcentaje.DataBind();

                    //CONDUCTOR2
                    datosConductor2.DataBind();
                    gridPorcentaje2.DataBind();

                    //CONDUCTOR3
                    datosConductor3.DataBind();
                    gridPorcentaje3.DataBind();

                    //CONDUCTOR4
                    datosConductor4.DataBind();
                    gridPorcentaje4.DataBind();
                    //fin lista de bonos para cada conductor

                    //listar la suma total de los bonos diarios del condutor
                    //CONDUCTOR1
                    datosPagoConductor.DataBind();
                    gridSumaPorcentajes.DataBind();

                    //CONDUCTOR2
                    datosPagoConductor2.DataBind();
                    gridSumaPorcentaje2.DataBind();

                    //CONDUCTOR3
                    datosPagoConductor3.DataBind();
                    gridSumaPorcentaje3.DataBind();

                    //CONDUCTOR4
                    datosPagoConductor4.DataBind();
                    gridSumaPorcentaje4.DataBind();
                    //fin suma de bonos diarios de cada conductor

                    //listar los domingos trabajados por el conductor
                    //CONDUCTOR1
                    datosDomingosTrabajados.DataBind();
                    gridDomingosTrabajados.DataBind();

                    //CONDUCTOR2
                    datosDomingosTrabajados2.DataBind();
                    gridDomingosTrabajados2.DataBind();

                    //CONDUCTOR3
                    datosDomingosTrabajados3.DataBind();
                    gridDomingosTrabajados3.DataBind();

                    //CONDUCTOR4
                    datosDomingosTrabajados4.DataBind();
                    gridDomingosTrabajdos4.DataBind();
                    //fin domingos trabajados para cada conductor

                    //obtener sueldo liquido para cada conductor
                    obtenerLiquidoConductor1.DataBind();
                    gridLiquidoConductor1.DataBind();

                    //obtener sueldo liquido mas domingos para cada conductor
                    //CONDUCTOR1
                    datosLiquidoMasDomingo1.DataBind();
                    gridLiquidoMasDomingo1.DataBind();

                    //CONDUCTOR2
                    datosLiquidoMasDomingo2.DataBind();
                    gridLiquidoMasDomingos2.DataBind();

                    //CONDUCTOR3
                    datosLiquidoMasDomingo3.DataBind();
                    gridLiquidoMasDomingos3.DataBind();

                    //CONDUCTOR4
                    datosLiquidoMasDomingo4.DataBind();
                    gridLiquidoMasDomingos4.DataBind();

                    //obtener prestamos para cada conductor
                    //CONDUCTOR1
                    datosPrestamoConductor1.DataBind();
                    gridPrestamosConductor1.DataBind();
                    //CONDUCTOR2
                    datosPrestamoConductor2.DataBind();
                    gridPrestamosConductor2.DataBind();
                    //CONDUCTOR3
                    datosPrestamoConductor3.DataBind();
                    gridPrestamoConductor3.DataBind();
                    //CONDUCTOR4
                    datosPrestamoConductor4.DataBind();
                    gridPrestamoConductor4.DataBind();

                    //obtener total sueldo para cada conductor
                    //CONDUCTOR1
                    datosTotalConductor1.DataBind();
                    gridTotalConductor1.DataBind();
                    //CONDUCTOR2
                    datosTotalConductor2.DataBind();
                    gridTotalConductor2.DataBind();
                    //CONDUCTOR3
                    datosTotalConductor3.DataBind();
                    gridTotalConductor3.DataBind();
                    //CONDUCTOR4
                    datosTotalConductor4.DataBind();
                    gridTotalConductor4.DataBind();

                    this.generarPDF.Visible = true;
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Algunos datos no se ingresaron correctamente');window.location='VerPorcentajesConductor.aspx';</script>'");
            }
        }

        protected void generarPDF_Click(object sender, EventArgs e)
        {
            try
            {
                /*Generación del documento pdf*/
                Document pdfDocument = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                PdfWriter.GetInstance(pdfDocument, Response.OutputStream);
                pdfDocument.AddAuthor("EMBus Los Muermos");
                pdfDocument.Open();

                iTextSharp.text.Font _standardFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 12, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
                var boldFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12);
                var boldFontFecha = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 10);

                iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(MapPath("/img/logo2.png"));
                logo.Alignment = iTextSharp.text.Image.ALIGN_RIGHT;
                logo.ScaleAbsolute(180f, 60f);
                pdfDocument.Add(logo);
                pdfDocument.Add(new Paragraph(" "));

                Paragraph paragraph_fecha_hoy = new Paragraph("FECHA: " + DateTime.Now, boldFontFecha);
                paragraph_fecha_hoy.Alignment = Element.ALIGN_LEFT;
                pdfDocument.Add(paragraph_fecha_hoy);

                Paragraph paragraph_fecha = new Paragraph("PERIODO PAGO: " + txtfechadesde.Text + " / " + txtfechahasta.Text, boldFontFecha);
                paragraph_fecha.Alignment = Element.ALIGN_LEFT;
                pdfDocument.Add(paragraph_fecha);

                Paragraph paragraph_rut1 = new Paragraph("CONDUCTOR: " + ddrutconductores.SelectedValue + " / " + ddrutconductores.SelectedItem, boldFontFecha);
                paragraph_rut1.Alignment = Element.ALIGN_LEFT;
                pdfDocument.Add(paragraph_rut1);
                pdfDocument.Add(new Paragraph(" "));

                Paragraph paragraph = new Paragraph("PAGOS CONDUCTORES TRANSPORTES EMBUS LOS MUERMOS", boldFont);
                paragraph.Alignment = Element.ALIGN_CENTER;
                pdfDocument.Add(paragraph);

                //creacion tabla numero 1, obtener dias trabajados
                PdfPTable pdfTablePorcentaje1 = new PdfPTable(gridPorcentaje.Columns.Count);
                pdfTablePorcentaje1.WidthPercentage = 60;
                //pdfTablePorcentaje1.HorizontalAlignment = Element.ALIGN_LEFT;

                PdfPCell tituloCol1 = new PdfPCell(new Phrase("DIA", _standardFont));
                tituloCol1.BorderWidth = 0;
                tituloCol1.BorderWidthBottom = 0.75f;
                //tituloCol1.Colspan = 10; esta wea es una linea

                PdfPCell tituloCol2 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloCol2.BorderWidth = 0;
                tituloCol2.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol3 = new PdfPCell(new Phrase("20% DIARIO", _standardFont));
                tituloCol3.BorderWidth = 0;
                tituloCol3.BorderWidthBottom = 0.75f;

                pdfTablePorcentaje1.AddCell(tituloCol1);
                pdfTablePorcentaje1.AddCell(tituloCol2);
                pdfTablePorcentaje1.AddCell(tituloCol3);

                //recorre el primer grid, el de los porcentajes
                foreach (GridViewRow valoresPorcentaje1 in gridPorcentaje.Rows)
                {
                    foreach (TableCell tableCellPorcentaje1 in valoresPorcentaje1.Cells)
                    {
                        PdfPCell pdfCellPorcentaje1 = new PdfPCell(new Phrase(tableCellPorcentaje1.Text, _standardFont));
                        pdfCellPorcentaje1.BackgroundColor = new BaseColor(gridPorcentaje.RowStyle.BackColor);
                        pdfTablePorcentaje1.AddCell(pdfCellPorcentaje1);
                    }
                }

                //creacion tabla numero 2, obtiene la suma de los dias trabajados sin contar los domingos
                PdfPTable pdfTableSumaSinDomingos1 = new PdfPTable(gridSumaPorcentajes.Columns.Count);
                pdfTableSumaSinDomingos1.WidthPercentage = 60;

                PdfPCell tituloTotalSinDomingos1 = new PdfPCell(new Phrase("TOTAL 20% (SIN DOMINGOS)", _standardFont));
                tituloTotalSinDomingos1.BorderWidth = 0;
                tituloTotalSinDomingos1.BorderWidthBottom = 0.75f;

                pdfTableSumaSinDomingos1.AddCell(tituloTotalSinDomingos1);


                //recorre el segundo grid
                foreach (GridViewRow totalSinDomingos1 in gridSumaPorcentajes.Rows)
                {
                    foreach (TableCell tableCellTotalSinDomingos1 in totalSinDomingos1.Cells)
                    {
                        PdfPCell pdfCellTotalSinDomingos1 = new PdfPCell(new Phrase(tableCellTotalSinDomingos1.Text, _standardFont));
                        pdfCellTotalSinDomingos1.BackgroundColor = new BaseColor(gridSumaPorcentajes.RowStyle.BackColor);
                        pdfTableSumaSinDomingos1.AddCell(pdfCellTotalSinDomingos1);
                    }
                }

                //creacion tabla numero 3, obtiene los dias domingos trabajados
                PdfPTable pdfTableDomingosTrabajados1 = new PdfPTable(gridDomingosTrabajados.Columns.Count);
                pdfTableDomingosTrabajados1.WidthPercentage = 60;

                PdfPCell tituloDomingosTrabajados1 = new PdfPCell(new Phrase("DOMINGOS", _standardFont));
                tituloDomingosTrabajados1.BorderWidth = 0;
                tituloDomingosTrabajados1.BorderWidthBottom = 0.75f;

                PdfPCell tituloFechaDomingo1 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFechaDomingo1.BorderWidth = 0;
                tituloFechaDomingo1.BorderWidthBottom = 0.75f;

                pdfTableDomingosTrabajados1.AddCell(tituloDomingosTrabajados1);
                pdfTableDomingosTrabajados1.AddCell(tituloFechaDomingo1);


                //recorre el segundo grid
                foreach (GridViewRow domingosTrabajados1 in gridDomingosTrabajados.Rows)
                {
                    foreach (TableCell tableCellDomingosTrabajados1 in domingosTrabajados1.Cells)
                    {
                        PdfPCell pdfCellDomingosTrabajados1 = new PdfPCell(new Phrase(tableCellDomingosTrabajados1.Text, _standardFont));
                        pdfCellDomingosTrabajados1.BackgroundColor = new BaseColor(gridDomingosTrabajados.RowStyle.BackColor);
                        pdfTableDomingosTrabajados1.AddCell(pdfCellDomingosTrabajados1);
                    }
                }

                //creacion tabla numero 4, obtiene el sueldo liquido del conductor
                PdfPTable pdfTableSueldoLiquido1 = new PdfPTable(gridLiquidoConductor1.Columns.Count);
                pdfTableSueldoLiquido1.WidthPercentage = 60;

                PdfPCell tituloSueldoLiquido1 = new PdfPCell(new Phrase("SUELDO LÍQUIDO", _standardFont));
                tituloSueldoLiquido1.BorderWidth = 0;
                tituloSueldoLiquido1.BorderWidthBottom = 0.75f;

                pdfTableSueldoLiquido1.AddCell(tituloSueldoLiquido1);

                //recorre el segundo grid
                foreach (GridViewRow sueldoLiquido1 in gridLiquidoConductor1.Rows)
                {
                    foreach (TableCell tableCellLiquido1 in sueldoLiquido1.Cells)
                    {
                        PdfPCell pdfCellSueldoLiquido1 = new PdfPCell(new Phrase(tableCellLiquido1.Text, _standardFont));
                        pdfCellSueldoLiquido1.BackgroundColor = new BaseColor(gridLiquidoConductor1.RowStyle.BackColor);
                        pdfTableSueldoLiquido1.AddCell(pdfCellSueldoLiquido1);
                    }
                }

                //creacion tabla numero 5, obtiene el sueldo liquido + domingos del conductor
                PdfPTable pdfTableSueldoLiquidoMasDomingo1 = new PdfPTable(gridLiquidoMasDomingo1.Columns.Count);
                pdfTableSueldoLiquidoMasDomingo1.WidthPercentage = 60;

                PdfPCell tituloSueldoLiquidoMasDomingo1 = new PdfPCell(new Phrase("SUELDO LIQUIDO MAS DOMINGOS TRABAJADOS", _standardFont));
                tituloSueldoLiquidoMasDomingo1.BorderWidth = 0;
                tituloSueldoLiquidoMasDomingo1.BorderWidthBottom = 0.75f;

                pdfTableSueldoLiquidoMasDomingo1.AddCell(tituloSueldoLiquidoMasDomingo1);

                //recorre el segundo grid
                foreach (GridViewRow sueldoLiquidoDomingo1 in gridLiquidoMasDomingo1.Rows)
                {
                    foreach (TableCell tableCellLiquidoDomingo1 in sueldoLiquidoDomingo1.Cells)
                    {
                        PdfPCell pdfCellSueldoLiquidoMasDomingo1 = new PdfPCell(new Phrase(tableCellLiquidoDomingo1.Text, _standardFont));
                        pdfCellSueldoLiquidoMasDomingo1.BackgroundColor = new BaseColor(gridLiquidoMasDomingo1.RowStyle.BackColor);
                        pdfTableSueldoLiquidoMasDomingo1.AddCell(pdfCellSueldoLiquidoMasDomingo1);
                    }
                }

                //creacion tabla numero 6, obtiene los prestamos de cada conductor
                PdfPTable pdfTablePrestamos1 = new PdfPTable(gridPrestamosConductor1.Columns.Count);
                pdfTablePrestamos1.WidthPercentage = 60;

                PdfPCell tituloPrestamos1 = new PdfPCell(new Phrase("PRESTAMOS E IMPOSICIONES", _standardFont));
                tituloPrestamos1.BorderWidth = 0;
                tituloPrestamos1.BorderWidthBottom = 0.75f;

                pdfTablePrestamos1.AddCell(tituloPrestamos1);

                //recorre el segundo grid
                foreach (GridViewRow prestamo1 in gridPrestamosConductor1.Rows)
                {
                    foreach (TableCell tableCellPrestamos1 in prestamo1.Cells)
                    {
                        PdfPCell pdfCellPrestamos1 = new PdfPCell(new Phrase(tableCellPrestamos1.Text, _standardFont));
                        pdfCellPrestamos1.BackgroundColor = new BaseColor(gridPrestamosConductor1.RowStyle.BackColor);
                        pdfTablePrestamos1.AddCell(pdfCellPrestamos1);
                    }
                }

                //creacion tabla numero 7, obtiene el sueldo final de cada conductor
                PdfPTable pdfTableSueldoFinal1 = new PdfPTable(gridTotalConductor1.Columns.Count);
                pdfTableSueldoFinal1.WidthPercentage = 60;

                PdfPCell tituloSueldoFinal1 = new PdfPCell(new Phrase("SUELDO", _standardFont));
                tituloSueldoFinal1.BorderWidth = 0;
                tituloSueldoFinal1.BorderWidthBottom = 0.75f;

                pdfTableSueldoFinal1.AddCell(tituloSueldoFinal1);

                //recorre el segundo grid
                foreach (GridViewRow SueldoFinal1 in gridTotalConductor1.Rows)
                {
                    foreach (TableCell tableCellSueldoFinal1 in SueldoFinal1.Cells)
                    {
                        PdfPCell pdfCellSueldoFinal1 = new PdfPCell(new Phrase(tableCellSueldoFinal1.Text, _standardFont));
                        pdfCellSueldoFinal1.BackgroundColor = new BaseColor(gridTotalConductor1.RowStyle.BackColor);
                        pdfTableSueldoFinal1.AddCell(pdfCellSueldoFinal1);
                    }
                }

                /*SEGUNDA PAGINA*/
                Paragraph paragraph_rut2 = new Paragraph("CONDUCTOR: " + ddconductores2.SelectedValue + " / " + ddconductores2.SelectedItem, boldFontFecha);
                paragraph_rut2.Alignment = Element.ALIGN_LEFT;

                //creacion tabla numero 1, obtener dias trabajados
                PdfPTable pdfTablePorcentaje2 = new PdfPTable(gridPorcentaje2.Columns.Count);
                pdfTablePorcentaje2.WidthPercentage = 60;

                PdfPCell tituloCol1P2 = new PdfPCell(new Phrase("DIA", _standardFont));
                tituloCol1P2.BorderWidth = 0;
                tituloCol1P2.BorderWidthBottom = 0.75f;
                //tituloCol1.Colspan = 10; esta wea es una linea

                PdfPCell tituloCol2P2 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloCol2P2.BorderWidth = 0;
                tituloCol2P2.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol3P2 = new PdfPCell(new Phrase("20% DIARIO", _standardFont));
                tituloCol3P2.BorderWidth = 0;
                tituloCol3P2.BorderWidthBottom = 0.75f;

                pdfTablePorcentaje2.AddCell(tituloCol1P2);
                pdfTablePorcentaje2.AddCell(tituloCol2P2);
                pdfTablePorcentaje2.AddCell(tituloCol3P2);

                //recorre el primer grid, el de los porcentajes
                foreach (GridViewRow valoresPorcentaje2 in gridPorcentaje2.Rows)
                {
                    foreach (TableCell tableCellPorcentaje2 in valoresPorcentaje2.Cells)
                    {
                        PdfPCell pdfCellPorcentaje2 = new PdfPCell(new Phrase(tableCellPorcentaje2.Text, _standardFont));
                        pdfCellPorcentaje2.BackgroundColor = new BaseColor(gridPorcentaje2.RowStyle.BackColor);
                        pdfTablePorcentaje2.AddCell(pdfCellPorcentaje2);
                    }
                }

                //creacion tabla numero 2, obtiene la suma de los dias trabajados sin contar los domingos
                PdfPTable pdfTableSumaSinDomingos2 = new PdfPTable(gridSumaPorcentaje2.Columns.Count);
                pdfTableSumaSinDomingos2.WidthPercentage = 60;

                PdfPCell tituloTotalSinDomingos2 = new PdfPCell(new Phrase("TOTAL 20% (SIN DOMINGOS)", _standardFont));
                tituloTotalSinDomingos2.BorderWidth = 0;
                tituloTotalSinDomingos2.BorderWidthBottom = 0.75f;

                pdfTableSumaSinDomingos2.AddCell(tituloTotalSinDomingos2);


                //recorre el segundo grid
                foreach (GridViewRow totalSinDomingos2 in gridSumaPorcentaje2.Rows)
                {
                    foreach (TableCell tableCellTotalSinDomingos2 in totalSinDomingos2.Cells)
                    {
                        PdfPCell pdfCellTotalSinDomingos2 = new PdfPCell(new Phrase(tableCellTotalSinDomingos2.Text, _standardFont));
                        pdfCellTotalSinDomingos2.BackgroundColor = new BaseColor(gridSumaPorcentaje2.RowStyle.BackColor);
                        pdfTableSumaSinDomingos2.AddCell(pdfCellTotalSinDomingos2);
                    }
                }

                //creacion tabla numero 3, obtiene los dias domingos trabajados
                PdfPTable pdfTableDomingosTrabajados2 = new PdfPTable(gridDomingosTrabajados2.Columns.Count);
                pdfTableDomingosTrabajados2.WidthPercentage = 60;

                PdfPCell tituloDomingosTrabajados2 = new PdfPCell(new Phrase("DOMINGOS", _standardFont));
                tituloDomingosTrabajados2.BorderWidth = 0;
                tituloDomingosTrabajados2.BorderWidthBottom = 0.75f;

                PdfPCell tituloFechaDomingo2 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFechaDomingo2.BorderWidth = 0;
                tituloFechaDomingo2.BorderWidthBottom = 0.75f;

                pdfTableDomingosTrabajados2.AddCell(tituloDomingosTrabajados2);
                pdfTableDomingosTrabajados2.AddCell(tituloFechaDomingo2);


                //recorre el segundo grid
                foreach (GridViewRow domingosTrabajados2 in gridDomingosTrabajados2.Rows)
                {
                    foreach (TableCell tableCellDomingosTrabajados2 in domingosTrabajados2.Cells)
                    {
                        PdfPCell pdfCellDomingosTrabajados2 = new PdfPCell(new Phrase(tableCellDomingosTrabajados2.Text, _standardFont));
                        pdfCellDomingosTrabajados2.BackgroundColor = new BaseColor(gridDomingosTrabajados2.RowStyle.BackColor);
                        pdfTableDomingosTrabajados2.AddCell(pdfCellDomingosTrabajados2);
                    }
                }

                //creacion tabla numero 4, obtiene el sueldo liquido del conductor
                PdfPTable pdfTableSueldoLiquido2 = new PdfPTable(gridLiquidoConductor2.Columns.Count);
                pdfTableSueldoLiquido2.WidthPercentage = 60;

                PdfPCell tituloSueldoLiquido2 = new PdfPCell(new Phrase("SUELDO LÍQUIDO", _standardFont));
                tituloSueldoLiquido2.BorderWidth = 0;
                tituloSueldoLiquido2.BorderWidthBottom = 0.75f;

                pdfTableSueldoLiquido2.AddCell(tituloSueldoLiquido2);

                //recorre el segundo grid
                foreach (GridViewRow sueldoLiquido2 in gridLiquidoConductor2.Rows)
                {
                    foreach (TableCell tableCellLiquido2 in sueldoLiquido2.Cells)
                    {
                        PdfPCell pdfCellSueldoLiquido2 = new PdfPCell(new Phrase(tableCellLiquido2.Text, _standardFont));
                        pdfCellSueldoLiquido2.BackgroundColor = new BaseColor(gridLiquidoConductor2.RowStyle.BackColor);
                        pdfTableSueldoLiquido2.AddCell(pdfCellSueldoLiquido2);
                    }
                }

                //creacion tabla numero 5, obtiene el sueldo liquido + domingos del conductor
                PdfPTable pdfTableSueldoLiquidoMasDomingo2 = new PdfPTable(gridLiquidoMasDomingos2.Columns.Count);
                pdfTableSueldoLiquidoMasDomingo2.WidthPercentage = 60;

                PdfPCell tituloSueldoLiquidoMasDomingo2 = new PdfPCell(new Phrase("SUELDO LIQUIDO MAS DOMINGOS TRABAJADOS", _standardFont));
                tituloSueldoLiquidoMasDomingo2.BorderWidth = 0;
                tituloSueldoLiquidoMasDomingo2.BorderWidthBottom = 0.75f;

                pdfTableSueldoLiquidoMasDomingo2.AddCell(tituloSueldoLiquidoMasDomingo2);

                //recorre el segundo grid
                foreach (GridViewRow sueldoLiquidoDomingo2 in gridLiquidoMasDomingos2.Rows)
                {
                    foreach (TableCell tableCellLiquidoDomingo2 in sueldoLiquidoDomingo2.Cells)
                    {
                        PdfPCell pdfCellSueldoLiquidoMasDomingo2 = new PdfPCell(new Phrase(tableCellLiquidoDomingo2.Text, _standardFont));
                        pdfCellSueldoLiquidoMasDomingo2.BackgroundColor = new BaseColor(gridLiquidoMasDomingos2.RowStyle.BackColor);
                        pdfTableSueldoLiquidoMasDomingo2.AddCell(pdfCellSueldoLiquidoMasDomingo2);
                    }
                }

                //creacion tabla numero 6, obtiene los prestamos de cada conductor
                PdfPTable pdfTablePrestamos2 = new PdfPTable(gridPrestamosConductor2.Columns.Count);
                pdfTablePrestamos2.WidthPercentage = 60;

                PdfPCell tituloPrestamos2 = new PdfPCell(new Phrase("PRESTAMOS E IMPOSICIONES", _standardFont));
                tituloPrestamos2.BorderWidth = 0;
                tituloPrestamos2.BorderWidthBottom = 0.75f;

                pdfTablePrestamos2.AddCell(tituloPrestamos2);

                //recorre el segundo grid
                foreach (GridViewRow prestamo2 in gridPrestamosConductor2.Rows)
                {
                    foreach (TableCell tableCellPrestamos2 in prestamo2.Cells)
                    {
                        PdfPCell pdfCellPrestamos2 = new PdfPCell(new Phrase(tableCellPrestamos2.Text, _standardFont));
                        pdfCellPrestamos2.BackgroundColor = new BaseColor(gridPrestamosConductor2.RowStyle.BackColor);
                        pdfTablePrestamos2.AddCell(pdfCellPrestamos2);
                    }
                }

                //creacion tabla numero 7, obtiene el sueldo final de cada conductor
                PdfPTable pdfTableSueldoFinal2 = new PdfPTable(gridTotalConductor2.Columns.Count);
                pdfTableSueldoFinal2.WidthPercentage = 60;

                PdfPCell tituloSueldoFinal2 = new PdfPCell(new Phrase("SUELDO", _standardFont));
                tituloSueldoFinal2.BorderWidth = 0;
                tituloSueldoFinal2.BorderWidthBottom = 0.75f;

                pdfTableSueldoFinal2.AddCell(tituloSueldoFinal2);

                //recorre el segundo grid
                foreach (GridViewRow SueldoFinal2 in gridTotalConductor2.Rows)
                {
                    foreach (TableCell tableCellSueldoFinal2 in SueldoFinal2.Cells)
                    {
                        PdfPCell pdfCellSueldoFinal2 = new PdfPCell(new Phrase(tableCellSueldoFinal2.Text, _standardFont));
                        pdfCellSueldoFinal2.BackgroundColor = new BaseColor(gridTotalConductor2.RowStyle.BackColor);
                        pdfTableSueldoFinal2.AddCell(pdfCellSueldoFinal2);
                    }
                }
                /*FIN SEGUNDA PAGINA*/


                /*TERCERA PAGINA*/
                Paragraph paragraph_rut3 = new Paragraph("CONDUCTOR: " + ddconductores3.SelectedValue + " / " + ddconductores3.SelectedItem, boldFontFecha);
                paragraph_rut3.Alignment = Element.ALIGN_LEFT;

                //creacion tabla numero 1, obtener dias trabajados
                PdfPTable pdfTablePorcentaje3 = new PdfPTable(gridPorcentaje3.Columns.Count);
                pdfTablePorcentaje3.WidthPercentage = 60;

                PdfPCell tituloCol1P3 = new PdfPCell(new Phrase("DIA", _standardFont));
                tituloCol1P3.BorderWidth = 0;
                tituloCol1P3.BorderWidthBottom = 0.75f;
                //tituloCol1.Colspan = 10; esta wea es una linea

                PdfPCell tituloCol2P3 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloCol2P3.BorderWidth = 0;
                tituloCol2P3.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol3P3 = new PdfPCell(new Phrase("20% DIARIO", _standardFont));
                tituloCol3P3.BorderWidth = 0;
                tituloCol3P3.BorderWidthBottom = 0.75f;

                pdfTablePorcentaje3.AddCell(tituloCol1P3);
                pdfTablePorcentaje3.AddCell(tituloCol2P3);
                pdfTablePorcentaje3.AddCell(tituloCol3P3);

                //recorre el primer grid, el de los porcentajes
                foreach (GridViewRow valoresPorcentaje3 in gridPorcentaje3.Rows)
                {
                    foreach (TableCell tableCellPorcentaje3 in valoresPorcentaje3.Cells)
                    {
                        PdfPCell pdfCellPorcentaje3 = new PdfPCell(new Phrase(tableCellPorcentaje3.Text, _standardFont));
                        pdfCellPorcentaje3.BackgroundColor = new BaseColor(gridPorcentaje3.RowStyle.BackColor);
                        pdfTablePorcentaje3.AddCell(pdfCellPorcentaje3);
                    }
                }

                //creacion tabla numero 2, obtiene la suma de los dias trabajados sin contar los domingos
                PdfPTable pdfTableSumaSinDomingos3 = new PdfPTable(gridSumaPorcentaje3.Columns.Count);
                pdfTableSumaSinDomingos3.WidthPercentage = 60;

                PdfPCell tituloTotalSinDomingos3 = new PdfPCell(new Phrase("TOTAL 20% (SIN DOMINGOS)", _standardFont));
                tituloTotalSinDomingos3.BorderWidth = 0;
                tituloTotalSinDomingos3.BorderWidthBottom = 0.75f;

                pdfTableSumaSinDomingos3.AddCell(tituloTotalSinDomingos3);


                //recorre el segundo grid
                foreach (GridViewRow totalSinDomingos3 in gridSumaPorcentaje3.Rows)
                {
                    foreach (TableCell tableCellTotalSinDomingos3 in totalSinDomingos3.Cells)
                    {
                        PdfPCell pdfCellTotalSinDomingos3 = new PdfPCell(new Phrase(tableCellTotalSinDomingos3.Text, _standardFont));
                        pdfCellTotalSinDomingos3.BackgroundColor = new BaseColor(gridSumaPorcentaje3.RowStyle.BackColor);
                        pdfTableSumaSinDomingos3.AddCell(pdfCellTotalSinDomingos3);
                    }
                }

                //creacion tabla numero 3, obtiene los dias domingos trabajados
                PdfPTable pdfTableDomingosTrabajados3 = new PdfPTable(gridDomingosTrabajados3.Columns.Count);
                pdfTableDomingosTrabajados3.WidthPercentage = 60;

                PdfPCell tituloDomingosTrabajados3 = new PdfPCell(new Phrase("DOMINGOS", _standardFont));
                tituloDomingosTrabajados3.BorderWidth = 0;
                tituloDomingosTrabajados3.BorderWidthBottom = 0.75f;

                PdfPCell tituloFechaDomingo3 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFechaDomingo3.BorderWidth = 0;
                tituloFechaDomingo3.BorderWidthBottom = 0.75f;

                pdfTableDomingosTrabajados3.AddCell(tituloDomingosTrabajados3);
                pdfTableDomingosTrabajados3.AddCell(tituloFechaDomingo3);


                //recorre el segundo grid
                foreach (GridViewRow domingosTrabajados3 in gridDomingosTrabajados3.Rows)
                {
                    foreach (TableCell tableCellDomingosTrabajados3 in domingosTrabajados3.Cells)
                    {
                        PdfPCell pdfCellDomingosTrabajados3 = new PdfPCell(new Phrase(tableCellDomingosTrabajados3.Text, _standardFont));
                        pdfCellDomingosTrabajados3.BackgroundColor = new BaseColor(gridDomingosTrabajados3.RowStyle.BackColor);
                        pdfTableDomingosTrabajados3.AddCell(pdfCellDomingosTrabajados3);
                    }
                }

                //creacion tabla numero 4, obtiene el sueldo liquido del conductor
                PdfPTable pdfTableSueldoLiquido3 = new PdfPTable(gridLiquidoConductor3.Columns.Count);
                pdfTableSueldoLiquido3.WidthPercentage = 60;

                PdfPCell tituloSueldoLiquido3 = new PdfPCell(new Phrase("SUELDO LÍQUIDO", _standardFont));
                tituloSueldoLiquido3.BorderWidth = 0;
                tituloSueldoLiquido3.BorderWidthBottom = 0.75f;

                pdfTableSueldoLiquido3.AddCell(tituloSueldoLiquido3);

                //recorre el segundo grid
                foreach (GridViewRow sueldoLiquido3 in gridLiquidoConductor3.Rows)
                {
                    foreach (TableCell tableCellLiquido3 in sueldoLiquido3.Cells)
                    {
                        PdfPCell pdfCellSueldoLiquido3 = new PdfPCell(new Phrase(tableCellLiquido3.Text, _standardFont));
                        pdfCellSueldoLiquido3.BackgroundColor = new BaseColor(gridLiquidoConductor3.RowStyle.BackColor);
                        pdfTableSueldoLiquido3.AddCell(pdfCellSueldoLiquido3);
                    }
                }

                //creacion tabla numero 5, obtiene el sueldo liquido + domingos del conductor
                PdfPTable pdfTableSueldoLiquidoMasDomingo3 = new PdfPTable(gridLiquidoMasDomingos3.Columns.Count);
                pdfTableSueldoLiquidoMasDomingo3.WidthPercentage = 60;

                PdfPCell tituloSueldoLiquidoMasDomingo3 = new PdfPCell(new Phrase("SUELDO LIQUIDO MAS DOMINGOS TRABAJADOS", _standardFont));
                tituloSueldoLiquidoMasDomingo3.BorderWidth = 0;
                tituloSueldoLiquidoMasDomingo3.BorderWidthBottom = 0.75f;

                pdfTableSueldoLiquidoMasDomingo3.AddCell(tituloSueldoLiquidoMasDomingo3);

                //recorre el segundo grid
                foreach (GridViewRow sueldoLiquidoDomingo3 in gridLiquidoMasDomingos3.Rows)
                {
                    foreach (TableCell tableCellLiquidoDomingo3 in sueldoLiquidoDomingo3.Cells)
                    {
                        PdfPCell pdfCellSueldoLiquidoMasDomingo3 = new PdfPCell(new Phrase(tableCellLiquidoDomingo3.Text, _standardFont));
                        pdfCellSueldoLiquidoMasDomingo3.BackgroundColor = new BaseColor(gridLiquidoMasDomingos3.RowStyle.BackColor);
                        pdfTableSueldoLiquidoMasDomingo3.AddCell(pdfCellSueldoLiquidoMasDomingo3);
                    }
                }

                //creacion tabla numero 6, obtiene los prestamos de cada conductor
                PdfPTable pdfTablePrestamos3 = new PdfPTable(gridPrestamoConductor3.Columns.Count);
                pdfTablePrestamos3.WidthPercentage = 60;

                PdfPCell tituloPrestamos3 = new PdfPCell(new Phrase("PRESTAMOS E IMPOSICIONES", _standardFont));
                tituloPrestamos3.BorderWidth = 0;
                tituloPrestamos3.BorderWidthBottom = 0.75f;

                pdfTablePrestamos3.AddCell(tituloPrestamos3);

                //recorre el segundo grid
                foreach (GridViewRow prestamo3 in gridPrestamoConductor3.Rows)
                {
                    foreach (TableCell tableCellPrestamos3 in prestamo3.Cells)
                    {
                        PdfPCell pdfCellPrestamos3 = new PdfPCell(new Phrase(tableCellPrestamos3.Text, _standardFont));
                        pdfCellPrestamos3.BackgroundColor = new BaseColor(gridPrestamoConductor3.RowStyle.BackColor);
                        pdfTablePrestamos3.AddCell(pdfCellPrestamos3);
                    }
                }

                //creacion tabla numero 7, obtiene el sueldo final de cada conductor
                PdfPTable pdfTableSueldoFinal3 = new PdfPTable(gridTotalConductor3.Columns.Count);
                pdfTableSueldoFinal3.WidthPercentage = 60;

                PdfPCell tituloSueldoFinal3 = new PdfPCell(new Phrase("SUELDO", _standardFont));
                tituloSueldoFinal3.BorderWidth = 0;
                tituloSueldoFinal3.BorderWidthBottom = 0.75f;

                pdfTableSueldoFinal3.AddCell(tituloSueldoFinal3);

                //recorre el segundo grid
                foreach (GridViewRow SueldoFinal3 in gridTotalConductor3.Rows)
                {
                    foreach (TableCell tableCellSueldoFinal3 in SueldoFinal3.Cells)
                    {
                        PdfPCell pdfCellSueldoFinal3 = new PdfPCell(new Phrase(tableCellSueldoFinal3.Text, _standardFont));
                        pdfCellSueldoFinal3.BackgroundColor = new BaseColor(gridTotalConductor3.RowStyle.BackColor);
                        pdfTableSueldoFinal3.AddCell(pdfCellSueldoFinal3);
                    }
                }
                /*FIN TERCERA PAGINA*/


                /*CUARTA PAGINA*/
                Paragraph paragraph_rut4 = new Paragraph("CONDUCTOR: " + ddconductores4.SelectedValue + " / " + ddconductores4.SelectedItem, boldFontFecha);
                paragraph_rut4.Alignment = Element.ALIGN_LEFT;

                //creacion tabla numero 1, obtener dias trabajados
                PdfPTable pdfTablePorcentaje4 = new PdfPTable(gridPorcentaje4.Columns.Count);
                pdfTablePorcentaje4.WidthPercentage = 60;

                PdfPCell tituloCol1P4 = new PdfPCell(new Phrase("DIA", _standardFont));
                tituloCol1P4.BorderWidth = 0;
                tituloCol1P4.BorderWidthBottom = 0.75f;
                //tituloCol1.Colspan = 10; esta wea es una linea

                PdfPCell tituloCol2P4 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloCol2P4.BorderWidth = 0;
                tituloCol2P4.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol3P4 = new PdfPCell(new Phrase("20% DIARIO", _standardFont));
                tituloCol3P4.BorderWidth = 0;
                tituloCol3P4.BorderWidthBottom = 0.75f;

                pdfTablePorcentaje4.AddCell(tituloCol1P4);
                pdfTablePorcentaje4.AddCell(tituloCol2P4);
                pdfTablePorcentaje4.AddCell(tituloCol3P4);

                //recorre el primer grid, el de los porcentajes
                foreach (GridViewRow valoresPorcentaje4 in gridPorcentaje4.Rows)
                {
                    foreach (TableCell tableCellPorcentaje4 in valoresPorcentaje4.Cells)
                    {
                        PdfPCell pdfCellPorcentaje4 = new PdfPCell(new Phrase(tableCellPorcentaje4.Text, _standardFont));
                        pdfCellPorcentaje4.BackgroundColor = new BaseColor(gridPorcentaje4.RowStyle.BackColor);
                        pdfTablePorcentaje4.AddCell(pdfCellPorcentaje4);
                    }
                }

                //creacion tabla numero 2, obtiene la suma de los dias trabajados sin contar los domingos
                PdfPTable pdfTableSumaSinDomingos4 = new PdfPTable(gridSumaPorcentaje4.Columns.Count);
                pdfTableSumaSinDomingos4.WidthPercentage = 60;

                PdfPCell tituloTotalSinDomingos4 = new PdfPCell(new Phrase("TOTAL 20% (SIN DOMINGOS)", _standardFont));
                tituloTotalSinDomingos4.BorderWidth = 0;
                tituloTotalSinDomingos4.BorderWidthBottom = 0.75f;

                pdfTableSumaSinDomingos4.AddCell(tituloTotalSinDomingos4);


                //recorre el segundo grid
                foreach (GridViewRow totalSinDomingos4 in gridSumaPorcentaje4.Rows)
                {
                    foreach (TableCell tableCellTotalSinDomingos4 in totalSinDomingos4.Cells)
                    {
                        PdfPCell pdfCellTotalSinDomingos4 = new PdfPCell(new Phrase(tableCellTotalSinDomingos4.Text, _standardFont));
                        pdfCellTotalSinDomingos4.BackgroundColor = new BaseColor(gridSumaPorcentaje4.RowStyle.BackColor);
                        pdfTableSumaSinDomingos4.AddCell(pdfCellTotalSinDomingos4);
                    }
                }

                //creacion tabla numero 3, obtiene los dias domingos trabajados
                PdfPTable pdfTableDomingosTrabajados4 = new PdfPTable(gridDomingosTrabajdos4.Columns.Count);
                pdfTableDomingosTrabajados4.WidthPercentage = 60;

                PdfPCell tituloDomingosTrabajados4 = new PdfPCell(new Phrase("DOMINGOS", _standardFont));
                tituloDomingosTrabajados4.BorderWidth = 0;
                tituloDomingosTrabajados4.BorderWidthBottom = 0.75f;

                PdfPCell tituloFechaDomingo4 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFechaDomingo4.BorderWidth = 0;
                tituloFechaDomingo4.BorderWidthBottom = 0.75f;

                pdfTableDomingosTrabajados4.AddCell(tituloDomingosTrabajados4);
                pdfTableDomingosTrabajados4.AddCell(tituloFechaDomingo4);


                //recorre el segundo grid
                foreach (GridViewRow domingosTrabajados4 in gridDomingosTrabajdos4.Rows)
                {
                    foreach (TableCell tableCellDomingosTrabajados4 in domingosTrabajados4.Cells)
                    {
                        PdfPCell pdfCellDomingosTrabajados4 = new PdfPCell(new Phrase(tableCellDomingosTrabajados4.Text, _standardFont));
                        pdfCellDomingosTrabajados4.BackgroundColor = new BaseColor(gridDomingosTrabajdos4.RowStyle.BackColor);
                        pdfTableDomingosTrabajados4.AddCell(pdfCellDomingosTrabajados4);
                    }
                }

                //creacion tabla numero 4, obtiene el sueldo liquido del conductor
                PdfPTable pdfTableSueldoLiquido4 = new PdfPTable(gridLiquidoConductor4.Columns.Count);
                pdfTableSueldoLiquido4.WidthPercentage = 60;

                PdfPCell tituloSueldoLiquido4 = new PdfPCell(new Phrase("SUELDO LÍQUIDO", _standardFont));
                tituloSueldoLiquido4.BorderWidth = 0;
                tituloSueldoLiquido4.BorderWidthBottom = 0.75f;

                pdfTableSueldoLiquido4.AddCell(tituloSueldoLiquido4);

                //recorre el segundo grid
                foreach (GridViewRow sueldoLiquido4 in gridLiquidoConductor4.Rows)
                {
                    foreach (TableCell tableCellLiquido4 in sueldoLiquido4.Cells)
                    {
                        PdfPCell pdfCellSueldoLiquido4 = new PdfPCell(new Phrase(tableCellLiquido4.Text, _standardFont));
                        pdfCellSueldoLiquido4.BackgroundColor = new BaseColor(gridLiquidoConductor4.RowStyle.BackColor);
                        pdfTableSueldoLiquido4.AddCell(pdfCellSueldoLiquido4);
                    }
                }

                //creacion tabla numero 5, obtiene el sueldo liquido + domingos del conductor
                PdfPTable pdfTableSueldoLiquidoMasDomingo4 = new PdfPTable(gridLiquidoMasDomingos4.Columns.Count);
                pdfTableSueldoLiquidoMasDomingo4.WidthPercentage = 60;

                PdfPCell tituloSueldoLiquidoMasDomingo4 = new PdfPCell(new Phrase("SUELDO LIQUIDO MAS DOMINGOS TRABAJADOS", _standardFont));
                tituloSueldoLiquidoMasDomingo4.BorderWidth = 0;
                tituloSueldoLiquidoMasDomingo4.BorderWidthBottom = 0.75f;

                pdfTableSueldoLiquidoMasDomingo4.AddCell(tituloSueldoLiquidoMasDomingo4);

                //recorre el segundo grid
                foreach (GridViewRow sueldoLiquidoDomingo4 in gridLiquidoMasDomingos4.Rows)
                {
                    foreach (TableCell tableCellLiquidoDomingo4 in sueldoLiquidoDomingo4.Cells)
                    {
                        PdfPCell pdfCellSueldoLiquidoMasDomingo4 = new PdfPCell(new Phrase(tableCellLiquidoDomingo4.Text, _standardFont));
                        pdfCellSueldoLiquidoMasDomingo4.BackgroundColor = new BaseColor(gridLiquidoMasDomingos4.RowStyle.BackColor);
                        pdfTableSueldoLiquidoMasDomingo4.AddCell(pdfCellSueldoLiquidoMasDomingo4);
                    }
                }

                //creacion tabla numero 6, obtiene los prestamos de cada conductor
                PdfPTable pdfTablePrestamos4 = new PdfPTable(gridPrestamoConductor4.Columns.Count);
                pdfTablePrestamos4.WidthPercentage = 60;

                PdfPCell tituloPrestamos4 = new PdfPCell(new Phrase("PRESTAMOS E IMPOSICIONES", _standardFont));
                tituloPrestamos4.BorderWidth = 0;
                tituloPrestamos4.BorderWidthBottom = 0.75f;

                pdfTablePrestamos4.AddCell(tituloPrestamos4);

                //recorre el segundo grid
                foreach (GridViewRow prestamo4 in gridPrestamoConductor4.Rows)
                {
                    foreach (TableCell tableCellPrestamos4 in prestamo4.Cells)
                    {
                        PdfPCell pdfCellPrestamos4 = new PdfPCell(new Phrase(tableCellPrestamos4.Text, _standardFont));
                        pdfCellPrestamos4.BackgroundColor = new BaseColor(gridPrestamoConductor4.RowStyle.BackColor);
                        pdfTablePrestamos4.AddCell(pdfCellPrestamos4);
                    }
                }

                //creacion tabla numero 7, obtiene el sueldo final de cada conductor
                PdfPTable pdfTableSueldoFinal4 = new PdfPTable(gridTotalConductor4.Columns.Count);
                pdfTableSueldoFinal4.WidthPercentage = 60;

                PdfPCell tituloSueldoFinal4 = new PdfPCell(new Phrase("SUELDO", _standardFont));
                tituloSueldoFinal4.BorderWidth = 0;
                tituloSueldoFinal4.BorderWidthBottom = 0.75f;

                pdfTableSueldoFinal4.AddCell(tituloSueldoFinal4);

                //recorre el segundo grid
                foreach (GridViewRow SueldoFinal4 in gridTotalConductor4.Rows)
                {
                    foreach (TableCell tableCellSueldoFinal4 in SueldoFinal4.Cells)
                    {
                        PdfPCell pdfCellSueldoFinal4 = new PdfPCell(new Phrase(tableCellSueldoFinal4.Text, _standardFont));
                        pdfCellSueldoFinal4.BackgroundColor = new BaseColor(gridTotalConductor4.RowStyle.BackColor);
                        pdfTableSueldoFinal4.AddCell(pdfCellSueldoFinal4);
                    }
                }
                /*FIN CUARTA PAGINA*/

                pdfDocument.AddTitle("EMBus PAGOS");

                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTablePorcentaje1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSumaSinDomingos1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableDomingosTrabajados1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoLiquido1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoLiquidoMasDomingo1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTablePrestamos1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoFinal1);
                pdfDocument.Add(new Paragraph(" "));


                pdfDocument.NewPage();

                pdfDocument.Add(logo);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(paragraph_fecha_hoy);
                pdfDocument.Add(paragraph_fecha);
                pdfDocument.Add(paragraph_rut2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(paragraph);
                pdfDocument.Add(new Paragraph(" "));

                pdfDocument.Add(pdfTablePorcentaje2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSumaSinDomingos2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableDomingosTrabajados2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoLiquido2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoLiquidoMasDomingo2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTablePrestamos2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoFinal2);
                pdfDocument.Add(new Paragraph(" "));

                pdfDocument.NewPage();

                pdfDocument.Add(logo);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(paragraph_fecha_hoy);
                pdfDocument.Add(paragraph_fecha);
                pdfDocument.Add(paragraph_rut3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(paragraph);
                pdfDocument.Add(new Paragraph(" "));

                pdfDocument.Add(pdfTablePorcentaje3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSumaSinDomingos3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableDomingosTrabajados3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoLiquido3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoLiquidoMasDomingo3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTablePrestamos3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoFinal3);
                pdfDocument.Add(new Paragraph(" "));

                pdfDocument.NewPage();

                pdfDocument.Add(logo);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(paragraph_fecha_hoy);
                pdfDocument.Add(paragraph_fecha);
                pdfDocument.Add(paragraph_rut4);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(paragraph);
                pdfDocument.Add(new Paragraph(" "));

                pdfDocument.Add(pdfTablePorcentaje4);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSumaSinDomingos4);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableDomingosTrabajados4);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoLiquido4);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoLiquidoMasDomingo4);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTablePrestamos4);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldoFinal4);
                pdfDocument.Add(new Paragraph(" "));

                pdfDocument.Close();

                Response.ContentType = "application/pdf";
                Response.AppendHeader("content-disposition", "attachment;filename=PagosConductor " + DateTime.Now.ToString("dd-MM-yyyy-H.mmtt") + ".pdf");
                Response.Write(pdfDocument);
                Response.Flush();
                Response.End();

            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Algunos datos no se ingresaron correctamente');window.location='VerPorcentajesConductor.aspx';</script>'");
            }

        }
    }
}

