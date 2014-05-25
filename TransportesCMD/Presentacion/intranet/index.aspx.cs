using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Presentacion
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (Session["usuario"] != null)
            {
                Response.Redirect("frmPrincipal.aspx");
            }
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            enUsuario usuario = new enUsuario();
            usuario.usu_user = txtUser.Text;
            usuario.usu_pass = txtPass.Text;
            if (txtUser.Text == "" || txtPass.Text == "")
            {
                lblMensaje.Text = "Ingrese Datos";
            }
            else
            {
                Session["usuario"] = neUsuario.spUsuarioLogin(usuario);
                if (Session["usuario"] != null)
                    Response.Redirect("frmPrincipal.aspx");
                else
                {
                    lblMensaje.Text = "Datos Incorrectos";
                }

            }
        }
    }
}