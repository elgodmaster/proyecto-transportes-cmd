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
        #region singleton
        private static readonly neItinerario _instancia = new neItinerario();

        public static neItinerario Instancia
        {
            get { return neItinerario._instancia; }
        }
        #endregion

        #region Métodos
        public  List<enItinerario> spIntinerarioFechaSalidaXIdOrigenIdDestino(int prmIdOrigen, int prmIdDestino)
        {
            try
            {
return daItinerario.Instancia.spIntinerarioFechaSalidaXIdOrigenIdDestino(prmIdOrigen, prmIdDestino);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }

        public  List<enItinerario> spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(int prmIdOrigen, int prmIdDestino, String prmFecha)
        {
            try
            {
 return daItinerario.Instancia.spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(prmIdOrigen, prmIdDestino, prmFecha);
            }
            catch (Exception e)
            {

                throw e;
            }
           
        }
        public  List<enItinerario> spIntinerarioResumenXIdOrigenIdDestinoFecha(int prmIdOrigen, int prmIdDestino, String prmFecha)
        {
            try
            {
return daItinerario.Instancia.spIntinerarioResumenXIdOrigenIdDestinoFecha(prmIdOrigen, prmIdDestino, prmFecha);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }
        #endregion
    }
}
