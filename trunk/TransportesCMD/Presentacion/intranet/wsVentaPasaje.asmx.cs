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
        public List<enSucursal> spIntinerarioOrigenXNombre()
        {
            List<enSucursal> lstSucursal = new List<enSucursal>();
            // enviar vacio "" significa que va a devolver todo
            lstSucursal = neSucursal.spIntinerarioOrigenXNombre("");
            return lstSucursal;
        }

        [WebMethod]
        public List<enSucursal> spIntinerarioDestinoXIdOrigen(int prmIdOrigen)
        {
            List<enSucursal> lstSucursal = new List<enSucursal>();
            // enviar la id de la sucursal que se selecciono como origen
            lstSucursal = neSucursal.spIntinerarioDestinoXIdOrigen(prmIdOrigen);
            return lstSucursal;
        }

        [WebMethod]
        public List<enItinerario> spIntinerarioFechaSalidaXIdOrigenIdDestino(int prmIdOrigen, int prmIdDestino)
        {
            List<enItinerario> lstItinerario = new List<enItinerario>();
            // enviar las fechas del itinerario
            lstItinerario = neItinerario.spIntinerarioFechaSalidaXIdOrigenIdDestino(prmIdOrigen, prmIdDestino);
            return lstItinerario;
        }
        [WebMethod]
        public List<enItinerario> spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(int prmIdOrigen, int prmIdDestino, String prmFecha)
        {
            List<enItinerario> lstItinerario = new List<enItinerario>();
            // enviar la id de la sucursal que se selecciono como origen
            lstItinerario = neItinerario.spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(prmIdOrigen, prmIdDestino, prmFecha);
            return lstItinerario;
        }

        [WebMethod]
        public List<enItinerario> spIntinerarioResumenXIdOrigenIdDestinoFecha(int prmIdOrigen, int prmIdDestino, String prmFecha)
        {
            List<enItinerario> lstItinerario = new List<enItinerario>();
            // enviar la id de la sucursal que se selecciono como origen
            lstItinerario = neItinerario.spIntinerarioResumenXIdOrigenIdDestinoFecha(prmIdOrigen, prmIdDestino, prmFecha);
            return lstItinerario;
        }

        [WebMethod]
        public List<enControlAsiento> spControlAsientoXIdItinerario(int prmIdItinerario)
        {
            List<enControlAsiento> lstControlAsiento = new List<enControlAsiento>();
            lstControlAsiento = neControlAsiento.spControlAsientoXIdItinerario(prmIdItinerario);
            return lstControlAsiento;
        }

        [WebMethod]
        public List<enDocumentoIdentidad> spDocumentoIdentidadLista()
        {
            List<enDocumentoIdentidad> lstDocIdentidad = new List<enDocumentoIdentidad>();
            lstDocIdentidad = neDocumentoIdentidad.spDocumentoIdentidadLista();
            return lstDocIdentidad;
        }

        [WebMethod]
        public List<enPersona> spPersonaXNumeroTipoDocumentoIdentidad(String prmNumDocIde, int idTipDoc)
        {
            List<enPersona> lsPersona = new List<enPersona>();
            lsPersona = nePersona.spPersonaXNumeroTipoDocumentoIdentidad(prmNumDocIde, idTipDoc);
            if (lsPersona.Count > 0)
            {
                lsPersona[0].personaMensaje = "¡Cliente Nuestro!";  
            }
            else {
                enPersona persona = new enPersona();
                persona.personaMensaje = "¡Nuevo Cliente1";
                lsPersona.Add(persona);
            }
            return lsPersona;
        }

        
        
        
    }
}
