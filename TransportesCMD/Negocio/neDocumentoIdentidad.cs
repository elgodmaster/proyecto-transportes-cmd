using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
namespace Negocio
{
    public class neDocumentoIdentidad
    {
        #region singleton
        private static readonly neDocumentoIdentidad _instancia = new neDocumentoIdentidad();

        public static neDocumentoIdentidad Instancia
        {
            get { return neDocumentoIdentidad._instancia; }
        }
        #endregion

        #region Métodos
        public List<enDocumentoIdentidad> spDocumentoIdentidadLista()
        { try
            {
return daDocumentoIdentidad.Instancia.spDocumentoIdentidadLista();
            }
            catch (Exception e)
            {
                
                throw e;
            }
            

        }
     #endregion
    
   
    }
}
