using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enUsuario
    {
        public int usu_id {get;set;}
        public String usu_user {get;set;}
        public String usu_pass {get;set;}
        public DateTime usu_fecRegistro {get;set;}
        public String usu_estado  {get;set;}
        public enPersona persona { get; set; }
    }
}
