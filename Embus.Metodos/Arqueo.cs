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
        private Auxiliar rut_auxiliar;
        private Bus patente;
        private Conductor rut_con;      
        private string serie_inicio_bol;
        private string serie_fin_bol;
        private int boletos_cortados;
        private int total_dinero_boletos;       
        private DateTime fecha_arqueo;
        private int sin_boletos;
        private int total_ingresos;
        private int total_gastos;
        private int total_final;
        private int bono_cond;
        private int bono_aux;
        private int turno;
        private string numero_vueltas;

        public Arqueo()
        {
        }

        public Arqueo(int id_arqueo, Boleto id_boleto, Auxiliar rut_auxiliar, Bus patente, Conductor rut_con, string serie_inicio_bol, string serie_fin_bol, int boletos_cortados, int total_dinero_boletos, DateTime fecha_arqueo, int sin_boletos, int total_ingresos, int total_gastos, int total_final, int bono_cond, int bono_aux, int turno, string numero_vueltas)
        {
            this.id_arqueo = id_arqueo;
            this.id_boleto = id_boleto;
            this.rut_auxiliar = rut_auxiliar;
            this.patente = patente;
            this.rut_con = rut_con;
            this.serie_inicio_bol = serie_inicio_bol;
            this.serie_fin_bol = serie_fin_bol;
            this.boletos_cortados = boletos_cortados;
            this.total_dinero_boletos = total_dinero_boletos;
            this.fecha_arqueo = fecha_arqueo;
            this.sin_boletos = sin_boletos;
            this.total_ingresos = total_ingresos;
            this.total_gastos = total_gastos;
            this.total_final = total_final;
            this.bono_cond = bono_cond;
            this.bono_aux = bono_aux;
            this.turno = turno;
            this.numero_vueltas = numero_vueltas;
        }

        public Arqueo(Boleto id_boleto, Auxiliar rut_auxiliar, Bus patente, Conductor rut_con, string serie_inicio_bol, string serie_fin_bol, int boletos_cortados, int total_dinero_boletos, DateTime fecha_arqueo, int sin_boletos, int total_ingresos, int total_gastos, int total_final, int bono_cond, int bono_aux, int turno, string numero_vueltas)
        {
            this.id_boleto = id_boleto;
            this.rut_auxiliar = rut_auxiliar;
            this.patente = patente;
            this.rut_con = rut_con;
            this.serie_inicio_bol = serie_inicio_bol;
            this.serie_fin_bol = serie_fin_bol;
            this.boletos_cortados = boletos_cortados;
            this.total_dinero_boletos = total_dinero_boletos;
            this.fecha_arqueo = fecha_arqueo;
            this.sin_boletos = sin_boletos;
            this.total_ingresos = total_ingresos;
            this.total_gastos = total_gastos;
            this.total_final = total_final;
            this.bono_cond = bono_cond;
            this.bono_aux = bono_aux;
            this.turno = turno;
            this.numero_vueltas = numero_vueltas;
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
      
        public Auxiliar Rut_auxiliar
        {
            get { return rut_auxiliar; }
            set { rut_auxiliar = value; }
        }

        public Bus Patente
        {
            get { return patente; }
            set { patente = value; }
        }

        public Conductor Rut_con
        {
            get { return rut_con; }
            set { rut_con = value; }
        }

        public String Serie_inicio_bol
        {
            get { return serie_inicio_bol; }
            set { serie_inicio_bol = value; }
        }

        public String Serie_fin_bol
        {
            get { return serie_fin_bol; }
            set { serie_fin_bol = value; }
        }

        public int Boletos_cortados
        {
            get { return boletos_cortados; }
            set { boletos_cortados = value; }
        }

        public int Total_dinero_boletos
        {
            get { return total_dinero_boletos; }
            set { total_dinero_boletos = value; }
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

        public int Turno
        {
            get { return turno; }
            set { turno = value; }
        }

        public string Numero_vueltas
        {
            get { return numero_vueltas; }
            set { numero_vueltas = value; }
        }

    }
}
