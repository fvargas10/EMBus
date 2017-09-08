using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Conduce
    {
        private Conductor rut_con;
        private Bus patente;

        public Conduce()
        {
        }

        public Conduce(Conductor rut_con, Bus patente)
        {
            this.rut_con = rut_con;
            this.patente = patente;
        }

        public Conductor Rut_con
        {
            get { return rut_con; }
            set { rut_con = value; }
        }

        public Bus Patente
        {
            get { return patente; }
            set { patente = value; }
        }
    }
}
