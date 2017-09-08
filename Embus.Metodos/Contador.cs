using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Contador
    {
        private int rut_cont;
        private string clave_cont;
        private string nom_cont;
        private int tel_cont;
        private string dir_cont;

        public Contador()
        {
        }

        public Contador(int rut_cont, string clave_cont, string nom_cont, int tel_cont, string dir_cont)
        {
            this.rut_cont = rut_cont;
            this.clave_cont = clave_cont;
            this.nom_cont = nom_cont;
            this.tel_cont = tel_cont;
            this.dir_cont = dir_cont;
        }

        public int Rut_cont
        {
            get { return rut_cont; }
            set { rut_cont = value; }
        }

        public string Clave_cont
        {
            get { return clave_cont; }
            set { clave_cont = value; }
        }

        public string Nom_cont
        {
            get { return nom_cont; }
            set { nom_cont = value; }
        }

        public int Tel_cont
        {
            get { return tel_cont; }
            set { tel_cont = value; }
        }

        public string Dir_cont
        {
            get { return dir_cont; }
            set { dir_cont = value; }
        }
    }
}
