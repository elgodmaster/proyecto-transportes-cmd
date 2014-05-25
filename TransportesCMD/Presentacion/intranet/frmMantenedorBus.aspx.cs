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

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            String rpta = "";
            enVehiculo objveh = new enVehiculo();
            neVehiculo neveh = new neVehiculo();

            objveh.veh_modelo = txtmodelo.Text;
            objveh.veh_placa = txtplaca.Text;
            objveh.veh_numAsiPrimer =Convert.ToInt32(txt1piso.Text);
            objveh.veh_numAsiSegundo = Convert.ToInt32(txt2piso.Text);
            //objveh.vehiculoMarca = Convert.ToString(txtmarca.Text);
            //objveh.servicioEspecial = Convert.ToInt32(txtservespecial.Text);

            //rpta = neveh.RegistroVehiculo(objveh);
            //if (rpta == "ok")
            //{
            //    Response.Redirect("Logeo.aspx");
            //}
            //else
            //{
            //    Response.Redirect("frmMantenedorBus.aspx");
            //}


            neveh.RegistroVehiculo(objveh);
            lblMensajeGraba.Visible = true;
            lblMensajeGraba.Text = "Vehiculo Registrado";
        }
    }
}