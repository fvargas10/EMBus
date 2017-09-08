using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Conductor
    {
        private int rut_con;
        private int id_oficina;
        private string nom_con;
        private int tel_con;
        private bool estado_con;

        public Conductor()
        {
        }

        public Conductor(int rut_con, int id_oficina, string nom_con, int tel_con, bool estado_con)
        {
            this.rut_con = rut_con;
            this.id_oficina = id_oficina;
            this.nom_con = nom_con;
            this.tel_con = tel_con;
            this.estado_con = estado_con;
        }

        public int Rut_con
        {
            get { return rut_con; }
            set { rut_con = value; }
        }

        public int Id_oficina
        {
            get { return id_oficina; }
            set { id_oficina = value; }
        }

        public string Nom_con
        {
            get { return nom_con; }
            set { nom_con = value; }
        }

        public int Tel_con
        {
            get { return tel_con; }
            set { tel_con = value; }
        }

        public bool Estado_con
        {
            get { return estado_con; }
            set { estado_con = value; }
        }
    }
}
