using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Bus
    {
        private string patente;
        private int id_oficina;
        private string apodo_bus;
        private string marca_bus;
        private int capacidad_bus;
        private bool estado_bus;

        public Bus()
        {
        }

        public Bus(string patente, int id_oficina, string apodo_bus, string marca_bus, int capacidad_bus, bool estado_bus)
        {
            this.patente = patente;
            this.id_oficina = id_oficina;
            this.apodo_bus = apodo_bus;
            this.marca_bus = marca_bus;
            this.capacidad_bus = capacidad_bus;
            this.estado_bus = estado_bus;
        }

        public string Patente
        {
            get { return patente; }
            set { patente = value; }
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

        public string Marca_bus
        {
            get { return marca_bus; }
            set { marca_bus = value; }
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
