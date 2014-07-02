using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;
using Entidades;

namespace Presentacion.intranet
{
    public partial class frmMantenedorServicios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["v"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["v"]);
                List<enServicioEspecial> lst = new List<enServicioEspecial>();
                lst = neServicioEspecial.Instancia.spServicioXid(id);
                txtnombre.Text = lst[0].serEsp_nombre.ToString();
                txtcaracteristicas.Text = lst[0].serEsp_caracteristicas.ToString();
                txtId.Text = Request.QueryString["v"];
                btnRegistrar.Text = "Actualizar";
                //txtmarc.Value = lst[0].veh_numAsiPrimer.ToString();
            }
            if (Request.QueryString["e"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["e"]);
                Boolean resultado = false;
                resultado = neServicioEspecial.Instancia.spServicioEliminar(id);
                if (resultado)
                {
                    Response.Redirect("frmMantenedorServicios.aspx");

                }
                else
                {
                    Response.Write(@"<script languaje='javascript'>alert('Error Eliminar');</script>");
                }
            }

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {       
            try {
                
                String nom = txtnombre.Text;
                String carac = txtcaracteristicas.Text;
               
                if (btnRegistrar.Text.Equals("Registrar"))
                {
                    //int serv = Convert.ToInt32(select_estad.Value);
                    Boolean resultado = false;
                    resultado = neServicioEspecial.Instancia.RegistrarServicioEspecial(nom, carac);
                    //CleanControl(this.Controls);
                    if (resultado)
                    {
                        Response.Redirect("frmMantenedorServicios.aspx");
                    }
                    else
                    {
                        Response.Write(@"<script languaje='javascript'>alert('Error al registrar');</script>");
                    }
                }

                if (btnRegistrar.Text.Equals("Actualizar") )
                {
                    int id = Convert.ToInt32(txtId.Text);                   
                    String estado = "a";
                    Boolean resultado = false;
                    resultado = neServicioEspecial.Instancia.spServicioModificar(id, nom, carac,estado);
                    if (resultado)
                    {
                        btnRegistrar.Text = "Registrar";
                        Response.Redirect("frmMantenedorServicios.aspx");
                    }
                    else
                    {
                        Response.Write(@"<script languaje='javascript'>alert('Error al actualizar');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(@"<script languaje='javascript'>alert('Error al actualizar "+ex.Message+");</script>");
            }
            

        }

    }
}