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
        #region singleton
        private static readonly neUsuario _instancia = new neUsuario();
        public static neUsuario Instancia
        {
            get { return neUsuario._instancia; }
        }
        #endregion

        #region Métodos
        public enUsuario spUsuarioLogin(enUsuario prmUsuario)
        {
            try
            {
return daUsuario.spUsuarioLogin(prmUsuario);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }
        #endregion
    }
}
