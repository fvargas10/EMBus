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
    public class CatalogAuxiliar
    {

        public void agregarAuxiliar(Auxiliar a)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "agregarauxiliarSP1";

            bd.CreateCommandSP(sql);

            bd.createParameter("@rut", System.Data.DbType.String, a.Rut_aux);
            bd.createParameter("@id_tipo_usuario", System.Data.DbType.Int32, a.Id_tipo_usuario);
            bd.createParameter("@id_oficina", System.Data.DbType.Int32, a.Id_oficina);
            bd.createParameter("@primer_nombre", System.Data.DbType.String, a.Primer_nombre_aux);
            bd.createParameter("@segundo_nombre", System.Data.DbType.String, a.Segundo_nombre_aux);
            bd.createParameter("@primer_apellido", System.Data.DbType.String, a.Primer_apellido_aux);
            bd.createParameter("@segundo_apellido", System.Data.DbType.String, a.Segundo_apellido_aux);
            bd.createParameter("@telefono", System.Data.DbType.Int32, a.Tel_aux);
            bd.createParameter("@estado", System.Data.DbType.Boolean, a.Estado_aux);
            bd.execute();
            bd.Close();
        }

        public Auxiliar buscarAuxiliarRut(string rut)
        {
            Auxiliar a = new Auxiliar();
            DataBase bd = new DataBase();
            bd.connect();
            string sql = "obtenerRutAuxiliar";
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            DbDataReader result = bd.Query();
            result.Read();
            a.Rut_aux = result.GetString(0);
            a.Id_tipo_usuario = result.GetInt32(1);
            a.Id_oficina = result.GetInt32(2);
            a.Primer_nombre_aux = result.GetString(3);
            a.Segundo_nombre_aux = result.GetString(4);
            a.Primer_apellido_aux = result.GetString(5);
            a.Segundo_apellido_aux = result.GetString(6);
            a.Tel_aux = result.GetInt32(7);
            a.Estado_aux = result.GetBoolean(8);
            result.Close();
            bd.Close();
            return a;
        }

        public void cambiarEstadoAuxiliar(string rut_auxiliar, bool estado_auxiliar)
        {

            string sql = "cambiarEstadoAuxiliar";

            //cadena conexion
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut_auxiliar", DbType.String, rut_auxiliar);
            bd.createParameter("@estado", DbType.Boolean, estado_auxiliar);
            bd.execute();
            bd.Close();
        }

        public void ActualizarDatosAuxiliar(string rut_auxiliar, string primer_nombre, string segundo_nombre, string primer_apellido, string segundo_apellido, int telefono)
        {

            string sql = "ActualizarDatosAuxiliar";

            //cadena conexion
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", DbType.String, rut_auxiliar);
            bd.createParameter("@primer_nombre", DbType.String, primer_nombre);
            bd.createParameter("@segundo_nombre", DbType.String, segundo_nombre);
            bd.createParameter("@primer_apellido", DbType.String, primer_apellido);
            bd.createParameter("@segundo_apellido", DbType.String, segundo_apellido);
            bd.createParameter("@telefono", DbType.Int32, telefono);
            bd.execute();
            bd.Close();
        }
    }

}

