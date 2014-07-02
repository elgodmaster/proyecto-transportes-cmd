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
        public Boolean RegistrarServicioEspecial(String nombre, String caracteristicas)
        {
            try
            {
return daServicio.RegistrarServicioEspecial(nombre, caracteristicas);
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }

        public List<enServicioEspecial> spServicioListar()
        {
            try
            {
return daServicio.spServicioListar();
            }
            catch (Exception e)
            {

                throw e;
            }
            
        }

        public List<enServicioEspecial> spServicioXid(int id)
        {
            try
            {return daServicio.spServicioXid(id);

            }
            catch (Exception e)
            {

                throw e;
            }
            
        }

        public Boolean spServicioEliminar(int id)
        {
            try
            {
 return daServicio.spServicioEliminar(id);
            }
            catch (Exception e)
            {

                throw e;
            }
           
        }

        public Boolean spServicioModificar(int id, String nombre, String caracteristicas, String estado)
        {
            try
            {
return daServicio.spServicioModificar(id, nombre, caracteristicas, estado);
            }
            catch (Exception e)
            {

                throw e;
            }
            

        }
        #endregion
    }
}
