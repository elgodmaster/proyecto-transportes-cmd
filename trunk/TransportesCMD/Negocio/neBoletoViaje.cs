using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
namespace Negocio
{
    public class neBoletoViaje
    {
        public static List<enBoletoViaje> spBoletoViajeRegistro(int prmAsiento, int prmIdPersona, int prmIdPersonal, int prmIdItinerario, int prmIdSucursal)
        { 
            return daBoletoViaje.spBoletoViajeRegistro(prmAsiento, prmIdPersona, prmIdPersonal, prmIdItinerario, prmIdSucursal);
        }
    }
}
