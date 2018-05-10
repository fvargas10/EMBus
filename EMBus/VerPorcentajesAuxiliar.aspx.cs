using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;

namespace EMBus
{
    public partial class VerPorcentajesAuxiliar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.generarPDF.Visible = false;
        }

        protected void btnMostrarPorcentajes_Click(object sender, EventArgs e)
        {

            if (this.txtfechadesde.Text == "" || this.txtfechahasta.Text == "" || this.txtnumeroconductores.Text == "")
            {
                this.btnMostrarPorcentajes.Visible = false;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Error, No ha ingresado todos los datos');window.location='VerPorcentajesAuxiliar.aspx';</script>'");
            }
            else
            {
                //obtener todos los dias trabajados para el auxiliar1
                datosBonoAuxiliar1.DataBind();
                gridBonoAuxiliar1.DataBind();

                //obtener todos los dias trabajados para el auxiliar2
                datosBonoAuxiliar2.DataBind();
                gridBonoAuxiliar2.DataBind();

                //obtener todos los dias trabajados para el auxiliar3
                datosBonoAuxilair3.DataBind();
                griBonoAuxiliar3.DataBind();

                //obtener dias domingos trabajados por el auxiliar1
                datosDomingoAuxiliar1.DataBind();
                gridDomingosAuxiliar1.DataBind();

                //obtener dias domingos trabajados por el auxiliar2
                datosDomingoAuxiliar2.DataBind();
                gridDomingosAuxiliar2.DataBind();

                //obtener dias domingos trabajados por el auxiliar3
                datosDomingoAuxiliar3.DataBind();
                gridDomingosAuxiliar3.DataBind();

                //obtener suma de bonos auxiliar1
                datosSumaBonoAuxiliar1.DataBind();
                gridSumaBonosAuxiliar1.DataBind();

                //obtener suma de bonos auxiliar2
                datosSumaBonoAuxiliar2.DataBind();
                gridSumaBonosAuxiliar2.DataBind();

                //obtener suma de bonos auxiliar3
                datosSumaBonoAuxiliar3.DataBind();
                gridSumaBonosAuxiliar3.DataBind();

                //obtener liquido mas fines de semanas trabajado por el auxiliar1
                datosLiquidoFDSAuxiliar1.DataBind();
                gridLiquidoFDSAuxiliar1.DataBind();

                //obtener liquido mas fines de semanas trabajado por el auxiliar2
                datosLiquidoFDSAuxiliar2.DataBind();
                gridLiquidoFDSAuxiliar2.DataBind();

                //obtener liquido mas fines de semanas trabajado por el auxiliar3
                datosLiquidoFDSAuxiliar3.DataBind();
                gridLiquidoFDSAuxiliar3.DataBind();

                //obtener los prestamos para el auxiliar1
                gridPrestamosAuxiliar1.DataBind();
                datosPrestamosAuxiliar1.DataBind();

                //obtener los prestamos para el auxiliar2
                gridPrestamosAuxiliar2.DataBind();
                datosPrestamosAuxiliar2.DataBind();

                //obtener los prestamos para el auxiliar3
                gridPrestamosAuxiliar3.DataBind();
                datosPrestamosAuxiliar3.DataBind();

                this.generarPDF.Visible = true;
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

                Paragraph paragraph_rut1 = new Paragraph("AUXILIAR: " + ddAuxiliar1.SelectedValue + " / " + ddAuxiliar1.SelectedItem, boldFontFecha);
                paragraph_rut1.Alignment = Element.ALIGN_LEFT;
                pdfDocument.Add(paragraph_rut1);
                pdfDocument.Add(new Paragraph(" "));

                Paragraph paragraph = new Paragraph("PAGOS AUXILIARES TRANSPORTES EMBUS LOS MUERMOS", boldFont);
                paragraph.Alignment = Element.ALIGN_CENTER;
                pdfDocument.Add(paragraph);

                /*tabla numero 1, bonos diarios auxiliar 1*/
                //creacion tabla numero 1, obtener dias trabajados
                PdfPTable pdfTableBono1 = new PdfPTable(gridBonoAuxiliar1.Columns.Count);
                pdfTableBono1.WidthPercentage = 60;
                //pdfTablePorcentaje1.HorizontalAlignment = Element.ALIGN_LEFT;

                PdfPCell tituloCol1A1 = new PdfPCell(new Phrase("DIA", _standardFont));
                tituloCol1A1.BorderWidth = 0;
                tituloCol1A1.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol2A1 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloCol2A1.BorderWidth = 0;
                tituloCol2A1.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol3A1 = new PdfPCell(new Phrase("BONO DIARIO", _standardFont));
                tituloCol3A1.BorderWidth = 0;
                tituloCol3A1.BorderWidthBottom = 0.75f;

                pdfTableBono1.AddCell(tituloCol1A1);
                pdfTableBono1.AddCell(tituloCol2A1);
                pdfTableBono1.AddCell(tituloCol3A1);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresBonos1 in gridBonoAuxiliar1.Rows)
                {
                    foreach (TableCell tableCellBono1 in valoresBonos1.Cells)
                    {
                        PdfPCell pdfCellBono1 = new PdfPCell(new Phrase(tableCellBono1.Text, _standardFont));
                        pdfCellBono1.BackgroundColor = new BaseColor(gridBonoAuxiliar1.RowStyle.BackColor);
                        pdfTableBono1.AddCell(pdfCellBono1);
                    }
                }
                /*fin tabla 1*/

                /*tabla numero 2, sabados auxiliar 1*/
                PdfPTable pdfTableSabado1 = new PdfPTable(gridSabadosAuxiliar1.Columns.Count);
                pdfTableSabado1.WidthPercentage = 60;

                PdfPCell tituloSabado1 = new PdfPCell(new Phrase("SABADOS", _standardFont));
                tituloSabado1.BorderWidth = 0;
                tituloSabado1.BorderWidthBottom = 0.75f;

                PdfPCell tituloFechaSabado1 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFechaSabado1.BorderWidth = 0;
                tituloFechaSabado1.BorderWidthBottom = 0.75f;

                pdfTableSabado1.AddCell(tituloSabado1);
                pdfTableSabado1.AddCell(tituloFechaSabado1);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresSabado1 in gridSabadosAuxiliar1.Rows)
                {
                    foreach (TableCell tableCellSabado1 in valoresSabado1.Cells)
                    {
                        PdfPCell pdfCellSabado1 = new PdfPCell(new Phrase(tableCellSabado1.Text, _standardFont));
                        pdfCellSabado1.BackgroundColor = new BaseColor(gridSabadosAuxiliar1.RowStyle.BackColor);
                        pdfTableSabado1.AddCell(pdfCellSabado1);
                    }
                }
                /*fin tabla 2*/

                /*tabla numero 3, domingos auxiliar 1*/
                PdfPTable pdfTableDomingo1 = new PdfPTable(gridDomingosAuxiliar1.Columns.Count);
                pdfTableDomingo1.WidthPercentage = 60;

                PdfPCell tituloDomingo1 = new PdfPCell(new Phrase("DOMINGOS", _standardFont));
                tituloDomingo1.BorderWidth = 0;
                tituloDomingo1.BorderWidthBottom = 0.75f;

                PdfPCell tituloFecha1 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFecha1.BorderWidth = 0;
                tituloFecha1.BorderWidthBottom = 0.75f;

                pdfTableDomingo1.AddCell(tituloDomingo1);
                pdfTableDomingo1.AddCell(tituloFecha1);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresDomingo1 in gridDomingosAuxiliar1.Rows)
                {
                    foreach (TableCell tableCellDomingo1 in valoresDomingo1.Cells)
                    {
                        PdfPCell pdfCellDomingo1 = new PdfPCell(new Phrase(tableCellDomingo1.Text, _standardFont));
                        pdfCellDomingo1.BackgroundColor = new BaseColor(gridDomingosAuxiliar1.RowStyle.BackColor);
                        pdfTableDomingo1.AddCell(pdfCellDomingo1);
                    }
                }
                /*fin tabla 3*/

                /*tabla numero 4, total lunes a viernes auxiliar 1*/
                PdfPTable pdfTableTotal1 = new PdfPTable(gridSumaBonosAuxiliar1.Columns.Count);
                pdfTableTotal1.WidthPercentage = 60;

                PdfPCell tituloTotal1 = new PdfPCell(new Phrase("TOTAL (LUNES A VIERNES)", _standardFont));
                tituloTotal1.BorderWidth = 0;
                tituloTotal1.BorderWidthBottom = 0.75f;

                pdfTableTotal1.AddCell(tituloTotal1);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresSumaBonos1 in gridSumaBonosAuxiliar1.Rows)
                {
                    foreach (TableCell tableCellSumaBonos1 in valoresSumaBonos1.Cells)
                    {
                        PdfPCell pdfCellSumaBonos1 = new PdfPCell(new Phrase(tableCellSumaBonos1.Text, _standardFont));
                        pdfCellSumaBonos1.BackgroundColor = new BaseColor(gridSumaBonosAuxiliar1.RowStyle.BackColor);
                        pdfTableTotal1.AddCell(pdfCellSumaBonos1);
                    }
                }
                /*fin tabla 4*/

                /*tabla numero 5, sueldo liquido auxiliar 1*/
                PdfPTable pdfTableLiquido1 = new PdfPTable(gridLiquidoAuxiliar1.Columns.Count);
                pdfTableLiquido1.WidthPercentage = 60;

                PdfPCell tituloTotalLiquido1 = new PdfPCell(new Phrase("SUELDO LIQUIDO", _standardFont));
                tituloTotalLiquido1.BorderWidth = 0;
                tituloTotalLiquido1.BorderWidthBottom = 0.75f;

                pdfTableLiquido1.AddCell(tituloTotalLiquido1);

                //recorre el grid del liquido 
                foreach (GridViewRow valoresLiquido1 in gridLiquidoAuxiliar1.Rows)
                {
                    foreach (TableCell tableCellSumaLiquido1 in valoresLiquido1.Cells)
                    {
                        PdfPCell pdfCellLiquido1 = new PdfPCell(new Phrase(tableCellSumaLiquido1.Text, _standardFont));
                        pdfCellLiquido1.BackgroundColor = new BaseColor(gridLiquidoAuxiliar1.RowStyle.BackColor);
                        pdfTableLiquido1.AddCell(pdfCellLiquido1);
                    }
                }
                /*fin tabla 5*/

                /*tabla numero 6, sueldo liquido mas fds auxiliar 1*/
                PdfPTable pdfTableLiquidoFDS1 = new PdfPTable(gridLiquidoFDSAuxiliar1.Columns.Count);
                pdfTableLiquidoFDS1.WidthPercentage = 60;

                PdfPCell tituloTotalLiquidoFDS1 = new PdfPCell(new Phrase("LIQUIDO MAS FINES DE SEMANA", _standardFont));
                tituloTotalLiquidoFDS1.BorderWidth = 0;
                tituloTotalLiquidoFDS1.BorderWidthBottom = 0.75f;

                pdfTableLiquidoFDS1.AddCell(tituloTotalLiquidoFDS1);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresLiquidoFDS1 in gridLiquidoFDSAuxiliar1.Rows)
                {
                    foreach (TableCell tableCellSumaLiquidoFDS1 in valoresLiquidoFDS1.Cells)
                    {
                        PdfPCell pdfCellLiquidoFDS1 = new PdfPCell(new Phrase(tableCellSumaLiquidoFDS1.Text, _standardFont));
                        pdfCellLiquidoFDS1.BackgroundColor = new BaseColor(gridLiquidoFDSAuxiliar1.RowStyle.BackColor);
                        pdfTableLiquidoFDS1.AddCell(pdfCellLiquidoFDS1);
                    }
                }
                /*fin tabla 6*/

                /*tabla numero 7, prestamo auxiliar 1*/
                PdfPTable pdfTablePrestamo1 = new PdfPTable(gridPrestamosAuxiliar1.Columns.Count);
                pdfTablePrestamo1.WidthPercentage = 60;

                PdfPCell tituloPrestamo1 = new PdfPCell(new Phrase("PRESTAMOS", _standardFont));
                tituloPrestamo1.BorderWidth = 0;
                tituloPrestamo1.BorderWidthBottom = 0.75f;

                pdfTablePrestamo1.AddCell(tituloPrestamo1);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresPrestamo1 in gridPrestamosAuxiliar1.Rows)
                {
                    foreach (TableCell tableCellPrestamo1 in valoresPrestamo1.Cells)
                    {
                        PdfPCell pdfCellPrestamo1 = new PdfPCell(new Phrase(tableCellPrestamo1.Text, _standardFont));
                        pdfCellPrestamo1.BackgroundColor = new BaseColor(gridPrestamosAuxiliar1.RowStyle.BackColor);
                        pdfTablePrestamo1.AddCell(pdfCellPrestamo1);
                    }
                }
                /*fin tabla 7*/

                /*tabla numero 8, sueldo auxiliar 1*/
                PdfPTable pdfTableSueldo1 = new PdfPTable(gridLiquidoFinalAuxiliar1.Columns.Count);
                pdfTableSueldo1.WidthPercentage = 60;

                PdfPCell tituloSueldo1 = new PdfPCell(new Phrase("SUELDO", _standardFont));
                tituloSueldo1.BorderWidth = 0;
                tituloSueldo1.BorderWidthBottom = 0.75f;

                pdfTableSueldo1.AddCell(tituloSueldo1);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresSueldo1 in gridLiquidoFinalAuxiliar1.Rows)
                {
                    foreach (TableCell tableCellSueldo1 in valoresSueldo1.Cells)
                    {
                        PdfPCell pdfCellSueldo1 = new PdfPCell(new Phrase(tableCellSueldo1.Text, _standardFont));
                        pdfCellSueldo1.BackgroundColor = new BaseColor(gridLiquidoFinalAuxiliar1.RowStyle.BackColor);
                        pdfTableSueldo1.AddCell(pdfCellSueldo1);
                    }
                }
                /*fin tabla 8*/

                /*CREACION SEGUNDA PAGINA*/
                Paragraph paragraph_rut2 = new Paragraph("AUXILIAR: " + ddAuxiliar2.SelectedValue + " / " + ddAuxiliar2.SelectedItem, boldFontFecha);
                paragraph_rut2.Alignment = Element.ALIGN_LEFT;

                /*tabla numero 1, bonos diarios auxiliar 1*/
                //creacion tabla numero 1, obtener dias trabajados
                PdfPTable pdfTableBono2 = new PdfPTable(gridBonoAuxiliar2.Columns.Count);
                pdfTableBono2.WidthPercentage = 60;

                PdfPCell tituloCol1A2 = new PdfPCell(new Phrase("DIA", _standardFont));
                tituloCol1A2.BorderWidth = 0;
                tituloCol1A2.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol2A2 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloCol2A2.BorderWidth = 0;
                tituloCol2A2.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol3A2 = new PdfPCell(new Phrase("BONO DIARIO", _standardFont));
                tituloCol3A2.BorderWidth = 0;
                tituloCol3A2.BorderWidthBottom = 0.75f;

                pdfTableBono2.AddCell(tituloCol1A2);
                pdfTableBono2.AddCell(tituloCol2A2);
                pdfTableBono2.AddCell(tituloCol3A2);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresBonos2 in gridBonoAuxiliar2.Rows)
                {
                    foreach (TableCell tableCellBono2 in valoresBonos2.Cells)
                    {
                        PdfPCell pdfCellBono2 = new PdfPCell(new Phrase(tableCellBono2.Text, _standardFont));
                        pdfCellBono2.BackgroundColor = new BaseColor(gridBonoAuxiliar2.RowStyle.BackColor);
                        pdfTableBono2.AddCell(pdfCellBono2);
                    }
                }
                /*fin tabla 1*/

                /*tabla numero 2, sabados auxiliar 1*/
                PdfPTable pdfTableSabado2 = new PdfPTable(gridSabadosAuxiliar2.Columns.Count);
                pdfTableSabado2.WidthPercentage = 60;

                PdfPCell tituloSabado2 = new PdfPCell(new Phrase("SABADOS", _standardFont));
                tituloSabado2.BorderWidth = 0;
                tituloSabado2.BorderWidthBottom = 0.75f;

                PdfPCell tituloFechaSabado2 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFechaSabado2.BorderWidth = 0;
                tituloFechaSabado2.BorderWidthBottom = 0.75f;

                pdfTableSabado2.AddCell(tituloSabado2);
                pdfTableSabado2.AddCell(tituloFechaSabado2);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresSabado2 in gridSabadosAuxiliar2.Rows)
                {
                    foreach (TableCell tableCellSabado2 in valoresSabado2.Cells)
                    {
                        PdfPCell pdfCellSabado2 = new PdfPCell(new Phrase(tableCellSabado2.Text, _standardFont));
                        pdfCellSabado2.BackgroundColor = new BaseColor(gridSabadosAuxiliar2.RowStyle.BackColor);
                        pdfTableSabado2.AddCell(pdfCellSabado2);
                    }
                }
                /*fin tabla 2*/

                /*tabla numero 3, domingos auxiliar 1*/
                PdfPTable pdfTableDomingo2 = new PdfPTable(gridDomingosAuxiliar2.Columns.Count);
                pdfTableDomingo2.WidthPercentage = 60;

                PdfPCell tituloDomingo2 = new PdfPCell(new Phrase("DOMINGOS", _standardFont));
                tituloDomingo2.BorderWidth = 0;
                tituloDomingo2.BorderWidthBottom = 0.75f;

                PdfPCell tituloFecha2 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFecha2.BorderWidth = 0;
                tituloFecha2.BorderWidthBottom = 0.75f;

                pdfTableDomingo2.AddCell(tituloDomingo2);
                pdfTableDomingo2.AddCell(tituloFecha2);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresDomingo2 in gridDomingosAuxiliar2.Rows)
                {
                    foreach (TableCell tableCellDomingo2 in valoresDomingo2.Cells)
                    {
                        PdfPCell pdfCellDomingo2 = new PdfPCell(new Phrase(tableCellDomingo2.Text, _standardFont));
                        pdfCellDomingo2.BackgroundColor = new BaseColor(gridDomingosAuxiliar2.RowStyle.BackColor);
                        pdfTableDomingo2.AddCell(pdfCellDomingo2);
                    }
                }
                /*fin tabla 3*/

                /*tabla numero 4, total lunes a viernes auxiliar 1*/
                PdfPTable pdfTableTotal2 = new PdfPTable(gridSumaBonosAuxiliar2.Columns.Count);
                pdfTableTotal2.WidthPercentage = 60;

                PdfPCell tituloTotal2 = new PdfPCell(new Phrase("TOTAL (LUNES A VIERNES)", _standardFont));
                tituloTotal2.BorderWidth = 0;
                tituloTotal2.BorderWidthBottom = 0.75f;

                pdfTableTotal2.AddCell(tituloTotal2);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresSumaBonos2 in gridSumaBonosAuxiliar2.Rows)
                {
                    foreach (TableCell tableCellSumaBonos2 in valoresSumaBonos2.Cells)
                    {
                        PdfPCell pdfCellSumaBonos2 = new PdfPCell(new Phrase(tableCellSumaBonos2.Text, _standardFont));
                        pdfCellSumaBonos2.BackgroundColor = new BaseColor(gridSumaBonosAuxiliar2.RowStyle.BackColor);
                        pdfTableTotal2.AddCell(pdfCellSumaBonos2);
                    }
                }
                /*fin tabla 4*/

                /*tabla numero 5, sueldo liquido auxiliar 1*/
                PdfPTable pdfTableLiquido2 = new PdfPTable(gridLiquidoAuxiliar2.Columns.Count);
                pdfTableLiquido2.WidthPercentage = 60;

                PdfPCell tituloTotalLiquido2 = new PdfPCell(new Phrase("SUELDO LIQUIDO", _standardFont));
                tituloTotalLiquido2.BorderWidth = 0;
                tituloTotalLiquido2.BorderWidthBottom = 0.75f;

                pdfTableLiquido2.AddCell(tituloTotalLiquido2);

                //recorre el grid del liquido 
                foreach (GridViewRow valoresLiquido2 in gridLiquidoAuxiliar2.Rows)
                {
                    foreach (TableCell tableCellSumaLiquido2 in valoresLiquido2.Cells)
                    {
                        PdfPCell pdfCellLiquido2 = new PdfPCell(new Phrase(tableCellSumaLiquido2.Text, _standardFont));
                        pdfCellLiquido2.BackgroundColor = new BaseColor(gridLiquidoAuxiliar2.RowStyle.BackColor);
                        pdfTableLiquido2.AddCell(pdfCellLiquido2);
                    }
                }
                /*fin tabla 5*/

                /*tabla numero 6, sueldo liquido mas fds auxiliar 1*/
                PdfPTable pdfTableLiquidoFDS2 = new PdfPTable(gridLiquidoFDSAuxiliar2.Columns.Count);
                pdfTableLiquidoFDS2.WidthPercentage = 60;

                PdfPCell tituloTotalLiquidoFDS2 = new PdfPCell(new Phrase("LIQUIDO MAS FINES DE SEMANA", _standardFont));
                tituloTotalLiquidoFDS2.BorderWidth = 0;
                tituloTotalLiquidoFDS2.BorderWidthBottom = 0.75f;

                pdfTableLiquidoFDS2.AddCell(tituloTotalLiquidoFDS2);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresLiquidoFDS2 in gridLiquidoFDSAuxiliar2.Rows)
                {
                    foreach (TableCell tableCellSumaLiquidoFDS2 in valoresLiquidoFDS2.Cells)
                    {
                        PdfPCell pdfCellLiquidoFDS2 = new PdfPCell(new Phrase(tableCellSumaLiquidoFDS2.Text, _standardFont));
                        pdfCellLiquidoFDS2.BackgroundColor = new BaseColor(gridLiquidoFDSAuxiliar2.RowStyle.BackColor);
                        pdfTableLiquidoFDS2.AddCell(pdfCellLiquidoFDS2);
                    }
                }
                /*fin tabla 6*/

                /*tabla numero 7, prestamo auxiliar 1*/
                PdfPTable pdfTablePrestamo2 = new PdfPTable(gridPrestamosAuxiliar2.Columns.Count);
                pdfTablePrestamo2.WidthPercentage = 60;

                PdfPCell tituloPrestamo2 = new PdfPCell(new Phrase("PRESTAMOS", _standardFont));
                tituloPrestamo2.BorderWidth = 0;
                tituloPrestamo2.BorderWidthBottom = 0.75f;

                pdfTablePrestamo2.AddCell(tituloPrestamo2);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresPrestamo2 in gridPrestamosAuxiliar2.Rows)
                {
                    foreach (TableCell tableCellPrestamo2 in valoresPrestamo2.Cells)
                    {
                        PdfPCell pdfCellPrestamo2 = new PdfPCell(new Phrase(tableCellPrestamo2.Text, _standardFont));
                        pdfCellPrestamo2.BackgroundColor = new BaseColor(gridPrestamosAuxiliar2.RowStyle.BackColor);
                        pdfTablePrestamo2.AddCell(pdfCellPrestamo2);
                    }
                }
                /*fin tabla 7*/

                /*tabla numero 8, sueldo auxiliar 1*/
                PdfPTable pdfTableSueldo2 = new PdfPTable(gridLiquidoFinalAuxiliar2.Columns.Count);
                pdfTableSueldo2.WidthPercentage = 60;

                PdfPCell tituloSueldo2 = new PdfPCell(new Phrase("SUELDO", _standardFont));
                tituloSueldo2.BorderWidth = 0;
                tituloSueldo2.BorderWidthBottom = 0.75f;

                pdfTableSueldo2.AddCell(tituloSueldo2);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresSueldo2 in gridLiquidoFinalAuxiliar2.Rows)
                {
                    foreach (TableCell tableCellSueldo2 in valoresSueldo2.Cells)
                    {
                        PdfPCell pdfCellSueldo2 = new PdfPCell(new Phrase(tableCellSueldo2.Text, _standardFont));
                        pdfCellSueldo2.BackgroundColor = new BaseColor(gridLiquidoFinalAuxiliar2.RowStyle.BackColor);
                        pdfTableSueldo2.AddCell(pdfCellSueldo2);
                    }
                }
                /*fin tabla 8*/



                /*FIN SEGUNDA PAGINA*/

                /*CREACION TERCERA PAGINA*/
                Paragraph paragraph_rut3 = new Paragraph("AUXILIAR: " + ddAuxiliar3.SelectedValue + " / " + ddAuxiliar3.SelectedItem, boldFontFecha);
                paragraph_rut3.Alignment = Element.ALIGN_LEFT;

                /*tabla numero 1, bonos diarios auxiliar 1*/
                //creacion tabla numero 1, obtener dias trabajados
                PdfPTable pdfTableBono3 = new PdfPTable(griBonoAuxiliar3.Columns.Count);
                pdfTableBono3.WidthPercentage = 60;

                PdfPCell tituloCol1A3 = new PdfPCell(new Phrase("DIA", _standardFont));
                tituloCol1A3.BorderWidth = 0;
                tituloCol1A3.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol2A3 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloCol2A3.BorderWidth = 0;
                tituloCol2A3.BorderWidthBottom = 0.75f;

                PdfPCell tituloCol3A3 = new PdfPCell(new Phrase("BONO DIARIO", _standardFont));
                tituloCol3A3.BorderWidth = 0;
                tituloCol3A3.BorderWidthBottom = 0.75f;

                pdfTableBono3.AddCell(tituloCol1A3);
                pdfTableBono3.AddCell(tituloCol2A3);
                pdfTableBono3.AddCell(tituloCol3A3);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresBonos3 in griBonoAuxiliar3.Rows)
                {
                    foreach (TableCell tableCellBono3 in valoresBonos3.Cells)
                    {
                        PdfPCell pdfCellBono3 = new PdfPCell(new Phrase(tableCellBono3.Text, _standardFont));
                        pdfCellBono3.BackgroundColor = new BaseColor(griBonoAuxiliar3.RowStyle.BackColor);
                        pdfTableBono3.AddCell(pdfCellBono3);
                    }
                }
                /*fin tabla 1*/

                /*tabla numero 2, sabados auxiliar 1*/
                PdfPTable pdfTableSabado3 = new PdfPTable(gridSabadosAuxiliar3.Columns.Count);
                pdfTableSabado3.WidthPercentage = 60;

                PdfPCell tituloSabado3 = new PdfPCell(new Phrase("SABADOS", _standardFont));
                tituloSabado3.BorderWidth = 0;
                tituloSabado3.BorderWidthBottom = 0.75f;

                PdfPCell tituloFechaSabado3 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFechaSabado3.BorderWidth = 0;
                tituloFechaSabado3.BorderWidthBottom = 0.75f;

                pdfTableSabado3.AddCell(tituloSabado3);
                pdfTableSabado3.AddCell(tituloFechaSabado3);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresSabado3 in gridSabadosAuxiliar3.Rows)
                {
                    foreach (TableCell tableCellSabado3 in valoresSabado3.Cells)
                    {
                        PdfPCell pdfCellSabado3 = new PdfPCell(new Phrase(tableCellSabado3.Text, _standardFont));
                        pdfCellSabado3.BackgroundColor = new BaseColor(gridSabadosAuxiliar3.RowStyle.BackColor);
                        pdfTableSabado3.AddCell(pdfCellSabado3);
                    }
                }
                /*fin tabla 2*/

                /*tabla numero 3, domingos auxiliar 1*/
                PdfPTable pdfTableDomingo3 = new PdfPTable(gridDomingosAuxiliar3.Columns.Count);
                pdfTableDomingo3.WidthPercentage = 60;

                PdfPCell tituloDomingo3 = new PdfPCell(new Phrase("DOMINGOS", _standardFont));
                tituloDomingo3.BorderWidth = 0;
                tituloDomingo3.BorderWidthBottom = 0.75f;

                PdfPCell tituloFecha3 = new PdfPCell(new Phrase("FECHA", _standardFont));
                tituloFecha3.BorderWidth = 0;
                tituloFecha3.BorderWidthBottom = 0.75f;

                pdfTableDomingo3.AddCell(tituloDomingo3);
                pdfTableDomingo3.AddCell(tituloFecha3);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresDomingo3 in gridDomingosAuxiliar3.Rows)
                {
                    foreach (TableCell tableCellDomingo3 in valoresDomingo3.Cells)
                    {
                        PdfPCell pdfCellDomingo3 = new PdfPCell(new Phrase(tableCellDomingo3.Text, _standardFont));
                        pdfCellDomingo3.BackgroundColor = new BaseColor(gridDomingosAuxiliar3.RowStyle.BackColor);
                        pdfTableDomingo3.AddCell(pdfCellDomingo3);
                    }
                }
                /*fin tabla 3*/

                /*tabla numero 4, total lunes a viernes auxiliar 1*/
                PdfPTable pdfTableTotal3 = new PdfPTable(gridSumaBonosAuxiliar3.Columns.Count);
                pdfTableTotal3.WidthPercentage = 60;

                PdfPCell tituloTotal3 = new PdfPCell(new Phrase("TOTAL (LUNES A VIERNES)", _standardFont));
                tituloTotal3.BorderWidth = 0;
                tituloTotal3.BorderWidthBottom = 0.75f;

                pdfTableTotal3.AddCell(tituloTotal3);

                //recorre el primer grid, el de los bonos
                foreach (GridViewRow valoresSumaBonos3 in gridSumaBonosAuxiliar3.Rows)
                {
                    foreach (TableCell tableCellSumaBonos3 in valoresSumaBonos3.Cells)
                    {
                        PdfPCell pdfCellSumaBonos3 = new PdfPCell(new Phrase(tableCellSumaBonos3.Text, _standardFont));
                        pdfCellSumaBonos3.BackgroundColor = new BaseColor(gridSumaBonosAuxiliar3.RowStyle.BackColor);
                        pdfTableTotal3.AddCell(pdfCellSumaBonos3);
                    }
                }
                /*fin tabla 4*/

                /*tabla numero 5, sueldo liquido auxiliar 1*/
                PdfPTable pdfTableLiquido3 = new PdfPTable(gridLiquidoAuxiliar3.Columns.Count);
                pdfTableLiquido3.WidthPercentage = 60;

                PdfPCell tituloTotalLiquido3 = new PdfPCell(new Phrase("SUELDO LIQUIDO", _standardFont));
                tituloTotalLiquido3.BorderWidth = 0;
                tituloTotalLiquido3.BorderWidthBottom = 0.75f;

                pdfTableLiquido3.AddCell(tituloTotalLiquido3);

                //recorre el grid del liquido 
                foreach (GridViewRow valoresLiquido3 in gridLiquidoAuxiliar3.Rows)
                {
                    foreach (TableCell tableCellSumaLiquido3 in valoresLiquido3.Cells)
                    {
                        PdfPCell pdfCellLiquido3 = new PdfPCell(new Phrase(tableCellSumaLiquido3.Text, _standardFont));
                        pdfCellLiquido3.BackgroundColor = new BaseColor(gridLiquidoAuxiliar3.RowStyle.BackColor);
                        pdfTableLiquido3.AddCell(pdfCellLiquido3);
                    }
                }
                /*fin tabla 5*/

                /*tabla numero 6, sueldo liquido mas fds auxiliar 1*/
                PdfPTable pdfTableLiquidoFDS3 = new PdfPTable(gridLiquidoFDSAuxiliar3.Columns.Count);
                pdfTableLiquidoFDS3.WidthPercentage = 60;

                PdfPCell tituloTotalLiquidoFDS3 = new PdfPCell(new Phrase("LIQUIDO MAS FINES DE SEMANA", _standardFont));
                tituloTotalLiquidoFDS3.BorderWidth = 0;
                tituloTotalLiquidoFDS3.BorderWidthBottom = 0.75f;

                pdfTableLiquidoFDS3.AddCell(tituloTotalLiquidoFDS3);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresLiquidoFDS3 in gridLiquidoFDSAuxiliar3.Rows)
                {
                    foreach (TableCell tableCellSumaLiquidoFDS3 in valoresLiquidoFDS3.Cells)
                    {
                        PdfPCell pdfCellLiquidoFDS3 = new PdfPCell(new Phrase(tableCellSumaLiquidoFDS3.Text, _standardFont));
                        pdfCellLiquidoFDS3.BackgroundColor = new BaseColor(gridLiquidoFDSAuxiliar3.RowStyle.BackColor);
                        pdfTableLiquidoFDS3.AddCell(pdfCellLiquidoFDS3);
                    }
                }
                /*fin tabla 6*/

                /*tabla numero 7, prestamo auxiliar 1*/
                PdfPTable pdfTablePrestamo3 = new PdfPTable(gridPrestamosAuxiliar3.Columns.Count);
                pdfTablePrestamo3.WidthPercentage = 60;

                PdfPCell tituloPrestamo3 = new PdfPCell(new Phrase("PRESTAMOS", _standardFont));
                tituloPrestamo3.BorderWidth = 0;
                tituloPrestamo3.BorderWidthBottom = 0.75f;

                pdfTablePrestamo3.AddCell(tituloPrestamo3);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresPrestamo3 in gridPrestamosAuxiliar3.Rows)
                {
                    foreach (TableCell tableCellPrestamo3 in valoresPrestamo3.Cells)
                    {
                        PdfPCell pdfCellPrestamo3 = new PdfPCell(new Phrase(tableCellPrestamo3.Text, _standardFont));
                        pdfCellPrestamo3.BackgroundColor = new BaseColor(gridPrestamosAuxiliar3.RowStyle.BackColor);
                        pdfTablePrestamo3.AddCell(pdfCellPrestamo3);
                    }
                }
                /*fin tabla 7*/

                /*tabla numero 8, sueldo auxiliar 1*/
                PdfPTable pdfTableSueldo3 = new PdfPTable(gridLiquidoFinalAuxiliar3.Columns.Count);
                pdfTableSueldo3.WidthPercentage = 60;

                PdfPCell tituloSueldo3 = new PdfPCell(new Phrase("SUELDO", _standardFont));
                tituloSueldo3.BorderWidth = 0;
                tituloSueldo3.BorderWidthBottom = 0.75f;

                pdfTableSueldo3.AddCell(tituloSueldo3);

                //recorre el grid del liquido mas fines de semana 
                foreach (GridViewRow valoresSueldo3 in gridLiquidoFinalAuxiliar3.Rows)
                {
                    foreach (TableCell tableCellSueldo3 in valoresSueldo3.Cells)
                    {
                        PdfPCell pdfCellSueldo3 = new PdfPCell(new Phrase(tableCellSueldo3.Text, _standardFont));
                        pdfCellSueldo3.BackgroundColor = new BaseColor(gridLiquidoFinalAuxiliar3.RowStyle.BackColor);
                        pdfTableSueldo3.AddCell(pdfCellSueldo3);
                    }
                }
                /*fin tabla 8*/
                /*FIN TERCERA PAGINA*/

                pdfDocument.AddTitle("EMBus PAGOS");

                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableBono1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSabado1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableDomingo1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableTotal1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableLiquido1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableLiquidoFDS1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTablePrestamo1);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldo1);
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

                pdfDocument.Add(pdfTableBono2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSabado2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableDomingo2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableTotal2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableLiquido2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableLiquidoFDS2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTablePrestamo2);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldo2);
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

                pdfDocument.Add(pdfTableBono3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSabado3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableDomingo3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableTotal3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableLiquido3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableLiquidoFDS3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTablePrestamo3);
                pdfDocument.Add(new Paragraph(" "));
                pdfDocument.Add(pdfTableSueldo3);
                pdfDocument.Add(new Paragraph(" "));

                pdfDocument.Close();

                Response.ContentType = "application/pdf";
                Response.AppendHeader("content-disposition", "attachment;filename=PagosAuxiliar " + DateTime.Now.ToString("dd-MM-yyyy-H.mmtt") + ".pdf");
                Response.Write(pdfDocument);
                Response.Flush();
                Response.End();

            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Algunos datos no se ingresaron correctamente');window.location='VerPorcentajesAuxiliar.aspx';</script>'");
            }

        }
          
    }
}