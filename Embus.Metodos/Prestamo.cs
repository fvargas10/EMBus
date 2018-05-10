using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Prestamo
    {
        private int valor_prestamo;
        private DateTime fecha_prestamo;
        private string rut_trabajador;

        public Prestamo()
        {

        }

        public Prestamo(int valor_prestamo, DateTime fecha_prestamo, string rut_trabajador)
        {
            this.valor_prestamo = valor_prestamo;
            this.fecha_prestamo = fecha_prestamo;
            this.rut_trabajador = rut_trabajador;
        }

        public string Rut_trabajador
        {
            get { return rut_trabajador; }
            set { rut_trabajador = value; }
        }

        public DateTime Fecha_prestamo
        {
            get { return fecha_prestamo; }
            set { fecha_prestamo = value; }
        }

        public int Valor_prestamo
        {
            get { return valor_prestamo; }
            set { valor_prestamo = value; }
        }
    }
}
