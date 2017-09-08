using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Gasto
    {
        private int id_gasto;
        private string tipo_gasto;
        private string descripcion_gasto;

        public Gasto()
        {
        }

        public Gasto(int id_gasto, string tipo_gasto, string descripcion_gasto)
        {
            this.id_gasto = id_gasto;
            this.tipo_gasto = tipo_gasto;
            this.descripcion_gasto = descripcion_gasto;
        }

        public int Id_gasto
        {
            get { return id_gasto; }
            set { id_gasto = value; }
        }

        public string Tipo_gasto
        {
            get { return tipo_gasto; }
            set { tipo_gasto = value; }
        }

        public string Descripcion_gasto
        {
            get { return descripcion_gasto; }
            set { descripcion_gasto = value; }
        }

    }
}
