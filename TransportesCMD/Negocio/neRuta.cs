using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Negocio
{
    public class neRuta
    {
        #region singleton
        private static readonly neRuta _instancia = new neRuta();
        public static neRuta Instancia
        {
            get { return neRuta._instancia; }
        }
        #endregion

        #region Métodos
        public enRuta registrarRuta(enRuta prmRuta)
        {
            try
            {
return daRuta.Instancia.registrarRuta(prmRuta);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }

        public List<enRuta> spRutasListarXIdSucursalOrigen(int prmIdSucursal)
        {
            try
            {
return daRuta.Instancia.spRutasListarXIdSucursalOrigen(prmIdSucursal);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }

        #endregion
    }
}
