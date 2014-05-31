using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Datos;
using Entidades;
namespace Negocio
{
    public class neVehiculo
    {

        public static Boolean RegistrarVehiculo(String modelo, String placa, int numasi1, int numasi2, String marca, int serviespe)
        {
            return daVehiculo.RegistrarVehiculo(modelo, placa, numasi1, numasi2, marca, serviespe);
        }
    }
}
