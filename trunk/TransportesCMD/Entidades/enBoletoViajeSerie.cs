using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enBoletoViajeSerie
    {
        public int bolViaSer_id {get;set;}
        public int bolViaSer_serie {get;set;}
        public int bolViaSer_numero {get;set;}
        public enSucursal sucursal { get; set; }
    }
}
