using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class DetalleGasto
    {
        private int id_detallegasto;
        private int id_gasto;
        private int valor_detgasto;
        private string info_detgasto;

        public DetalleGasto()
        {
        }

        public DetalleGasto(int id_detallegasto, int id_gasto, int valor_detgasto, string info_detgasto)
        {
            this.id_detallegasto = id_detallegasto;
            this.id_gasto = id_gasto;
            this.valor_detgasto = valor_detgasto;
            this.info_detgasto = info_detgasto;
        }

        public int Id_detallegasto
        {
            get { return id_detallegasto; }
            set { id_detallegasto = value; }
        }

        public int Id_gasto
        {
            get { return id_gasto; }
            set { id_gasto = value; }
        }

        public int Valor_detgasto
        {
            get { return valor_detgasto; }
            set { valor_detgasto = value; }
        }

        public string Info_detgasto
        {
            get { return info_detgasto; }
            set { info_detgasto = value; }
        }

    }
}
