using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Marca
    {
        private string nombre_marca;

        public Marca()
        {

        }

        public Marca(string nombre_marca)
        {
            this.nombre_marca = nombre_marca;
        }

        public string Nombre_marca
        {
            get { return nombre_marca; }
            set { nombre_marca = value; }
        }
    }
     
}

