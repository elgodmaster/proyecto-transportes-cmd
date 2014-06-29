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
    public partial class frmItinerarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                List<enSucursal> listaSucursales = new List<enSucursal>();
                listaSucursales = neSucursal.Instancia.sucursalLista();
                if (listaSucursales != null)
                {
                    idOrigen.DataSource = listaSucursales;
                    idOrigen.DataTextField = "suc_nombre";
                    idOrigen.DataValueField = "suc_id";
                    idOrigen.DataBind();

                }
            }
            catch (Exception)
            {

                throw;
            }


        }
    }
}