using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class enOrdenTraslado
    {
        public int ordTra_id {get;set;}
        public DateTime ordTra_fecEnvio {get;set;}
        public DateTime ordTra_fecEntrega {get;set;}
        public int ordTra_origen_id  {get;set;}
        public int ordTra_destino_id  {get;set;}
        public int ordTra_remitente_id  {get;set;}
        public int ordTra_destinatario_id  {get;set;}
        public DateTime ordTra_fecRegistro {get;set;}
        public int ordTra_estado {get;set;}
        public enPersonaPersonal personal  {get;set;}
        public enOrdenTrasladoSerie serie { get; set; }
    }
}
