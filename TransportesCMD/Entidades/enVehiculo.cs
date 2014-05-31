using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enVehiculo
    {
        public int veh_id {get;set;}
        public String veh_placa { get; set; }
        public String veh_modelo {get;set;}
        public int veh_numAsiPrimer {get;set;}
        public int veh_numAsiSegundo {get;set;}
        public int veh_totAsientos { get; set; }
        public String veh_img {get;set;}
        public DateTime veh_fecRegistro {get;set;}
        public String veh_estado { get; set; }
        public String vehiculoMarca { get; set; }
        public enServicioEspecial servicioEspecial { get; set; }
    }
}
