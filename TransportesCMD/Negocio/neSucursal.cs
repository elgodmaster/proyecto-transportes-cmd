using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Negocio
{
    public class neSucursal
    {
        #region singleton
        private static readonly neSucursal _instancia = new neSucursal();
        public static neSucursal Instancia
        {
            get { return neSucursal._instancia; }
        }
        #endregion

        #region Métodos
        public List<enSucursal> sucursalLista()
        {
            try
            {
return daSucursal.sucursalLista();
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }

        public List<enSucursal> spIntinerarioOrigenXNombre(String prmNomSucursal)
        {
            try
            {
return daSucursal.spIntinerarioOrigenXNombre(prmNomSucursal);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }
        public List<enSucursal> spIntinerarioDestinoXIdOrigen(int prmIdOrigen)
        {
            try
            {
return daSucursal.spIntinerarioDestinoXIdOrigen(prmIdOrigen);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }
        public List<enSucursal> spListaSucursaAll()
        {
            try
            {
return daSucursal.spListaSucursaAll();
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }
        #endregion
    }
}
