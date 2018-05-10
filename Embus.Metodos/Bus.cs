using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Bus
    {
        private string patente;
        private int id_marca_bus;
        private int id_oficina;
        private string apodo_bus;
        private int capacidad_bus;
        private bool estado_bus;

        public Bus()
        {
        }

        public Bus(string patente)
        {
            this.patente = patente;
        }

        public Bus(string patente, int id_marca_bus, int id_oficina, string apodo_bus, int capacidad_bus, bool estado_bus)
        {
            this.patente = patente;
            this.id_marca_bus = id_marca_bus;
            this.id_oficina = id_oficina;
            this.apodo_bus = apodo_bus;
            this.capacidad_bus = capacidad_bus;
            this.estado_bus = estado_bus;
        }

        public Bus(string patente, bool estado_bus)
        {
            this.patente = patente;            
            this.estado_bus = estado_bus;
        }

        public string Patente
        {
            get { return patente; }
            set { patente = value; }
        }

        public int Id_marca_bus
        {
            get { return id_marca_bus; }
            set { id_marca_bus = value; }
        }

        public int Id_oficina
        {
            get { return id_oficina; }
            set { id_oficina = value; }
        }

        public string Apodo_bus
        {
            get { return apodo_bus; }
            set { apodo_bus = value; }
        }

        public int Capacidad_bus
        {
            get { return capacidad_bus; }
            set { capacidad_bus = value; }
        }

        public bool Estado_bus
        {
            get { return estado_bus; }
            set { estado_bus = value; }
        }
    }
}
