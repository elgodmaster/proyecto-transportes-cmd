using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enItinerario
    {
        public int iti_id {get;set;}
        public String iti_fecSalida { get; set; }
        public String iti_horSalida  {get;set;}
        public String iti_horLlegada { get; set; }
        public double iti_precio { get; set; }

        public DateTime iti_fecRegistro  {get;set;}
        public int iti_estado  {get;set;}
        public enSucursal sucursalOrigen { get; set; }
        public enSucursal sucursalDestino { get; set; }
        public enVehiculo vehiculo { get; set; }
        public enPersonal personal { get; set; }
    }
}
