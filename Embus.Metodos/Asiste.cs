using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Asiste
    {
        private Auxiliar rut_aux;
        private Bus patente;

        public Asiste()
        {
        }

        public Asiste(Auxiliar rut_aux, Bus patente)
        {
            this.rut_aux = rut_aux;
            this.patente = patente;
        }

        public Auxiliar Rut_aux
        {
            get { return rut_aux; }
            set { rut_aux = value; }
        }

        public Bus Patente
        {
            get { return patente; }
            set { patente = value; }
        }
    }
}
