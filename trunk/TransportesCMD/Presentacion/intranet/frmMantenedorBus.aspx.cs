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
    public partial class frmMantenedorBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack )
            {
                if(Request.QueryString["v"] != null){
                    int id  = Convert.ToInt32(Request.QueryString["v"]);
                List<enVehiculo> lst = new List<enVehiculo>();
                lst = neVehiculo.Instancia.spVehiculoXid(id);
                txtPlac.Value = lst[0].veh_placa.ToString();
                txtmodel.Value = lst[0].veh_modelo.ToString();               
                txtmarc.Value = lst[0].veh_marca.ToString();
                txtprimer.Value = lst[0].veh_numAsiPrimer.ToString();
                txtsegund.Value = lst[0].veh_numAsiSegundo.ToString();
                    txtId.Text = Request.QueryString["v"];
                btnRegistrar.Text = "Actualizar";
                //txtmarc.Value = lst[0].veh_numAsiPrimer.ToString();
                }
                if (Request.QueryString["e"] != null) {
                    Response.Write(@"<script type='javascript'>alert('Elima')</script>");
                    int id = Convert.ToInt32(Request.QueryString["e"]);
                    Boolean resultado = false;
                    resultado = neVehiculo.Instancia.spVehiculoEliminar(id);
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

       
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (btnRegistrar.Text.Equals("Guardar"))
            {
                String model = txtmodel.Value;
                String pla = txtPlac.Value;
                int asi1 = Convert.ToInt32(txtprimer.Value);
                int asi2 = Convert.ToInt32(txtsegund.Value);
                String mar = txtmarc.Value;
                int serv = Convert.ToInt32(select_servici.Value);
                Boolean resultado = false;
                resultado = neVehiculo.Instancia.RegistrarVehiculo(model, pla, asi1, asi2, mar, serv);
                if (resultado)
                {
                    Response.Redirect("frmMantenedorBus.aspx");
                }
                else
                {
                    lblMensajeGraba.Text = "Error";
                }

            }
            if (btnRegistrar.Text.Equals("Actualizar"))
            {
                int id = Convert.ToInt32(txtId.Text);
                String model = txtmodel.Value;
                String pla = txtPlac.Value;
                int asi1 = Convert.ToInt32(txtprimer.Value);
                int asi2 = Convert.ToInt32(txtsegund.Value);
                String mar = txtmarc.Value;
                String est = "a";
                int serv = Convert.ToInt32(select_servici.Value);
                Boolean resultado = false;
                resultado = neVehiculo.Instancia.spVehiculoModificar(id, model, pla, asi1, asi2, mar, est, serv);
                if (resultado)
                {
                    btnRegistrar.Text = "Guardar";
                    Response.Redirect("frmMantenedorBus.aspx");
                }
                else
                {
                    lblMensajeGraba.Text = "Error";
                }
            }
        }
    }
}