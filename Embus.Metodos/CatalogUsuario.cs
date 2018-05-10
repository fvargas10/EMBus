using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Embus.Datos;
using System.Data.Common;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.IO;
using EMBus;
using Embus.Metodos;
using Project.DataAccess;
using Project.BusinessRules;
using System.Data;
using System.Net;
using System.Net.Mail;

namespace Embus.Metodos
{
    public class CatalogUsuario
    {
        public bool LoginUsuario(string rut, string clave)
        {
            bool ok = false;
            string sql = "loginusuarioSP1";
            DataBase bd = new DataBase();
            bd.connect();
            //string clave_encriptada = encriptar(clave);
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            bd.createParameter("@clave", System.Data.DbType.String, clave);
            DbDataReader result = bd.Query();//resultado disponible
            if (result.Read())
            {
                ok = true;
            }
            result.Close();
            bd.Close();
            return ok;
        }

        public string encriptar(string clave)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            //Calcula el hash de los bytes de texto
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(clave));
            //Obtiene el resultado del hash después de calcularlo
            byte[] result = md5.Hash;
            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //Cambia en 2 dígitos hexadecimales
                //para cada byte
                strBuilder.Append(result[i].ToString("x2"));
            }
            return strBuilder.ToString();
        }

        public int actualizarClaveUsuario(string rut_usuario, string clave, string claveNueva)
        {
            int filasAfectadas = 0;
            //consulta a la base de datos
            string sql = "editarClaveUsuario";

            //cadena conexion
            DataBase bd = new DataBase();
            bd.connect();            
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut_usuario", System.Data.DbType.String, rut_usuario);
            bd.createParameter("@clave_actual", System.Data.DbType.String, clave);
            bd.createParameter("@clave_nueva", System.Data.DbType.String, claveNueva);
            DbDataReader result = bd.Query();//disponible resultado

            result.Read();
            filasAfectadas = result.GetInt32(0);
            result.Close();
            bd.Close();
            return filasAfectadas;
        }

        public EMBus.Usuario ObtenerNombreLogin(string rut, string clave)
        {
            string sql = "obtenernombreloginSP1";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            bd.createParameter("@clave", System.Data.DbType.String, clave);
            EMBus.Usuario a;
            DbDataReader result = bd.Query();
            result.Read();
            a = new EMBus.Usuario(result.GetString(0), result.GetString(1), result.GetString(2), result.GetString(3));
            result.Close();
            bd.Close();
            return a;
        }

        public int ObtenerIdTipoUsuario(string rut, string clave)
        {
            string sql = "obteneridtipousuariofinalSP1";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            bd.createParameter("@clave", System.Data.DbType.String, clave);
            DbDataReader result = bd.Query();
            result.Read();
            int tipousuario0 = result.GetInt32(0);
            int tipousuario1 = result.GetInt32(0);
            result.Read();
            int tipousuariofinal;
            if (tipousuario0 == 0 || tipousuario1 == 1)
            {
                if (tipousuario0 == 0)
                {
                    tipousuariofinal = 0;
                }
                else
                {
                    tipousuariofinal = 1;
                }
            }
            else
            {
                tipousuariofinal = 1;
            }

            return tipousuariofinal;
        }
        
        public string ObtenerRolTipoUsuario(string rut, string clave)
        {
            string sql = "obtenerRolTipoUsuario";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rut", System.Data.DbType.String, rut);
            bd.createParameter("@clave", System.Data.DbType.String, clave);
            DbDataReader result = bd.Query();
            result.Read();
            string rol_usuario = result.GetString(0);
            result.Read();
            return rol_usuario;
        }

        public int ObtenerIdTipoUsuarioPorRol(string rol_usuario)
        {
            string sql = "obtenerIdTipoUsuarioPorRol";
            DataBase bd = new DataBase();
            bd.connect();
            bd.CreateCommandSP(sql);
            bd.createParameter("@rol", System.Data.DbType.String, rol_usuario);
            DbDataReader result = bd.Query();
            result.Read();
            int id_tipo_usuario = result.GetInt32(0);
            result.Read();
            return id_tipo_usuario;
        }


        public void agregarUsuario(Usuario u)
        {
            Embus.Datos.DataBase bd = new Embus.Datos.DataBase();
            bd.connect();
            string sql = "agregarusuario";

            try
            {
                bd.CreateCommandSP(sql);

                bd.createParameter("@rut", System.Data.DbType.String, u.Rut_usuario);
                bd.createParameter("@id_tipo_usuario", System.Data.DbType.Int32, u.Tipo_usuario);
                bd.createParameter("@clave_usuario", System.Data.DbType.String, u.Clave_usuario);
                bd.createParameter("@primer_nomnbre", System.Data.DbType.String, u.Primer_nombre_usuario);
                bd.createParameter("@segundo_nombre", System.Data.DbType.String, u.Segundo_nombre_usuario);
                bd.createParameter("@primer_apellido", System.Data.DbType.String, u.Primer_apellido_usuario);
                bd.createParameter("@segundo_apellido", System.Data.DbType.String, u.Segundo_apellido_usuario);
                bd.createParameter("@telefono", System.Data.DbType.Int32, u.Tel_usuario);
                bd.createParameter("@direccion", System.Data.DbType.String, u.Dir_usuario);
                bd.createParameter("@correo_usuario", System.Data.DbType.String, u.Correo_usuario);
                bd.createParameter("@estado", System.Data.DbType.Int32, u.Estado);

                bd.execute();
                bd.Close();
            }
            catch (DataAccessException Ex)
            {
                throw new BusinessRulesException(Ex.Message);
            }
            catch (BusinessRulesException Ex)
            {
                throw new BusinessRulesException(Ex.Message);
            }

        }

        public int reestablecerClave(string rut_usuario)
        {
            Random r = new Random();
            int pwTemp = r.Next(100000, 999999);
            string clave_generada = encriptar(pwTemp + "");
            Console.Write(clave_generada);
            int filasAfectadas = 0;
            //consulta a la base de datos
            string sql = "ReestablecerClave";

            //cadena conexion
            DataBase bd = new DataBase();
            bd.connect();

            bd.CreateCommandSP(sql);
            bd.createParameter("@rut_usuario", DbType.String, rut_usuario);
            bd.createParameter("@clave_nueva", DbType.String, clave_generada);
            DbDataReader result = bd.Query();//disponible resultado

            result.Read();
            filasAfectadas = result.GetInt32(0);
            result.Close();
            bd.Close();
            return pwTemp;
        }


        public void recuperarClave(string rut_usuario, string correo)
        {
            CatalogUsuario cat_usuario = new CatalogUsuario();
            int pw = cat_usuario.reestablecerClave(rut_usuario);
            //Representa un mensaje de correo electrónico que puede enviarse mediante el SmtpClient clase.
            MailMessage msg = new MailMessage();
            msg.To.Add(correo);
            msg.From = new MailAddress("soporte.embus@gmail.com", "Administrador", Encoding.UTF8);
            msg.Subject = "Contraseña Temporal para recuperación de usuario - Sistema de Apoyo a la Contabilidad - EMBus Los Muermos ";
            msg.SubjectEncoding = System.Text.Encoding.UTF8;
            msg.Body = "Puedes usar esta contraseña para volver a ingresar al sistema, Saludos Cordiales: \n" + pw;
            msg.BodyEncoding = System.Text.Encoding.UTF8;
            msg.IsBodyHtml = false;

            //Aquí es donde se hace lo especial
            //Permite a las aplicaciones enviar correo electrónico mediante el protocolo Simple de transferencia de correo (SMTP).
            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = true;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("soporte.embus@gmail.com", "embus2018");
            client.Port = 587;
            
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Esto es para que vaya a través de SSL que es obligatorio con GMail
            client.Send(msg);

        }

          public string obtenerCorreo(string rut_usuario)
        {
            string s = "";
            string sql = "ObtenerCorreoPorRut";
            //cadena conexion

            DataBase bd = new DataBase();
            bd.connect();

            bd.CreateCommandSP(sql);
            bd.createParameter("@rut_usuario", DbType.String, rut_usuario);
            DbDataReader result = bd.Query();//disponible resultado
            result.Read();
            s = result.GetString(0);
            return s;
        }

          public bool ObtenerEstadoUsuario(string rut_usuario)
          {
              string sql = "obtenerEstadoUsuario";
              DataBase bd = new DataBase();
              bd.connect();
              bd.CreateCommandSP(sql);
              bd.createParameter("@rut", System.Data.DbType.String, rut_usuario);
              DbDataReader result = bd.Query();
              result.Read();
              bool estado = result.GetBoolean(0);
              result.Read();
              return estado;
          }       
    }
}
