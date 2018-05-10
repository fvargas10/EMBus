using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Embus.Metodos;

namespace EMBus
{
    public partial class PaginaMaestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {               
                string rol_usuario1 = (string)this.Session["ROL_TIPO_USUARIO"];
                this.lblusuario.Text = rol_usuario1;
                string rol_usuario2 = (string)this.Session["ROL_TIPO_USUARIO"];
                this.lblcontador.Text = rol_usuario2;

            }
            catch { }

            //this.lblcontador.Text = (string)Session["NOM_USUARIO"];

        }
    }
}