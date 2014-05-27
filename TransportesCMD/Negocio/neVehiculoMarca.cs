using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades;
using Datos;
namespace Negocio
{
    public class neVehiculoMarca
    {
        daVehiculoMarca vehmar = new daVehiculoMarca();
        public List<enVehiculoMarca> ListaMarca()
        {
            return vehmar.ListaMarca();
        }
    }
}