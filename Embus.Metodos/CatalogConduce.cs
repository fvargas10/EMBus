using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


using System.Data.Common;namespace Embus.Metodos
{
    public class CatalogConduce
    {
        public List<Conduce> mostrarConductores()
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect(); //método conectar

            string sqlSearch = "SELECT NOM_CON,APODO_BUS FROM CONDUCE INNER JOIN CONDUCTOR ON CONDUCE.RUT_CON=CONDUCTOR.RUT_CON INNER JOIN BUS ON CONDUCE.PATENTE=BUS.PATENTE";
            bd.CreateCommand(sqlSearch);
            List<Conduce> conductores = new List<Conduce>();
            DbDataReader result = bd.Query();//disponible resultado
            while (result.Read())
            {
                Conduce a = new Conduce();
                a.Rut_con.Nom_con = result.GetString(0);
                a.Patente.Apodo_bus = result.GetString(1);
                conductores.Add(a);
            }
            result.Close();
            bd.Close();
            return conductores;
        }
    }
}
