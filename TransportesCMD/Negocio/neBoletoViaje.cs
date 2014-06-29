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

        #region Metodos
        public List<enBoletoViaje> spBoletoViajeRegistro(int prmAsiento, int prmIdPersona, int prmIdPersonal, int prmIdItinerario)
        {
            return daBoletoViaje.Instancia.spBoletoViajeRegistro(prmAsiento, prmIdPersona, prmIdPersonal, prmIdItinerario);
        }
        public List<enBoletoViaje> spBoletoViajeRegistroPersona(int prmAsiento, int prmIdItinerario, int prmIdPersonal, enPersona prmPersona)
        {
            return daBoletoViaje.Instancia.spBoletoViajeRegistroPersona(prmAsiento, prmIdItinerario, prmIdPersonal, prmPersona);
        }
        #endregion
    }
}
