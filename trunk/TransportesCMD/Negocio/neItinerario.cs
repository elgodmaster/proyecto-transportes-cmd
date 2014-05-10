using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Negocio
{
    public class neItinerario
    {
        public static List<enItinerario> itinerarioOrigenDestinoFechaLista(int prmIdOrigen, int prmIdDestino) {
            return daItinerario.itinerarioOrigenDestinoFechaLista(prmIdOrigen, prmIdDestino);
        }

        public static List<enItinerario> itinerarioOrigenDestinoFechaHoraLista(int prmIdOrigen, int prmIdDestino, String prmFecha) {
            return daItinerario.itinerarioOrigenDestinoFechaHoraLista( prmIdOrigen,  prmIdDestino,  prmFecha);
        }
    }
}
