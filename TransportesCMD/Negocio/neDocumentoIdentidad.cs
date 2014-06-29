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
        public static List<enDocumentoIdentidad> spDocumentoIdentidadLista()
        {
            return daDocumentoIdentidad.spDocumentoIdentidadLista();

        }
    }
}
