using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Auxiliar
    {
        private int rut_aux;
        private int id_oficina;
        private string nom_aux;
        private int tel_aux;
        private bool estado_aux;

        public Auxiliar()
        {
        }

        public Auxiliar(int rut_aux, int id_oficina, string nom_aux, int tel_aux, bool estado_aux)
        {
            this.rut_aux = rut_aux;
            this.id_oficina = id_oficina;
            this.nom_aux = nom_aux;
            this.tel_aux = tel_aux;
            this.estado_aux = estado_aux;
        }

        public int Rut_aux
        {
            get { return rut_aux; }
            set { rut_aux = value; }
        }

        public int Id_oficina
        {
            get { return id_oficina; }
            set { id_oficina = value; }
        }

        public string Nom_aux
        {
            get { return nom_aux; }
            set { nom_aux = value; }
        }

        public int Tel_aux
        {
            get { return tel_aux; }
            set { tel_aux = value; }
        }

        public bool Estado_aux
        {
            get { return estado_aux; }
            set { estado_aux = value; }
        }

    }
}
