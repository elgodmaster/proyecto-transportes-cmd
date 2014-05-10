using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enItinerarioPersonaPersonal
    {
        public int itiPerPer_id {get;set;}
        public DateTime itiPerPer_fecRegistro {get;set;}
        public String itiPerPer_estado  {get;set;}
        public enPersonaPersonal personal  {get;set;}
        public enItinerario itinerario { get; set; }
    }
}
