using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Entidades;
using Negocio;
using System.Web.Script.Serialization;

namespace Presentacion.intranet
{
    /// <summary>
    /// Descripción breve de wsRuta
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsRuta : System.Web.Services.WebService
    {

        [WebMethod]
        public String spRutasListarXIdSucursalOrigen(int prmIdSucursal)
        {

            List<enRuta> lst = new List<enRuta>();
            var json = "";
            try
            {
                lst = neRuta.Instancia.spRutasListarXIdSucursalOrigen(prmIdSucursal);
                var jsonSerialiser = new JavaScriptSerializer();
                json = jsonSerialiser.Serialize(lst);

            }
            catch (Exception)
            {

                throw;
            }

            return json;
        }
    }
}
