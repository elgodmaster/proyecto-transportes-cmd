using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enOrdenTraslado
    {
        public int ordTra_id { get; set; }
        public DateTime ordTra_fecEnvio { get; set; }
        public DateTime ordTra_fecEntrega { get; set; }
        public DateTime ordTra_fecRegistro { get; set; }
        public int ordTra_estado { get; set; }
        public enSucursal sucursalOrigen { get; set; }
        public enSucursal sucursalDestino { get; set; }
        public enPersona remitente { get; set; }
        public enPersona destinatario { get; set; }
        public enPersonal personal { get; set; }
        public enComprobanteSerie serie { get; set; }
    }
}
