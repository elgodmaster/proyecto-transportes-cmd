using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enSucursal
    {
        public int suc_id {get;set;}
        public String suc_nombre {get;set;}
        public String suc_direccion {get;set;}
        public String suc_telefono  {get;set;}
        public enCiudad ciudad { get; set; }
    }
}
