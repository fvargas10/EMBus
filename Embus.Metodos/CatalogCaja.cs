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
    public class CatalogCaja
    {
        public void agregarArqueo(Arqueo a)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "agregararqueocaja";

            try
            {
                bd.CreateCommandSP(sql);

                bd.createParameter("@id_boleto", System.Data.DbType.Int32, a.Id_boleto.Id_boleto);
                bd.createParameter("@rut_aux", System.Data.DbType.String, a.Rut_auxiliar.Rut_aux);
                bd.createParameter("@patente", System.Data.DbType.String, a.Patente.Patente);
                bd.createParameter("@rut_con", System.Data.DbType.String, a.Rut_con.Rut_con);
                bd.createParameter("@serie_inicio", System.Data.DbType.String, a.Serie_inicio_bol);
                bd.createParameter("@serie_fin", System.Data.DbType.String, a.Serie_fin_bol);
                bd.createParameter("@boletos_cortados", System.Data.DbType.Int32, a.Boletos_cortados);
                bd.createParameter("@total_dinero_boletos", System.Data.DbType.Int32, a.Total_dinero_boletos);
                bd.createParameter("@fecha", System.Data.DbType.DateTime2, a.Fecha_arqueo);
                bd.createParameter("@sin_boletos", System.Data.DbType.Int32, a.Sin_boletos);
                bd.createParameter("@total_ingresos", System.Data.DbType.Int32, a.Total_ingresos);
                bd.createParameter("@total_gastos", System.Data.DbType.Int32, a.Total_gastos);
                bd.createParameter("@total_final", System.Data.DbType.Int32, a.Total_final);
                bd.createParameter("@bono_con", System.Data.DbType.Int32, a.Bono_cond);
                bd.createParameter("@bono_aux", System.Data.DbType.Int32, a.Bono_aux);
                bd.createParameter("@turno", System.Data.DbType.Int32, a.Turno);
                bd.createParameter("@numero_vueltas", System.Data.DbType.String, a.Numero_vueltas);

                bd.execute();
                bd.Close();
            }
            catch (DataAccessException Ex)
            {
                throw new BusinessRulesException(Ex.Message);
            }
        }


    }
}
