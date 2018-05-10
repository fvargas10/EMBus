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
    public class CatalogContador
    {
        public Contador GetNameCont(string rut_cont, string clave_cont)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "SELECT NOM_CONT FROM CONTADOR WHERE RUT_CONT='" + rut_cont + "' AND CLAVE_CONT= '" + clave_cont + "'";
            bd.CreateCommand(sql);
            Contador a;
            DbDataReader result = bd.Query();
            result.Read();
            a = new Contador(result.GetString(0));
            result.Close();
            bd.Close();
            return a;
        }
    }
}
