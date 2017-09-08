using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Embus.Metodos
{
    public class Arqueo
    {
        private int id_arqueo;
        private Boleto id_boleto;
        private Contador rut_cont;
        private DetalleGasto id_detgasto;
        private Bus patente;
        private int serie_inicio_bol;
        private int serie_fin_bol;
        private int boletos_cortados;
        private DateTime fecha_arqueo;
        private int sin_boletos;
        private int total_ingresos;
        private int total_gastos;
        private int total_final;
        private int bono_cond;
        private int bono_aux;

        public Arqueo()
        {
        }

        public Arqueo(int id_arqueo, Boleto id_boleto, Contador rut_cont, DetalleGasto id_detgasto, Bus patente, int serie_inicio_bol, int serie_fin_bol, int boletos_cortados, DateTime fecha_arqueo, int sin_boletos, int total_ingresos, int total_gastos, int total_final, int bono_cond, int bono_aux)
        {
            this.id_arqueo = id_arqueo;
            this.id_boleto = id_boleto;
            this.rut_cont = rut_cont;
            this.id_detgasto = id_detgasto;
            this.patente = patente;
            this.serie_inicio_bol = serie_inicio_bol;
            this.serie_fin_bol = serie_fin_bol;
            this.boletos_cortados = boletos_cortados;
            this.fecha_arqueo = fecha_arqueo;
            this.sin_boletos = sin_boletos;
            this.total_ingresos = total_ingresos;
            this.total_gastos = total_gastos;
            this.total_final = total_final;
            this.bono_cond = bono_cond;
            this.bono_aux = bono_aux;            
        }

        public int Id_arqueo
        {
            get { return id_arqueo; }
            set { id_arqueo = value; }
        }

        public Boleto Id_boleto
        {
            get { return id_boleto; }
            set { id_boleto = value; }
        }

        public Contador Rut_cont
        {
            get { return rut_cont; }
            set { rut_cont = value; }
        }

        public DetalleGasto Id_detgasto
        {
            get { return id_detgasto; }
            set { id_detgasto = value; }
        }

        public Bus Patente
        {
            get { return patente; }
            set { patente = value; }
        }

        public int Serie_inicio_bol
        {
            get { return serie_inicio_bol; }
            set { serie_inicio_bol = value; }
        }

        public int Serie_fin_bol
        {
            get { return serie_fin_bol; }
            set { serie_fin_bol = value; }
        }

        public int Boletos_cortados
        {
            get { return boletos_cortados; }
            set { boletos_cortados = value; }
        }

        public DateTime Fecha_arqueo
        {
            get { return fecha_arqueo; }
            set { fecha_arqueo = value; }
        }

        public int Sin_boletos
        {
            get { return sin_boletos; }
            set { sin_boletos = value; }
        }

        public int Total_ingresos
        {
            get { return total_ingresos; }
            set { total_ingresos = value; }
        }

        public int Total_gastos
        {
            get { return total_gastos; }
            set { total_gastos = value; }
        }

        public int Total_final
        {
            get { return total_final; }
            set { total_final = value; }
        }

        public int Bono_cond
        {
            get { return bono_cond; }
            set { bono_cond = value; }
        }

        public int Bono_aux
        {
            get { return bono_aux; }
            set { bono_aux = value; }
        }

    }
}
