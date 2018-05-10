using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMBus
{
    public partial class VerGananciasBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            graficoVentasPorBus.Visible = false;
        }

        protected void btnmostrarganancias_Click(object sender, EventArgs e)
        {
            //titulo para cada eje
            //graficoVentasPorBus.Series["Series2"].Points[1].AxisLabel = "First Point";

            //dar formato de pesos chilenos a los valores obtenidos
            graficoVentasPorBus.Series["Ingresos"].Label = "#VALY{$#.###}";
            graficoVentasPorBus.Series["Gastos"].Label = "#VALY{$#.###}";
            graficoVentasPorBus.Series["Ganancia"].Label = "#VALY{$#.###}"; 
            //graficoVentasPorBus.Series["Series1"].SmartLabelStyle.Enabled = true;

            //dar formato de pesos chilenos al eje y
            graficoVentasPorBus.ChartAreas[0].AxisY.LabelStyle.Format = "${0:#,0}";

            //color de la linea del eje y
            graficoVentasPorBus.ChartAreas[0].AxisY.LineColor = System.Drawing.Color.SkyBlue;
            graficoVentasPorBus.ChartAreas[0].AxisX.LineColor = System.Drawing.Color.SkyBlue;

            //cambia de color los datos del eje y
            //graficoVentasPorBus.ChartAreas[0].AxisY.LabelStyle.ForeColor = System.Drawing.Color.SkyBlue;

            //hago visible el gráfico y lleno segun los datos ingresados
            graficoVentasPorBus.Visible = true;
            graficoVentasPorBus.DataBind();

            //quita las grillas de los dos ejes
            //graficoVentasPorBus.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
            //graficoVentasPorBus.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;

            //dar color a las lineas o grillas de ambos ejes
            graficoVentasPorBus.ChartAreas["ChartArea1"].AxisY.MajorGrid.LineColor = System.Drawing.Color.SkyBlue;
            graficoVentasPorBus.ChartAreas["ChartArea1"].AxisX.MajorGrid.LineColor = System.Drawing.Color.SkyBlue;

            graficoVentasPorBus.Series[0]["PointWidth"] = "0.95";
            graficoVentasPorBus.Series[1]["PointWidth"] = "0.95";
            graficoVentasPorBus.Series[2]["PointWidth"] = "0.95";

        }
    }
}