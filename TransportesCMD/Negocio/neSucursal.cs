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
        public static List<enSucursal> sucursalOrigenLista(String prmNomSucursal) {
            return daSucursal.sucursalOrigenLista(prmNomSucursal);
        }
        public static List<enSucursal> sucursalDestinoLista(int prmIdOrigen)
        {
            return daSucursal.sucursalDestinoLista(prmIdOrigen);
        }
    }
}
