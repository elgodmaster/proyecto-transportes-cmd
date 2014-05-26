using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enBoletoViaje
    {
        public int bolVia_id {get;set;}
        public int bolVia_asiento { get; set; }
        public DateTime bolVia_fecRegistro  {get;set;}
        public String bolVia_estado  {get;set;}
        public enPersona persona { get; set; }
        public enPersonal personal { get; set; }
        public enItinerario itinerario { get; set; }
        public enControlAsiento controlAsiento  {get;set;}
        public enComprobanteSerie serie { get; set; }
    }
}
