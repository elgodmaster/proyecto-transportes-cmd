using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enBoletoViaje
    {
        public int bolVia_id { get; set; }
        public String bolVia_fecha { get; set; }
        public int bolVia_estado { get; set; }
        public int bolVia_asiento { get; set; }
        public enPersona persona { get; set; }
        public enPersonal personal { get; set; }
        public enItinerario itinerario { get; set; }
        //public enControlAsiento controlAsiento  {get;set;}
        public enComprobanteSerie serie { get; set; }
        public enMensaje mensaje { get; set; }

    }
}
