using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EMBus
{
    public class Usuario
    {
        private string rut_usuario;
        private int tipo_usuario;        
        private string clave_usuario;
        private string primer_nombre_usuario;        
        private string segundo_nombre_usuario;        
        private string primer_apellido_usuario;        
        private string segundo_apellido_usuario;       
        private int tel_usuario;
        private string dir_usuario;
        private string correo_usuario;
        private int estado;

        public Usuario()
        {
        }      

        public Usuario(int tipo_usuario)
        {
            this.tipo_usuario = tipo_usuario;
        }

        public Usuario(string primer_nombre_usuario)
        {
            this.primer_nombre_usuario = primer_nombre_usuario;
        }

        public Usuario(string primer_nombre_usuario, string segundo_nombre_usuario, string primer_apellido_usuario, string segundo_apellido_usuario)
        {
            this.primer_nombre_usuario = primer_nombre_usuario;
            this.segundo_nombre_usuario = segundo_nombre_usuario;
            this.primer_apellido_usuario = primer_apellido_usuario;
            this.segundo_apellido_usuario = segundo_apellido_usuario;
        }

        public Usuario(string rut_usuario, int tipo_usuario, string clave_usuario, string primer_nombre_usuario, string segundo_nombre_usuario, string primer_apellido_usuario, string segundo_apellido_usuario, int tel_usuario, string dir_usuario, string correo_usuario, int estado)
        {
            this.rut_usuario = rut_usuario;
            this.tipo_usuario = tipo_usuario;
            this.clave_usuario = clave_usuario;
            this.primer_nombre_usuario = primer_nombre_usuario;
            this.segundo_nombre_usuario = segundo_nombre_usuario;
            this.primer_apellido_usuario = primer_apellido_usuario;
            this.segundo_apellido_usuario = segundo_apellido_usuario;
            this.tel_usuario = tel_usuario;
            this.dir_usuario = dir_usuario;
            this.correo_usuario = correo_usuario;
            this.estado = estado;
        }

        public Usuario(string rut_usuario, string clave_usuario)
        {
            this.rut_usuario = rut_usuario;
            this.clave_usuario = clave_usuario;
        }

        public string Rut_usuario
        {
            get { return rut_usuario; }
            set { rut_usuario = value; }
        }

        public int Tipo_usuario
        {
            get { return tipo_usuario; }
            set { tipo_usuario = value; }
        }      

        public string Clave_usuario
        {
            get { return clave_usuario; }
            set { clave_usuario = value; }
        }

        public string Primer_nombre_usuario
        {
            get { return primer_nombre_usuario; }
            set { primer_nombre_usuario = value; }
        }

        public string Segundo_nombre_usuario
        {
            get { return segundo_nombre_usuario; }
            set { segundo_nombre_usuario = value; }
        }

        public string Primer_apellido_usuario
        {
            get { return primer_apellido_usuario; }
            set { primer_apellido_usuario = value; }
        }

        public string Segundo_apellido_usuario
        {
            get { return segundo_apellido_usuario; }
            set { segundo_apellido_usuario = value; }
        }        

        public int Tel_usuario
        {
            get { return tel_usuario; }
            set { tel_usuario = value; }
        }

        public string Dir_usuario
        {
            get { return dir_usuario; }
            set { dir_usuario = value; }
        }

        public string Correo_usuario
        {
            get { return correo_usuario; }
            set { correo_usuario = value; }
        }

        public int Estado
        {
            get { return estado; }
            set { estado = value; }
        }

    }
}