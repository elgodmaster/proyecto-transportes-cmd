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

        #region singleton
        private static readonly neServicioEspecial _instancia = new neServicioEspecial();
        public static neServicioEspecial Instancia
        {
            get { return neServicioEspecial._instancia; }
        }
        #endregion

        #region metodos
        public static Boolean RegistrarServicioEspecial(String nombre, String caracteristicas, int ser_est)
        {
            return daServicio.RegistrarServicioEspecial(nombre, caracteristicas, ser_est);
        }

        public List<enServicioEspecial> spServicioListar()
        {
            return daServicio.spServicioListar();
        }

        public List<enServicioEspecial> spServicioXid(int id)
        {
            return daServicio.spServicioXid(id);
        }

        public Boolean spServicioEliminar(int id)
        {
            return daServicio.spServicioEliminar(id);
        }

        public Boolean spServicioModificar(int id, String nombre, String caracteristicas, String estado)
        {

            return daServicio.spServicioModificar(id, nombre, caracteristicas, estado);

        }
        #endregion
    }
}
