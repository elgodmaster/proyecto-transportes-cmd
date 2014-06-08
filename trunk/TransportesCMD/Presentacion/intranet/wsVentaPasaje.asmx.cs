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
            //enviar vacio "" significa que va a devolver todo
            lstSucursal = neSucursal.spIntinerarioOrigenXNombre("");
            return lstSucursal;
        }

        [WebMethod]
        public List<enSucursal> spIntinerarioDestinoXIdOrigen(int prmIdOrigen)
        {
            List<enSucursal> lstSucursal = new List<enSucursal>();
            //enviar la id de la sucursal que se selecciono como origen
            lstSucursal = neSucursal.spIntinerarioDestinoXIdOrigen(prmIdOrigen);
            return lstSucursal;
        }

        [WebMethod]
        public List<enItinerario> spIntinerarioFechaSalidaXIdOrigenIdDestino(int prmIdOrigen, int prmIdDestino)
        {
            List<enItinerario> lstItinerario = new List<enItinerario>();
            //enviar las fechas del itinerario
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
        public List<enDocumentoIdentidad> longitudNumeroDocumentoIdentidad(int prmIdDocIdentidad)
        {
            List<enDocumentoIdentidad> lstDocIdentidad = new List<enDocumentoIdentidad>();
            List<enDocumentoIdentidad> lstReturn = new List<enDocumentoIdentidad>();
            lstDocIdentidad = neDocumentoIdentidad.spDocumentoIdentidadLista();
            for (int i = 0; i < lstDocIdentidad.Count; i++)
            {
                if (lstDocIdentidad[i].docIde_id == prmIdDocIdentidad)
                {
                    enDocumentoIdentidad doc = new enDocumentoIdentidad();
                    doc = lstDocIdentidad[i];
                    lstReturn.Add(doc);
                    break;
                }
            }
            return lstReturn;
        }


        [WebMethod]
        public List<enPersona> spPersonaXNumeroDocumentoIdentidad(String prmNumDocIde)
        {
            List<enPersona> lsPersona = new List<enPersona>();
            lsPersona = nePersona.spPersonaXNumeroDocumentoIdentidad(prmNumDocIde);
            if (lsPersona.Count > 0)
            {
                lsPersona[0].personaMensaje = "¡Cliente Nuestro!";  
            }
            else {
                enPersona persona = new enPersona();
                persona.personaMensaje = "¡Nuevo Cliente!";
                lsPersona.Add(persona);
            }
            return lsPersona;
        }


        [WebMethod]
        public List<enPersona> spPersonaXApellidos(String apellidos)
        {
            List<enPersona> lsPersona = new List<enPersona>();
            lsPersona = nePersona.spPersonaXApellidos(apellidos);            
            return lsPersona;
        }

        [WebMethod(EnableSession = true)]
        public List<enBoletoViaje> spBoletoViajeRegistro(int prmAsiento, int prmIdPersona, int prmIdItinerario)
        {
            List<enBoletoViaje> lstBolVia = new List<enBoletoViaje>();
            enUsuario usuario = new enUsuario();
            usuario = (enUsuario)Session["usuario"];

            lstBolVia = neBoletoViaje.spBoletoViajeRegistro(prmAsiento, prmIdPersona,usuario.personal.per_id , prmIdItinerario);
            return lstBolVia;
        }


         //cmd.Parameters.AddWithValue("@per_nombres", prmPersona.per_nombres);
         //       cmd.Parameters.AddWithValue("@per_apellidos", prmPersona.per_apellidos);
         //       cmd.Parameters.AddWithValue("@per_numDocIdentidad", prmPersona.per_numDocIdentidad);
         //       cmd.Parameters.AddWithValue("@per_fecNacimiento", prmPersona.per_fecNacimiento);
         //       cmd.Parameters.AddWithValue("@per_sexo", prmPersona.per_sexo);
         //       cmd.Parameters.AddWithValue("@docIdentidad_id", prmPersona.documentoIdentidad.docIde_id);

        [WebMethod(EnableSession = true)]
        public List<enBoletoViaje> spBoletoViajeRegistroPersona(
            int prmAsiento, 
            String per_nombres, 
            String per_apellidos, 
            String per_numDocIdentidad,
            String per_fecNacimiento, 
            String per_sexo, 
            int docIdentidad_id, 
            int prmIdItinerario)
        {
            enPersona persona = new enPersona();
            persona.per_nombres = per_nombres;
            persona.per_apellidos = per_apellidos;
            persona.per_numDocIdentidad = per_numDocIdentidad;
            persona.per_fecNacimiento = per_fecNacimiento;
            persona.per_sexo = per_sexo;
            enDocumentoIdentidad documento = new enDocumentoIdentidad();
            documento.docIde_id = docIdentidad_id;

            persona.documentoIdentidad = documento;

            List<enBoletoViaje> lstBolVia = new List<enBoletoViaje>();
            enUsuario usuario = new enUsuario();
            usuario = (enUsuario)Session["usuario"];

            lstBolVia = neBoletoViaje.spBoletoViajeRegistroPersona(prmAsiento, prmIdItinerario, usuario.personal.per_id,  persona);
            return lstBolVia;
        }
        
        
        
        
    }
}
