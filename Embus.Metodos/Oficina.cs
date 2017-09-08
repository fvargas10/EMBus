using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Oficina
    {
        private int id_oficina;
        private int rut_admin;        
        private string dir_oficina;        
        private string comuna_oficina;        

        public Oficina()
        {
        }

        public Oficina(int rut_admin, string dir_oficina, string comuna_oficina)
        {
            this.rut_admin = rut_admin;
            this.dir_oficina = dir_oficina;
            this.comuna_oficina = comuna_oficina;
        }

        public int Id_oficina
        {
            get { return id_oficina; }
            set { id_oficina = value; }
        }

        public int Rut_admin
        {
            get { return rut_admin; }
            set { rut_admin = value; }
        }

        public string Dir_oficina
        {
            get { return dir_oficina; }
            set { dir_oficina = value; }
        }

        public string Comuna_oficina
        {
            get { return comuna_oficina; }
            set { comuna_oficina = value; }
        }
    }
    

}
