using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Presentacion.intranet
{
    public partial class frmRuta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    List<enSucursal> listaSucursales = new List<enSucursal>();
                    listaSucursales = neSucursal.Instancia.spListaSucursaAll();
                    if (listaSucursales != null)
                    {
                        lstOrigen.DataSource = listaSucursales;
                        lstOrigen.DataTextField = "suc_nombre";
                        lstOrigen.DataValueField = "suc_id";
                        lstOrigen.DataBind();

                        lstDestino.DataSource = listaSucursales;
                        lstDestino.DataTextField = "suc_nombre";
                        lstDestino.DataValueField = "suc_id";
                        lstDestino.DataBind();
                    }
                }
                catch (Exception x)
                {

                    Response.Write(@"<script languaje='javascript'>alert('" + x.Message + "');</script>");
                }
            }

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                enRuta prmRuta = new enRuta();
                enSucursal origen = new enSucursal();
                enSucursal destino = new enSucursal();
                origen.suc_id = Convert.ToInt32(lstOrigen.SelectedValue);
                prmRuta.origen = origen;
                destino.suc_id = Convert.ToInt32(lstDestino.SelectedValue);
                prmRuta.destino = destino;
                prmRuta.rut_horSalida = txtHorSalida.Value;
                prmRuta.rut_horViaje = Convert.ToInt32(txtHorasViaje.Value);

                enRuta ruta = new enRuta();
                ruta = neRuta.Instancia.registrarRuta(prmRuta);

                divAlert.InnerHtml = "<script languaje='javascript'>$(document).ready(function () { $('#mensajeRuta').html(''); $('#mensajeRuta').html('" + ruta.mensaje.mensaje + "'); $('#myModal').modal('show'); });</script> ";

            }
            catch (Exception x)
            {

                Response.Write(@"<script languaje='javascript'>alert('" + x.Message + "');</script>");
            }



        }
    }
}