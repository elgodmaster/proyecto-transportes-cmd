using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Datos
{
    public class daVehiculo
    {

        public static Boolean RegistrarVehiculo(String modelo, String placa, int numasi1, int numasi2, String marca, int serviespe)
        {

            Boolean resultado = false;
            SqlConnection cn = null;
            SqlCommand cmd = new SqlCommand();
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spVehiculoRegistrar", cn);
                cmd.Parameters.AddWithValue("@veh_modelo", modelo);
                cmd.Parameters.AddWithValue("@veh_placa", placa);
                cmd.Parameters.AddWithValue("@veh_numAsiPrimer", numasi1);
                cmd.Parameters.AddWithValue("@veh_numAsiSegundo", numasi2);
                cmd.Parameters.AddWithValue("@veh_marca", marca);
                cmd.Parameters.AddWithValue("@serEspecial_id", serviespe);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                cmd.ExecuteNonQuery();
                resultado = true;
            }
            catch (Exception)
            {
                resultado = false;
            }
            finally
            {                
                cmd.Connection.Close();
                cn.Close();
            }
            return resultado;

        }
    }
}
