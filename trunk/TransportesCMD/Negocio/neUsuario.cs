using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Negocio
{
    public class neUsuario
    {
        public static enUsuario spUsuarioLogin(enUsuario prmUsuario) {
            return daUsuario.spUsuarioLogin(prmUsuario);
        }
    }
}
