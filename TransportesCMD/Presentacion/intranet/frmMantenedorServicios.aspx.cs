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
                txtnom.Value = lst[0].serEsp_nombre.ToString();
                txtcarac.Value = lst[0].serEsp_caracteristicas.ToString();
                txtId.Text = Request.QueryString["v"];
                btnRegistrar.Text = "Actualizar";
                //txtmarc.Value = lst[0].veh_numAsiPrimer.ToString();
            }
            if (Request.QueryString["e"] != null)
            {
                Response.Write(@"<script type='javascript'>alert('Elima')</script>");
                int id = Convert.ToInt32(Request.QueryString["e"]);
                Boolean resultado = false;
                resultado = neServicioEspecial.Instancia.spServicioEliminar(id);
                if (resultado)
                {
                    Response.Write(@"<script languaje='javascript'>alert('Eliminacion Correcta');</script>");

                }
                else
                {
                    Response.Write(@"<script languaje='javascript'>alert('Error Eliminar');</script>");
                }
            }





        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (btnRegistrar.Text.Equals("Guardar"))
            {
            String non = txtnom.Value;
            String carac = txtcarac.Value;
            //int serv = Convert.ToInt32(select_estad.Value);
            Boolean resultado = false;
            resultado = neServicioEspecial.RegistrarServicioEspecial(non, carac, 1);
            //CleanControl(this.Controls);
            if (resultado)
            {
                Response.Redirect("frmMantenedorServicios.aspx");
                lblMensajeGraba.Text = "OK";
                lblMensajeGraba.ForeColor = System.Drawing.Color.Blue;
            }
            else
            {
                lblMensajeGraba.Text = "Error";
                lblMensajeGraba.ForeColor = System.Drawing.Color.Red;
            }
          }

            if (btnRegistrar.Text.Equals("Actualizar"))
            {
                int id = Convert.ToInt32(txtId.Text);
                String nom = txtnom.Value;
                String carac = txtcarac.Value;
                String est = "a";
                //int serv = Convert.ToInt32(select_servici.Value);
                Boolean resultado = false;
                resultado = neServicioEspecial.Instancia.spServicioModificar(id, nom, carac, est);
                if (resultado)
                {
                    btnRegistrar.Text = "Guardar";
                    Response.Redirect("frmMantenedorServicios.aspx");
                }
                else
                {
                    lblMensajeGraba.Text = "Error";
                }
            }

        }

    }
}