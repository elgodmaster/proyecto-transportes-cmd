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
        public static List<enSucursal> spIntinerarioOrigenXNombre(String prmNomSucursal) {
            return daSucursal.spIntinerarioOrigenXNombre(prmNomSucursal);
        }
        public static List<enSucursal> spIntinerarioDestinoXIdOrigen(int prmIdOrigen)
        {
            return daSucursal.spIntinerarioDestinoXIdOrigen(prmIdOrigen);
        }
    }
}
