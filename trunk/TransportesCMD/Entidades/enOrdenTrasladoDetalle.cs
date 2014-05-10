using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enOrdenTrasladoDetalle
    {
        public int ordTraDet_id {get;set;}
        public int ordTraDet_cantidad {get;set;}
        public String ordTraDet_descripcion {get;set;}
        public Double ordTraDet_importe {get;set;}
        public enOrdenTraslado ordenTraslado { get; set; }
    }
}
