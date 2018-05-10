using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Gasto
    {
        private int id_gasto;
        private string nombre_gasto;

        public Gasto()
        {
        }

        public Gasto(int id_gasto, string nombre_gasto)
        {
            this.id_gasto = id_gasto;
            this.nombre_gasto = nombre_gasto;
        }

        public int Id_gasto
        {
            get { return id_gasto; }
            set { id_gasto = value; }
        }

        public string Nombre_gasto
        {
            get { return nombre_gasto; }
            set { nombre_gasto = value; }
        }       
    }
}
