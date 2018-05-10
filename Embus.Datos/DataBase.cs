using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Configuration;

namespace Embus.Datos
{

    public class DataBase
    {
        private DbConnection connection;
        private DbCommand command;
        private string connection_string;
        private static DbProviderFactory factory;
        private DbDataAdapter adapter;

        public DataBase()
        {
            string provider = ConfigurationManager.AppSettings.Get("proveedor");
            this.connection_string = ConfigurationManager.AppSettings.Get("cadena");
            //pass nombre base datos y nombre de servidor
            factory = DbProviderFactories.GetFactory(provider);//instanciar la conexion con la base de datos
        }

        public void connect()
        {
            this.connection = factory.CreateConnection(); //se crea la conexión
            this.connection.ConnectionString = connection_string; //se configura el string de conexión
            this.connection.Open(); //se intenta abrir la conexión
        }

        public void CreateCommand(string sql)
        {
            this.command = factory.CreateCommand();
            this.command.Connection = connection;
            this.command.CommandType = CommandType.Text; //3 opciones para trabajar (consultas)
            this.command.CommandText = sql;
        }

        public void CreateCommandSP(string sql)
        {
            this.command = factory.CreateCommand();
            this.command.Connection = connection;
            this.command.CommandType = CommandType.StoredProcedure; //3 opciones para trabajar (consultas)
            this.command.CommandText = sql;
        }

        public DbDataReader Query()
        {
            return command.ExecuteReader(); //devuelve los valores
        }

        public void Close()
        {
            this.connection.Close();
        }

        public void execute()
        {
            this.command.ExecuteNonQuery();//inserta, update, delete...(no devuelve resultado ni valores)
        }

        public void createParameter(string name, DbType type, object value)
        {
            DbParameter parameter = factory.CreateParameter();
            parameter.DbType = type;
            parameter.ParameterName = name;
            parameter.Value = value;
            this.command.Parameters.Add(parameter);
        }

        public DataSet dataSet(string sql)
        {
            adapter = factory.CreateDataAdapter();

            this.connect();

            this.CreateCommand(sql);
            adapter.SelectCommand = this.command;
            DbCommandBuilder cb = factory.CreateCommandBuilder();
            cb.DataAdapter = adapter;

            DataSet set = new DataSet();

            //relleno de datos el data set
            adapter.Fill(set);
            return set;

        }
    }
}

