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
    public partial class frmVentaPasaje1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<enSucursal> lstSucursal = new List<enSucursal>();
            // enviar vacio "" significa que va a devolver todo
            lstSucursal = neSucursal.spIntinerarioOrigenXNombre("");

            
        }
    }
}