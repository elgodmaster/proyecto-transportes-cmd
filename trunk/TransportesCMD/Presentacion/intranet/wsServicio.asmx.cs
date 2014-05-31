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
    /// Descripción breve de wsServicio
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsServicio : System.Web.Services.WebService
    {

        [WebMethod]
        public List<enServicioEspecial> spServicioListar()
        {
            List<enServicioEspecial> lstServicio = new List<enServicioEspecial>();
            // enviar vacio "" significa que va a devolver todo
            lstServicio = neServicioEspecial.Instancia.spServicioListar();
            return lstServicio;
        }
    }
}
