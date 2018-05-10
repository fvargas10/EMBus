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
    public class CatalogConductor
    {
        public void agregarConductor(Conductor c)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "agregarconductorSP1";

            try
            {
                bd.CreateCommandSP(sql);

                bd.createParameter("@rut", System.Data.DbType.String, c.Rut_con);
                bd.createParameter("@id_oficina", System.Data.DbType.Int32, c.Id_oficina);
                bd.createParameter("@id_tipo_usuario", System.Data.DbType.Int32, c.Id_tipo_usuario);
                bd.createParameter("@primer_nombre", System.Data.DbType.String, c.Primer_nombre_con);
                bd.createParameter("@segundo_nombre", System.Data.DbType.String, c.Segundo_nombre_con);
                bd.createParameter("@primer_apellido", System.Data.DbType.String, c.Primer_apellido_con);
                bd.createParameter("@segundo_apellido", System.Data.DbType.String, c.Segundo_apellido_con);
                bd.createParameter("@telefono", System.Data.DbType.Int32, c.Tel_con);
                bd.createParameter("@estado", System.Data.DbType.Boolean, c.Estado_con);
                bd.execute();
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

        public Conductor buscarConductorRut(string rut)
        {
            Conductor c = new Conductor();
            DataBase bd = new DataBase();
            bd.connect();
            string sql = "obtenerRutConductor";
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            DbDataReader result = bd.Query();
            result.Read();
            c.Rut_con = result.GetString(0);
            c.Id_oficina = result.GetInt32(2);
            c.Id_tipo_usuario = result.GetInt32(1);
            c.Primer_nombre_con = result.GetString(3);
            c.Segundo_nombre_con = result.GetString(4);
            c.Primer_apellido_con = result.GetString(5);
            c.Segundo_apellido_con = result.GetString(6);
            c.Tel_con = result.GetInt32(7);
            c.Estado_con = result.GetBoolean(8);
            result.Close();
            bd.Close();
            return c;
        }

        public void cambiarEstadoConductor(string rut_conductor, bool estado_conductor)
        {

            string sql = "cambiarEstadoConductor";

            //cadena conexion
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut_conductor", DbType.String, rut_conductor);
            bd.createParameter("@estado", DbType.Boolean, estado_conductor);
            bd.execute();
            bd.Close();
        }

        public Conductor RellenarCamposRutConductor(string rut, int dato)
        {
            Conductor c = new Conductor();
            DataBase bd = new DataBase();
            bd.connect();
            string sql = "obtenerDatosTrabajadores";
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            DbDataReader result = bd.Query();
            result.Read();
            if (dato == 1)
            {
                c.Primer_nombre_con = result.GetString(0);
                Console.Write(c);
            }
            if (dato == 2)
            {
                c.Segundo_nombre_con = result.GetString(1);
                Console.Write(c);
            }
            if (dato == 3)
            {
                c.Primer_apellido_con = result.GetString(2);
                Console.Write(c);
            }
            if (dato == 4)
            {
                c.Segundo_apellido_con = result.GetString(3);
                Console.Write(c);
            }
            if (dato == 5)
            {
                c.Tel_con = result.GetInt32(4);
                Console.Write(c);
            }
            result.Close();
            bd.Close();
            return c;
        }

        public void ActualizarDatos(string rut_conductor, string primer_nombre, string segundo_nombre, string primer_apellido, string segundo_apellido, int telefono)
        {

            string sql = "ActualizarDatosConductor";

            //cadena conexion
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", DbType.String, rut_conductor);
            bd.createParameter("@primer_nombre", DbType.String, primer_nombre);
            bd.createParameter("@segundo_nombre", DbType.String, segundo_nombre);
            bd.createParameter("@primer_apellido", DbType.String, primer_apellido);
            bd.createParameter("@segundo_apellido", DbType.String, segundo_apellido);
            bd.createParameter("@telefono", DbType.Int32, telefono);
            bd.execute();
            bd.Close();
        }

        public string VerificarTipoTrabajador(string rut)
        {
            string sql = "obtenerTipoTrabajadorPorRut";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            DbDataReader result = bd.Query();
            result.Read();
            string rol_usuario = result.GetString(0);
            result.Read();
            return rol_usuario;
        }
    }
}
