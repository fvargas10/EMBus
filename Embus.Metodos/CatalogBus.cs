using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.IO;
using Embus.Datos;
using Embus.Metodos;
using Project.DataAccess;
using Project.BusinessRules;
using System.Data;

namespace Embus.Metodos
{
    public class CatalogBus
    {
        public void agregarBus(Bus b)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "agregarbusSP1";

            try
            {
                bd.CreateCommandSP(sql);

                bd.createParameter("@patente", System.Data.DbType.String, b.Patente);
                bd.createParameter("@id_marca_bus", System.Data.DbType.Int32, b.Id_marca_bus);
                bd.createParameter("@id_oficina", System.Data.DbType.Int32, b.Id_oficina);
                bd.createParameter("@apodo", System.Data.DbType.String, b.Apodo_bus);
                bd.createParameter("@capacidad", System.Data.DbType.Int32, b.Capacidad_bus);
                bd.createParameter("@estado", System.Data.DbType.Boolean, b.Estado_bus);
                DbDataReader dataReader = bd.Query();
                dataReader.Close();
                bd.Close();
            }
            catch (DataAccessException Ex)
            {
                throw new BusinessRulesException(Ex.Message);
            }
            catch (BusinessRulesException Ex)
            {
                throw new BusinessRulesException(Ex.Message);
            }

        }

        public int ObtenerIdOficina(string direccion)
        {
            string sql = "obteneridoficina";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@direccion", System.Data.DbType.String, direccion);
            DbDataReader result = bd.Query();//disponible resultado
            result.Read();
            int id = result.GetInt32(0);
            result.Read();
            int id_oficina = 0;
            if (id == 0)
            {
                id_oficina = 0;
            }
            else
            {
                if (id == 2)
                {
                    id_oficina = 2;
                }
            }
            return id_oficina;
        }

        public Bus buscarBusPorPatente(string patente)
        {
            Bus b = new Bus();
            DataBase bd = new DataBase();
            bd.connect();
            string sql = "obtenerPatenteBus";
            bd.CreateCommandSP(sql);
            bd.createParameter("@patente", System.Data.DbType.String, patente);
            DbDataReader result = bd.Query();
            result.Read();
            b.Patente = result.GetString(0);
            b.Id_marca_bus = result.GetInt32(1);
            b.Id_oficina = result.GetInt32(2);
            b.Apodo_bus = result.GetString(3);
            b.Capacidad_bus = result.GetInt32(4);
            b.Estado_bus = result.GetBoolean(5);            
            result.Close();
            bd.Close();
            return b;
        }

        public void cambiarEstadoBus(string patente, bool estado_bus)
        {

            string sql = "cambiarEstadoBus";

            //cadena conexion
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@patente", DbType.String, patente);
            bd.createParameter("@estado_bus", DbType.Boolean, estado_bus);
            bd.execute();
            bd.Close();
        }

        public int VerificarPatenteExistente(string patente)
        {
            string sql = "obtenerPatente";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@patente", System.Data.DbType.String, patente.ToUpper());
            DbDataReader result = bd.Query();//disponible resultado
            int resultado;
            if (result.Read() == false)
            {
                resultado = 0;
            }
            else
            {
                string patente_bus = result.GetString(0);
                result.Read();
                if (patente_bus.ToUpper() == patente.ToUpper())
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
