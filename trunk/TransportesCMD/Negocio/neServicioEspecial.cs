using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Datos;
using Entidades;

namespace Negocio
{
    public class neServicioEspecial
    {
        public static Boolean RegistrarServicioEspecial(String nombre, String caracteristicas, int ser_est)
        {
            return daServicio.RegistrarServicioEspecial(nombre, caracteristicas, ser_est);
        }
    }
}
