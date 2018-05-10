using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Boleto
    {
        private int id_boleto;
        private int valor_boleto;

        public Boleto()
        {
        }

        public Boleto(int valor_boleto)
        {
            this.valor_boleto = valor_boleto;
        }

        public Boleto(int id_boleto, int valor_boleto)
        {
            this.id_boleto = id_boleto;
            this.valor_boleto = valor_boleto;
        }

        public int Id_boleto
        {
            get { return id_boleto; }
            set { id_boleto = value; }
        }

        public int Valor_boleto
        {
            get { return valor_boleto; }
            set { valor_boleto = value; }
        }
    }
}
