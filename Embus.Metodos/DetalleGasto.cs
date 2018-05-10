using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class DetalleGasto
    {
        private int id_detalle_gasto;
        private string patente;
        private int id_gasto;
        private DateTime fecha_detalle_gasto;
        private int valor_detalle_gasto;
        private string descripcion_detalle_gasto;        

        public DetalleGasto()
        {
        }

        public DetalleGasto(int id_detalle_gasto, string patente, int id_gasto, DateTime fecha_detalle_gasto, int valor_detalle_gasto, string descripcion_detalle_gasto)
        {
            this.id_detalle_gasto = id_detalle_gasto;
            this.patente = patente;
            this.id_gasto = id_gasto;
            this.fecha_detalle_gasto = fecha_detalle_gasto;
            this.valor_detalle_gasto = valor_detalle_gasto;
            this.descripcion_detalle_gasto = descripcion_detalle_gasto;
        }

        public DetalleGasto(string patente, int id_gasto, DateTime fecha_detalle_gasto, int valor_detalle_gasto, string descripcion_detalle_gasto)
        {
            this.patente = patente;
            this.id_gasto = id_gasto;
            this.fecha_detalle_gasto = fecha_detalle_gasto;
            this.valor_detalle_gasto = valor_detalle_gasto;
            this.descripcion_detalle_gasto = descripcion_detalle_gasto;
        }      

        public int Id_detalle_gasto
        {
            get { return id_detalle_gasto; }
            set { id_detalle_gasto = value; }
        }

        public String Patente
        {
            get { return patente; }
            set { patente = value; }
        }

        public int Id_gasto
        {
            get { return id_gasto; }
            set { id_gasto = value; }
        }

        public DateTime Fecha_detalle_gasto
        {
            get { return fecha_detalle_gasto; }
            set { fecha_detalle_gasto = value; }
        }

        public int Valor_detalle_gasto
        {
            get { return valor_detalle_gasto; }
            set { valor_detalle_gasto = value; }
        }

        public string Descripcion_detalle_gasto
        {
            get { return descripcion_detalle_gasto; }
            set { descripcion_detalle_gasto = value; }
        }
    }
}
