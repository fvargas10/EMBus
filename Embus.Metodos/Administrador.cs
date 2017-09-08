using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Administrador
    {
        private int rut_admin;
        private string clave_admin;
        private string nom_admin;
        private int tel_admin;
        private string dir_admin;

        public Administrador()
        {
        }

        public Administrador(string nom_admin)
        {
            this.nom_admin = nom_admin;
        }
       
        public Administrador(int rut_admin, string clave_admin)
        {
            this.rut_admin = rut_admin;
            this.clave_admin = clave_admin;
        }

        public Administrador(int rut_admin, string clave_admin, string nom_admin, int tel_admin, string dir_admin)
        {
            this.rut_admin = rut_admin;
            this.nom_admin = nom_admin;
            this.tel_admin = tel_admin;
            this.dir_admin = dir_admin;
            this.clave_admin = clave_admin;
        }

        public int Rut_admin
        {
            get { return rut_admin; }
            set { rut_admin = value; }
        }
        public string Clave_admin
        {
            get { return clave_admin; }
            set { clave_admin = value; }
        }
        public string Nom_admin
        {
            get { return nom_admin; }
            set { nom_admin = value; }
        }
        public int Tel_admin
        {
            get { return tel_admin; }
            set { tel_admin = value; }
        }
        public string Dir_admin
        {
            get { return dir_admin; }
            set { dir_admin = value; }
        }
    }

}
