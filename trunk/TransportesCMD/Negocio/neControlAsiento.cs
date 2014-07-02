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
        #region singleton
        private static readonly neControlAsiento _instancia = new neControlAsiento();

        public static neControlAsiento Instancia
        {
            get { return neControlAsiento._instancia; }
        }
        #endregion

        #region Métodos
        public List<enControlAsiento> spControlAsientoXIdItinerario(int prmIdItinerario)
        {
            try
            {
return daControlAsiento.Instancia.spControlAsientoXIdItinerario(prmIdItinerario);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }
        #endregion

    }
}
