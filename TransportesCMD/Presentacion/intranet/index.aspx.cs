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
            try
            {
                if (Session["usuario"] != null)
                {
                    Response.Redirect("frmPrincipal.aspx");
                }else{

                    //lstSucursal.DataSource = neSucursal.Instancia.sucursalLista();
                    //lstSucursal.DataTextField = "suc_nombre";
                    //lstSucursal.DataValueField = "suc_id";
                    //lstSucursal.DataBind();
                }
                
            }
            catch (Exception)
            {

            }
            
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            enUsuario usuario = new enUsuario();
            usuario.usu_user = txtUser.Text;
            usuario.usu_pass = txtPass.Text;
            enSucursal sucursal = new enSucursal();
            //sucursal.suc_id = Convert.ToInt32(lstSucursal.SelectedValue.ToString());
            sucursal.suc_id = 1;
           
            if (txtUser.Text == "" && txtPass.Text == "")
            {
                lblMensaje.Text = "Ingrese Usuario y Contraseña";
            }
            else if (txtUser.Text == "")
            {
                lblMensaje.Text = "Ingrese Usuario";
            }
            else if (txtPass.Text == "") {
                lblMensaje.Text = "Ingrese Contraseña";
            }
            else
            {
                enUsuario usuLogueado = new enUsuario();
                usuLogueado = neUsuario.spUsuarioLogin(usuario);
                if (usuLogueado != null)
                {
                    usuLogueado.personal.sucursal = sucursal;
                    Session["usuario"] = usuLogueado;
                    Response.Redirect("frmPrincipal.aspx");
                }
                else
                {
                    lblMensaje.Text = "Datos Incorrectos";
                }

            }
        }
    }
}