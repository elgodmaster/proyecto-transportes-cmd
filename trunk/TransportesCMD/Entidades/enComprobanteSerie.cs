using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enComprobanteSerie
    {
        public int comSer_id { get; set; }
        public int comSer_serie { get; set; }
        public int comSer_correlativo { get; set; }
        public enComprobante comprobante { get; set; }
        public enSucursal sucursal { get; set; }
    }
}
