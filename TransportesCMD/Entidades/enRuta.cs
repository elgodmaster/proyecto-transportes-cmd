using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enRuta
    {
        public int rut_id { get; set; }
        public String rut_horSalida { get; set; }
        public int rut_horViaje { get; set; }
        public int rut_estado { get; set; }
        public enSucursal origen { get; set; }
        public enSucursal destino { get; set; }
        public enMensaje mensaje { get; set; }
    }
}
