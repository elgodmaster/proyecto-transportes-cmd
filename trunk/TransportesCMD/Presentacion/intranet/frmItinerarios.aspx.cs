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


                    lstSucOrigen.DataSource = listaSucursales;
                    lstSucOrigen.DataTextField = "suc_nombre";
                    lstSucOrigen.DataValueField = "suc_id";
                    lstSucOrigen.DataBind();

                    lstSucDestino.DataSource = listaSucursales;
                    lstSucDestino.DataTextField = "suc_nombre";
                    lstSucDestino.DataValueField = "suc_id";
                    lstSucDestino.DataBind();
                }
            }
            catch (Exception)
            {
                
                throw;
            }

           
        }
    }
}