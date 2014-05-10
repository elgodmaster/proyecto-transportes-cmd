using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enCiudad
    {
        public int ciu_id {get;set;}
        public String ciu_nomCiudad {get;set;}
        public DateTime ciu_fecRegistro {get;set;}
        public String ciu_estado {get;set;}
        public enDepartamento departamento { get; set; }
    }
}
