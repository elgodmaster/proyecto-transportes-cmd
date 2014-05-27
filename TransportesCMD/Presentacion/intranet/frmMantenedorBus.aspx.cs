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

        protected void cboMarca_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboMarca_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            String model = txtmodel.Value;
            String pla = txtPlac.Value;
            int asi1= Convert.ToInt32(txtprimer.Value);
            int asi2 = Convert.ToInt32(txtsegund.Value);
            int mar = Convert.ToInt32(select_marc.Value);
            int serv = Convert.ToInt32(select_servici.Value);
            Boolean resultado = false;
            resultado = neVehiculo.RegistrarVehiculo(model, pla, asi1,asi2,mar, serv);
        }

    }
}