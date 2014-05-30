using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enPersonal
    {

        public int per_id {get;set;}
        public String per_estCivil  {get;set;}
        public DateTime per_fecContrato  {get;set;}
        public DateTime per_fecFinContrato { get; set; }
        public DateTime per_fecRegistro { get; set; }
        public String per_estado  {get;set;}
        public enCargo cargo {get;set;}
        public enPersona persona {get;set;}
        public enSucursal sucursal  {get;set;}

    }
}
