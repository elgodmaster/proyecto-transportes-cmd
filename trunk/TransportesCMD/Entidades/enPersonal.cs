using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enPersonal
    {

        public int perPer_id {get;set;}
        public String perPer_estCivil  {get;set;}
        public DateTime perPer_fecContrato  {get;set;}
        public DateTime perPer_fecFinContrato { get; set; }
        public DateTime perPer_fecRegistro { get; set; }
        public String perPer_estado  {get;set;}
        public enCargo cargo {get;set;}
        public enPersona persona {get;set;}
        public enSucursal sucursal  {get;set;}

    }
}
