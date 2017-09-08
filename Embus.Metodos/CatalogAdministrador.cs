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
        public bool IngresoAdmin(int rut_admin, string clave_admin)
        {
            bool ok = false;
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "SELECT * FROM ADMINISTRADOR WHERE RUT_ADMIN='" + rut_admin + "' AND CLAVE_ADMIN= '" + clave_admin + "'";
            bd.CreateCommand(sql);
            DbDataReader result = bd.Query();
            if (result.Read())
            {
                ok = true;
            }
            //Administrador c = new Administrador(result.GetString(0), result.GetString(1));
            result.Close();
            bd.Close();
            return ok;

        }

        public void insertAdmin(Administrador ad)
        {

            Embus.Datos.DataBase bd = new DataBase();
            bd.connect();
            string sql = "INSERT INTO ADMINISTRADOR (RUT_ADMIN, NOM_ADMIN, PASS_ADMIN) VALUES ('" + ad.Rut_admin + "','" + ad.Nom_admin + "','" + ad.Clave_admin + "')";
            bd.CreateCommand(sql);
            bd.execute();
            bd.Close();

        }

        public Administrador GetNameAdmin(int rut_admin, string clave_admin)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "SELECT NOM_ADMIN FROM ADMINISTRADOR WHERE RUT_ADMIN='" + rut_admin + "' AND CLAVE_ADMIN= '" + clave_admin + "'";
            bd.CreateCommand(sql);
            Administrador llocal = new Administrador();
            Administrador a = null;
            DbDataReader result = bd.Query();
            result.Read();
            a = new Administrador(result.GetString(0));
            result.Close();
            bd.Close();
            return a;
        }
    }
}
