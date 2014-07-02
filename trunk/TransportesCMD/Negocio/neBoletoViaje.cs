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

        #region singleton
        private static readonly neBoletoViaje _instancia = new neBoletoViaje();
        //private datCliente();
        public static neBoletoViaje Instancia
        {
            get { return neBoletoViaje._instancia; }
        }
        #endregion

        #region Métodos
        public List<enBoletoViaje> spBoletoViajeRegistro(int prmAsiento, int prmIdPersona, int prmIdPersonal, int prmIdItinerario)
        {
            try
            {
return daBoletoViaje.Instancia.spBoletoViajeRegistro(prmAsiento, prmIdPersona, prmIdPersonal, prmIdItinerario);
            }
            catch (Exception e)
            {
                
                throw e;
            }
            
        }
        public List<enBoletoViaje> spBoletoViajeRegistroPersona(int prmAsiento, int prmIdItinerario, int prmIdPersonal, enPersona prmPersona)
        {
            try
            {
return daBoletoViaje.Instancia.spBoletoViajeRegistroPersona(prmAsiento, prmIdItinerario, prmIdPersonal, prmPersona);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }
        #endregion
    }
}
