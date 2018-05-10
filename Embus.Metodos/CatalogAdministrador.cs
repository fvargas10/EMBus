using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Embus.Datos;
using System.Data.Common;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.IO;


namespace Embus.Metodos
{
    public class CatalogAdministrador
    {
        //public bool IngresoAdmin(int rut_admin, string clave_admin)
        //{
        //    bool ok = false;
        //    Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
        //    bd.connect();
        //    string sql = "SELECT * FROM ADMINISTRADOR WHERE RUT_ADMIN='" + rut_admin + "' AND CLAVE_ADMIN= '" + clave_admin + "'";
        //    bd.CreateCommand(sql);
        //    DbDataReader result = bd.Query();
        //    if (result.Read())
        //    {
        //        ok = true;
        //    }
        //    //Administrador c = new Administrador(result.GetString(0), result.GetString(1));
        //    result.Close();
        //    bd.Close();
        //    return ok;
        //}

        public int Autenticar(string rut, string clave)
        {
            string sql = "ingresousuarios";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            bd.createParameter("@clave", System.Data.DbType.String, clave);
            DbDataReader result = bd.Query();//disponible resultado
            result.Read();
            int admin = result.GetInt32(0);
            result.Read();
            int contador = result.GetInt32(0);
            int tipoUsuario = 0;
            if (admin == 1 || contador == 1)
            {
                if (admin == 1)
                {
                    tipoUsuario = 1;
                }
                else
                {
                    tipoUsuario = 2;
                }
            }
            else
            {
                tipoUsuario = 0;
            }

            return tipoUsuario;
        }

        //public Administrador GetNameAdmin(string rut_admin, string clave_admin)
        //{
        //    Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
        //    bd.connect();
        //    string sql = "SELECT NOM_ADMIN FROM ADMINISTRADOR WHERE RUT_ADMIN='" + rut_admin + "' AND CLAVE_ADMIN= '" + clave_admin + "'";
        //    bd.CreateCommand(sql);
        //    Administrador a;
        //    DbDataReader result = bd.Query();
        //    result.Read();           
        //    a = new Administrador(result.GetString(0));
        //    result.Close();
        //    bd.Close();            
        //    return a;
        //}
    }
}
