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
            return daSucursal.sucursalLista();
        }

        public static List<enSucursal> spIntinerarioOrigenXNombre(String prmNomSucursal)
        {
            return daSucursal.spIntinerarioOrigenXNombre(prmNomSucursal);
        }
        public static List<enSucursal> spIntinerarioDestinoXIdOrigen(int prmIdOrigen)
        {
            return daSucursal.spIntinerarioDestinoXIdOrigen(prmIdOrigen);
        }
        public List<enSucursal> spListaSucursaAll()
        {
            return daSucursal.spListaSucursaAll();
        }
        #endregion
    }
}
