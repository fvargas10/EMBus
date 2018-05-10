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
    public class CatalogDetalleGasto
    {
        public void agregarDetalleGasto(DetalleGasto d)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "agregardetallegastoSP1";

            bd.CreateCommandSP(sql);

            //bd.createParameter("@id_detalle_gasto", System.Data.DbType.Int32, d.Id_detalle_gasto);
            bd.createParameter("@patente", System.Data.DbType.String, d.Patente);
            bd.createParameter("@id_gasto", System.Data.DbType.Int32, d.Id_gasto);
            bd.createParameter("@fecha_detalle_gasto", System.Data.DbType.DateTime, d.Fecha_detalle_gasto);
            bd.createParameter("@valor_detalle_gasto", System.Data.DbType.Int32, d.Valor_detalle_gasto);
            bd.createParameter("@descripcion_detalle_gasto", System.Data.DbType.String, d.Descripcion_detalle_gasto);
            bd.execute();
            bd.Close();
        }
    }
}
