using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Auxiliar
    {
        private string rut_aux;
        private int id_tipo_usuario;
        private int id_oficina;
        private string primer_nombre_aux;
        private string segundo_nombre_aux;
        private string primer_apellido_aux;
        private string segundo_apellido_aux;
        private int tel_aux;
        private bool estado_aux;

        public Auxiliar()
        {
        }

        public Auxiliar(string rut_aux, int id_tipo_usuario, int id_oficina, string primer_nombre_auxiliar, string segundo_nombre_auxiliar, string primer_apellido_auxiliar, string segundo_apellido_auxiliar, int tel_aux, bool estado_aux)
        {
            this.rut_aux = rut_aux;
            this.id_tipo_usuario = id_tipo_usuario;
            this.id_oficina = id_oficina;
            this.primer_nombre_aux = primer_nombre_auxiliar;
            this.segundo_nombre_aux = segundo_nombre_auxiliar;
            this.primer_apellido_aux = primer_apellido_auxiliar;
            this.segundo_apellido_aux = segundo_apellido_auxiliar;
            this.tel_aux = tel_aux;
            this.estado_aux = estado_aux;
        }

        public Auxiliar(string rut_aux, bool estado_aux)
        {
            this.rut_aux = rut_aux;
            this.estado_aux = estado_aux;
        }

        public string Rut_aux
        {
            get { return rut_aux; }
            set { rut_aux = value; }
        }

        public int Id_tipo_usuario
        {
            get { return id_tipo_usuario; }
            set { id_tipo_usuario = value; }
        }

        public int Id_oficina
        {
            get { return id_oficina; }
            set { id_oficina = value; }
        }

        public string Primer_nombre_aux
        {
            get { return primer_nombre_aux; }
            set { primer_nombre_aux = value; }
        }

        public string Segundo_nombre_aux
        {
            get { return segundo_nombre_aux; }
            set { segundo_nombre_aux = value; }
        }

        public string Primer_apellido_aux
        {
            get { return primer_apellido_aux; }
            set { primer_apellido_aux = value; }
        }

        public string Segundo_apellido_aux
        {
            get { return segundo_apellido_aux; }
            set { segundo_apellido_aux = value; }
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
