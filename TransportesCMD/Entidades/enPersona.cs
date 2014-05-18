using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enPersona
    {
        public int per_id {get;set;}
        public String per_nombres {get;set;}
        public String per_apellidos { get; set; }
        public String per_numDocIdentidad { get; set; }
        public String per_fecNacimiento { get; set; }
        public String per_telefono { get; set; }
        public String per_sexo { get; set; }
        public String per_direccion { get; set; }
        public String per_email { get; set; }
        public String per_img { get; set; }
        public DateTime per_fecRegistro {get;set;}
        public String per_estado { get; set; }
        public enDocumentoIdentidad documentoIdentidad { get; set; }
    }
}
