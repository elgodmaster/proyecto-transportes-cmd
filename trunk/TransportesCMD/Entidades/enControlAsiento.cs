using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enControlAsiento
    {
        public int conAsi_id {get;set;}
        public int conAsi_control {get;set;}
        public int conAsi_piso  {get;set;}
        public int conAsi_numAsiento  {get;set;}
        public String conAsi_estAsiento  {get;set;}
        public enItinerario itinerario { get; set; }
    }
}
