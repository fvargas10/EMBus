using Embus.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;

namespace Embus.Metodos
{
    public class CatalogBoleto
    {
        public Boleto buscarBoletoId(int id)
        {
            Boleto b = new Boleto();
            DataBase bd = new DataBase();
            bd.connect();
            string sql = "obtenerBoletoPorId";
            bd.CreateCommandSP(sql);
            bd.createParameter("@id", DbType.Int32, id);
            DbDataReader result = bd.Query();
            result.Read();
            b.Id_boleto = result.GetInt32(0);
            b.Valor_boleto = result.GetInt32(1);
            result.Close();
            bd.Close();  
            return b;
        }

        public void cambiarTarifas(int valor_antiguo, int valor_nuevo)
        {

            string sql = "cambiarTarifas";

            //cadena conexion
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@valor_boleto_nuevo", DbType.Int32, valor_nuevo);
            bd.createParameter("@valor_boleto_antiguo", DbType.Int32, valor_antiguo);
            bd.execute();
            bd.Close();
        }

        public int VerificarTarifaExistente(int tarifa)
        {
            string sql = "obtenerTarifa";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@valor_tarifa", System.Data.DbType.Int32, tarifa);
            DbDataReader result = bd.Query();//disponible resultado
            int resultado;
            if (result.Read() == false)
            {
                resultado = 0;
            }
            else
            {
                int tarifa_bus = result.GetInt32(0);
                result.Read();
                if (tarifa_bus == tarifa)
                {
                    resultado = 1;
                }
                else
                {
                    resultado = 0;
                }
            }

            return resultado;
        }
    }
}
