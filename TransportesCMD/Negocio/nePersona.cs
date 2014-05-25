using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Negocio
{
    public class nePersona
    {
        public static List<enPersona> spPersonaXNumeroDocumentoIdentidad(String prmNumDocIde)
        {
            return daPersona.spPersonaXNumeroDocumentoIdentidad(prmNumDocIde);
        }

        public static List<enPersona> spPersonaXApellidos(String nomApellidos)
        {
            try {
                return daPersona.spPersonaXApellidos(nomApellidos);
            }catch(Exception e){
                throw e;
            }
           
        }
    }
}
