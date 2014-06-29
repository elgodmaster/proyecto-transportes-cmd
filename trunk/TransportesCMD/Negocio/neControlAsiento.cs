using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Negocio
{
    public class neControlAsiento
    {
        public static List<enControlAsiento> spControlAsientoXIdItinerario(int prmIdItinerario)
        {
            return daControlAsiento.spControlAsientoXIdItinerario(prmIdItinerario);
        }

    }
}
