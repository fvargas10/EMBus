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

namespace EMBus
{
    public partial class FlujoDeCaja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnmostrarflujocaja_Click(object sender, EventArgs e)
        {
            gridFC.DataBind();
            datosFC.DataBind();
           
        }

        protected void btnexportarpdf_Click(object sender, EventArgs e)
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

            Paragraph paragraph_fecha = new Paragraph("PERIODO FLUJO DE CAJA : " + txtfechadesde.Text + " / " + txtfechahasta.Text, boldFontFecha);
            paragraph_fecha.Alignment = Element.ALIGN_LEFT;
            pdfDocument.Add(paragraph_fecha);

            Paragraph paragraph_sr = new Paragraph("SR: EMPRESA DE TRANSPORTES EMBUS LIMITADA ", boldFontFecha);
            paragraph_sr.Alignment = Element.ALIGN_LEFT;
            pdfDocument.Add(paragraph_sr);

            Paragraph paragraph_rut = new Paragraph("RUT: 76.020.661-K ", boldFontFecha);
            paragraph_rut.Alignment = Element.ALIGN_LEFT;
            pdfDocument.Add(paragraph_rut);

            Paragraph paragraph_direccion = new Paragraph("DIRECCION: CANAL BEAGLE N° 671, POBLACION MANUEL RODRIGUEZ, PUERTO MONTT.", boldFontFecha);
            paragraph_direccion.Alignment = Element.ALIGN_LEFT;
            pdfDocument.Add(paragraph_direccion);

            Paragraph paragraph_giro = new Paragraph("GIRO COMERCIAL: TRANSPORTES DE PASAJEROS", boldFontFecha);
            paragraph_giro.Alignment = Element.ALIGN_LEFT;
            pdfDocument.Add(paragraph_giro);

            Paragraph paragraph_inicioAct = new Paragraph("FECHA INICIO ACTIVIDADES: 02 DE JUNIO 2008", boldFontFecha);
            paragraph_inicioAct.Alignment = Element.ALIGN_LEFT;
            pdfDocument.Add(paragraph_inicioAct);            

            Paragraph paragraph_patente = new Paragraph("PATENTE: " + ddpatente.SelectedValue, boldFontFecha);
            paragraph_patente.Alignment = Element.ALIGN_LEFT;
            pdfDocument.Add(paragraph_patente);
            pdfDocument.Add(new Paragraph(" "));

            //creacion tabla numero 1, INGRESOS
            PdfPTable pdfTableIngresos = new PdfPTable(4);
            pdfTableIngresos.WidthPercentage = 60;

            PdfPCell tituloCol1 = new PdfPCell(new Phrase("FECHA", _standardFont));
            tituloCol1.BorderWidth = 0;
            tituloCol1.BorderWidthBottom = 0.75f;

            PdfPCell tituloCol2 = new PdfPCell(new Phrase("INGRESOS", _standardFont));
            tituloCol2.BorderWidth = 0;
            tituloCol2.BorderWidthBottom = 0.75f;

            PdfPCell tituloCol3 = new PdfPCell(new Phrase("EGRESOS", _standardFont));
            tituloCol3.BorderWidth = 0;
            tituloCol3.BorderWidthBottom = 0.75f;

            PdfPCell tituloCol4 = new PdfPCell(new Phrase("LIQUIDO", _standardFont));
            tituloCol4.BorderWidth = 0;
            tituloCol4.BorderWidthBottom = 0.75f;

            pdfTableIngresos.AddCell(tituloCol1);
            pdfTableIngresos.AddCell(tituloCol2);
            pdfTableIngresos.AddCell(tituloCol3);
            pdfTableIngresos.AddCell(tituloCol4);


            //recorre el primer grid, el de los porcentajes
            foreach (GridViewRow valoresIngresos in gridFC.Rows)
            {
                foreach (TableCell tableCellIngresos in valoresIngresos.Cells)
                {
                    PdfPCell pdfCellIngresos = new PdfPCell(new Phrase(tableCellIngresos.Text, _standardFont));
                    pdfCellIngresos.BackgroundColor = new BaseColor(gridFC.RowStyle.BackColor);
                    pdfTableIngresos.AddCell(pdfCellIngresos);
                }
            }     

            pdfDocument.AddTitle("EMBus Flujo de Caja");

            pdfDocument.Add(new Paragraph(" "));
            pdfDocument.Add(pdfTableIngresos);
            //pdfDocument.Add(new Paragraph(" "));
            //pdfDocument.Add(pdfTableSumaSinDomingos1);
            //pdfDocument.Add(new Paragraph(" "));
            //pdfDocument.Add(pdfTableDomingosTrabajados1);
            //pdfDocument.Add(new Paragraph(" "));
            //pdfDocument.Add(pdfTableSueldoLiquido1);
            //pdfDocument.Add(new Paragraph(" "));
            //pdfDocument.Add(pdfTableSueldoLiquidoMasDomingo1);
            //pdfDocument.Add(new Paragraph(" "));
            //pdfDocument.Add(pdfTablePrestamos1);
            //pdfDocument.Add(new Paragraph(" "));
            //pdfDocument.Add(pdfTableSueldoFinal1);
            //pdfDocument.Add(new Paragraph(" "));                                           

            pdfDocument.Close();

            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=FlujoCajaEmbus " + DateTime.Now.ToString("dd-MM-yyyy-H.mmtt") + ".pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();

        }
    }
}