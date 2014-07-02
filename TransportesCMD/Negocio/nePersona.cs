using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Negocio
{
    public class nePersona
    {

        #region singleton
        private static readonly nePersona _instancia = new nePersona();

        public static nePersona Instancia
        {
            get { return nePersona._instancia; }
        }
        #endregion

        #region Métodos
        public List<enPersona> spPersonaXNumeroDocumentoIdentidad(String prmNumDocIde)
        {
            return daPersona.spPersonaXNumeroDocumentoIdentidad(prmNumDocIde);
        }

        public List<enPersona> spPersonaXApellidos(String nomApellidos)
        {
            try
            {
                return daPersona.spPersonaXApellidos(nomApellidos);
            }
            catch (Exception e)
            {
                throw e;
            }

        }
        #endregion
    }
}
