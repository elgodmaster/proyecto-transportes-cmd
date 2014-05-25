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
        daVehiculo vehidao = new daVehiculo();

        public String RegistroVehiculo(enVehiculo objveh)
        {
            return vehidao.RegistrarVehiculo(objveh);
        }
    }
}
