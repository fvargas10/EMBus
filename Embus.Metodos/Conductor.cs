using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Conductor
    {
        private string rut_con;
        private int id_oficina;
        private int id_tipo_usuario;
        private string primer_nombre_con;        
        private string segundo_nombre_con;        
        private string primer_apellido_con;        
        private string segundo_apellido_con;        
        private int tel_con;
        private bool estado_con;

        public Conductor()
        {
        }

        public Conductor(string rut_con, int id_oficina, int id_tipo_usuario, string primer_nombre_con, string segundo_nombre_con, string primer_apellido_con, string segundo_apellido_con, int tel_con, bool estado_con)
        {
            this.rut_con = rut_con;
            this.id_oficina = id_oficina;
            this.id_tipo_usuario = id_tipo_usuario;
            this.primer_nombre_con = primer_nombre_con;
            this.segundo_nombre_con = segundo_nombre_con;
            this.primer_apellido_con = primer_apellido_con;
            this.segundo_apellido_con = segundo_apellido_con;
            this.tel_con = tel_con;
            this.estado_con = estado_con;
        }

        public Conductor(string rut_con, bool estado_con)
        {
            this.rut_con = rut_con;            
            this.estado_con = estado_con;
        }

        public string Rut_con
        {
            get { return rut_con; }
            set { rut_con = value; }
        }

        public int Id_oficina
        {
            get { return id_oficina; }
            set { id_oficina = value; }
        }

        public int Id_tipo_usuario
        {
            get { return id_tipo_usuario; }
            set { id_tipo_usuario = value; }
        }

        public string Primer_nombre_con
        {
            get { return primer_nombre_con; }
            set { primer_nombre_con = value; }
        }

        public string Segundo_nombre_con
        {
            get { return segundo_nombre_con; }
            set { segundo_nombre_con = value; }
        }

        public string Primer_apellido_con
        {
            get { return primer_apellido_con; }
            set { primer_apellido_con = value; }
        }

        public string Segundo_apellido_con
        {
            get { return segundo_apellido_con; }
            set { segundo_apellido_con = value; }
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
