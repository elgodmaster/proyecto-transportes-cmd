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

        public String RegistrarVehiculo(enVehiculo objveh)
        {

            String rpta = "";
            SqlConnection cn = null;
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spVehiculoRegistrar";
                cmd.Connection = cn;
                {
                    cmd.Parameters.AddWithValue("@veh_modelo", objveh.veh_modelo);
                    cmd.Parameters.AddWithValue("@veh_placa", objveh.veh_placa);
                    cmd.Parameters.AddWithValue("@veh_numAsiPrimer", objveh.veh_numAsiPrimer);
                    cmd.Parameters.AddWithValue("@veh_numAsiSegundo", objveh.veh_numAsiSegundo);
                    cmd.Parameters.AddWithValue("@vehMarca_id", objveh.vehiculoMarca);
                    cmd.Parameters.AddWithValue("@serEspecial_id", objveh.servicioEspecial);
                }
                cn.Open();
                int registro;
                registro = cmd.ExecuteNonQuery();
                if (registro == 1)
                {
                    rpta = "ok";
                }
                else
                {
                    rpta = "Error";
                }
            }
            catch (Exception e)
            {
                System.Console.Write(e.Message);
            }
            return rpta;

        }
    }
}
