using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Presentacion
{
    public partial class MDI : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else if (Session["usuario"]!=null)
            {
                enUsuario usu = new enUsuario();
                usu = (enUsuario)Session["usuario"];
                lblUsuario.Text = usu.personal.persona.per_nombres + " " + usu.personal.persona.per_apellidos;
            }
        }

        protected void salir_Click(object sender, EventArgs e)
        {
            
        }


    }
}