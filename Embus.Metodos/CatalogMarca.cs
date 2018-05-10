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

public class CatalogMarca
{
    public void agregarMarca(Marca c)
    {
        Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
        bd.connect();
        string sql = "agregarMarca";

        try
        {
            bd.CreateCommandSP(sql);
            bd.createParameter("@nombre_marca", System.Data.DbType.String, c.Nombre_marca.ToUpper());
            bd.execute();
            bd.Close();
        }
        catch (DataAccessException Ex)
        {
            throw new BusinessRulesException(Ex.Message);
        }
    }

    public int VerificarMarcaExistente(string marca)
    {
        string sql = "obtenerMarca";
        DataBase bd = new DataBase();
        bd.connect();
        bd.CreateCommandSP(sql);
        bd.createParameter("@marca_bus", System.Data.DbType.String, marca.ToUpper());
        DbDataReader result = bd.Query();//disponible resultado
        int resultado;
        if (result.Read() == false)
        {
            resultado = 0;
        }
        else
        {
            string marca_bus = result.GetString(0);
            result.Read();
            if (marca_bus.ToUpper() == marca)
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

    public void eliminarMarca(string marca)
    {
        DataBase bd = new DataBase();
        bd.connect();

        string sql = "eliminarMarca";

        try
        {
            bd.CreateCommandSP(sql);
            bd.createParameter("@marca_bus", DbType.String, marca);
            bd.execute();
            bd.Close();
        }
        catch (DataAccessException Ex)
        {
            throw new BusinessRulesException(Ex.Message);
        }
    }



}
