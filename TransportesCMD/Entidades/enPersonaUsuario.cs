using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enPersonaUsuario
    {
        public int perUsu_id {get;set;}
        public String perUsu_user {get;set;}
        public String perUsu_pass {get;set;}
        public DateTime perUsu_fecRegistro {get;set;}
        public String perUsu_estado  {get;set;}
        public enPersona persona { get; set; }
    }
}
