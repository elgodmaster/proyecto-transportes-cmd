﻿using System;
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
        public static List<enPersona> spPersonaXNumeroTipoDocumentoIdentidad(String prmNumDocIde, int idTipDoc)
        {
            return daPersona.spPersonaXNumeroTipoDocumentoIdentidad(prmNumDocIde, idTipDoc);
        }
    }
}
