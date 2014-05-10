using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Entidades;
using Negocio;

namespace Presentacion.intranet
{
    /// <summary>
    /// Descripción breve de wsVentaPasaje
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsVentaPasaje : System.Web.Services.WebService
    {

        [WebMethod]
        public List<enSucursal> sucursalOrigenLista()
        {
            List<enSucursal> lstSucursal = new List<enSucursal>();
            // enviar vacio "" significa que va a devolver todo
            lstSucursal = neSucursal.sucursalOrigenLista("");
            return lstSucursal;
        }

        [WebMethod]
        public List<enSucursal> sucursalDestinoLista(int prmIdOrigen)
        {
            List<enSucursal> lstSucursal = new List<enSucursal>();
            // enviar la id de la sucursal que se selecciono como origen
            lstSucursal = neSucursal.sucursalDestinoLista(prmIdOrigen);
            return lstSucursal;
        }

        [WebMethod]
        public List<enItinerario> itinerarioOrigenDestinoFechaLista(int prmIdOrigen, int prmIdDestino)
        {
            List<enItinerario> lstItinerario = new List<enItinerario>();
            // enviar las fechas del itinerario
            lstItinerario = neItinerario.itinerarioOrigenDestinoFechaLista(prmIdOrigen, prmIdDestino);
            return lstItinerario;
        }
        [WebMethod]
        public List<enItinerario> itinerarioOrigenDestinoFechaHoraLista(int prmIdOrigen, int prmIdDestino, String prmFecha)
        {
            List<enItinerario> lstItinerario = new List<enItinerario>();
            // enviar la id de la sucursal que se selecciono como origen
            lstItinerario = neItinerario.itinerarioOrigenDestinoFechaHoraLista(prmIdOrigen, prmIdDestino, prmFecha);
            return lstItinerario;
        }
        
    }
}
