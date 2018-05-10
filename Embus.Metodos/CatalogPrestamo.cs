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

namespace Embus.Metodos
{
    public class CatalogPrestamo
    {
        public void agregarPrestamo(Prestamo p)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "agregarprestamo";

            bd.CreateCommandSP(sql);

            bd.createParameter("@valor_prestamo", System.Data.DbType.Int32, p.Valor_prestamo);
            bd.createParameter("@fecha_prestamo", System.Data.DbType.Date, p.Fecha_prestamo);
            bd.createParameter("@rut", System.Data.DbType.String, p.Rut_trabajador);
            
            bd.execute();
            bd.Close();
        }
    }
}
