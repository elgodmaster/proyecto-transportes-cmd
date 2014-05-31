using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Datos;
using Entidades;
namespace Negocio
{
    public class neVehiculo
    {
        #region singleton
        private static readonly neVehiculo _instancia = new neVehiculo();
        public static neVehiculo Instancia
        {
            get { return neVehiculo._instancia; }
        }
        #endregion

        #region Métodos
        public Boolean RegistrarVehiculo(String modelo, String placa, int numasi1, int numasi2, String marca, int serviespe)
        {
            return daVehiculo.RegistrarVehiculo(modelo, placa, numasi1, numasi2, marca, serviespe);
        }

        public List<enVehiculo> spVehiculoListar()
        {
            return daVehiculo.spVehiculoListar();
        }

        public List<enVehiculo> spVehiculoXid(int id)
        {
            return daVehiculo.spVehiculoXid(id);
        }

        public Boolean spVehiculoEliminar(int id)
        {
            return daVehiculo.spVehiculoEliminar(id);
        }

        public Boolean spVehiculoModificar(int id, String modelo, String placa, int numasi1, int numasi2, String marca, String estado, int serviespe)
        {
            
            return daVehiculo.spVehiculoModificar(id,modelo,placa,numasi1,numasi2,marca,estado, serviespe);
            
        }
        #endregion
    }
}
