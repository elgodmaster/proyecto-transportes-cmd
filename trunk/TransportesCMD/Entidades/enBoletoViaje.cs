using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enBoletoViaje
    {
        public int venPas_id {get;set;}        
        public DateTime venPas_fecha  {get;set;}
        public DateTime venPas_fecRegistro  {get;set;}
        public String venPas_estado  {get;set;}
        public enPersona cliente { get; set; }
        public enPersonal personal { get; set; }
        public enControlAsiento controlAsiento  {get;set;}
        public enComprobanteSerie serie { get; set; }
    }
}
